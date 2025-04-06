#include "BossStage.h"
#include "enemySprite.h"
#include "gba.h"
#include "mode0.h"
#include "bossBGTest.h"           // map
#include "singleLayerJungle.h"    // tiles
#include "sprites.h"
#include "spritesheet.h"
#include "player.h"
#include "boss.h"
#include "fireball.h"
#include "slash.h"

// Global camera offsets.
int hOff, vOff;

// Add global variables to control the sword slash state.
static int slashActive = 0;
static int slashTimer = 0;

void initBossStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    // Load background into CHARBLOCK[0] and map into SCREENBLOCK[27]
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | BG_4BPP;

    DMANow(3, singleLayerJunglePal, BG_PALETTE, singleLayerJunglePalLen / 2);
    DMANow(3, singleLayerJungleTiles, &CHARBLOCK[0], singleLayerJungleTilesLen / 2);
    DMANow(3, bossBGTestMap, &SCREENBLOCK[27], bossBGTestLen / 2);
    
    initPlayer();
    initBoss();
    initFireballs();
    
    player.x = 200;
    player.y = 100;
    collisionEnabled = 0;
    
    // Ensure the sword slash is off.
    slashActive = 0;
    slashTimer = 0;
}

void updateBossStage(void) {
    updatePlayer();
    updateBoss();
    updateFireballs();
    updateSlash();
    
    // Clamp player's position.
    if (player.x < 0) player.x = 0;
    if (player.x > SCREENWIDTH - player.width) player.x = SCREENWIDTH - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > SCREENHEIGHT - player.height) player.y = SCREENHEIGHT - player.height;
    
    // Check collision between player and boss.
    if (collision(player.x, player.y, player.width, player.height,
                  boss.x, boss.y, boss.width, boss.height)) {
        player.health -= 20;
        if (player.health <= 0) {
            player.health = 0;
            goToLose();
        }
    }
    
    static int winDelay = 0;
    if (boss.defeated) {
        if (winDelay == 0) {
            winDelay = 30;
        } else {
            winDelay--;
            if (winDelay <= 0) {
                goToWin();
            }
        }
    } else {
        winDelay = 0;
    }
    
    // Firing the travelling slash:
    // Choose a button that doesn't conflict with other mechanics.
    if (BUTTON_PRESSED(BUTTON_A)) {
        if (!slash.active) {
            slash.active = 1;
            // Start the slash at the player's position.
            slash.x = player.x;
            slash.y = player.y;
            // Set the velocity; for example, moving rightwards.
            slash.xVel = -2;
            slash.yVel = 0;
        }
    }

    if (slash.active && collision(slash.x, slash.y, 16, 16, boss.x, boss.y, boss.width, boss.height)) {
        boss.health -= 10;
        slash.active = 0;  // Deactivate the slash upon hit.
        if (boss.health <= 0) {
            boss.health = 0;
            boss.defeated = 1;
        }
    }
}



void drawSwordSlash(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;

    shadowOAM[0].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(0,20);
}



void drawBossStage(void) {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
 
    drawPlayer(0, 0);
    drawBoss();
    drawFireballs();
    drawSlash(0, 0);
 
    for (int i = 3 + MAX_FIREBALLS + 1; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
 
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}

