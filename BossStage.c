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
#include "slash.h"  // for travelling slash

int hOff, vOff;

// Variables for the player's slash effect.
static int playerSlashActive = 0;
static int playerSlashTimer = 0;

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
    initSlash();  // initialize travelling slash

    player.x = 200;
    player.y = 100;
    collisionEnabled = 0;
    
    playerSlashActive = 0;
    playerSlashTimer = 0;
}

void updateBossStage(void) {
    updatePlayer();
    updateBoss();
    updateFireballs();
    updateSlash();  // update travelling slash

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
    
    // When BUTTON_A is pressed, activate the player's slash effect and launch a travelling slash.
    if (BUTTON_PRESSED(BUTTON_A)) {
        // Activate player's slash effect.
        playerSlashActive = 1;
        playerSlashTimer = 20;  // Show slash for 20 frames.
        
        // Launch travelling slash if not already active.
        if (!slash.active) {
            slash.active = 1;
            slash.x = player.x;
            slash.y = player.y;
            // Set velocity to move left.
            slash.xVel = -2;
            slash.yVel = 0;
        }
    }
    
    // Update player's slash timer.
    if (playerSlashActive) {
        playerSlashTimer--;
        if (playerSlashTimer <= 0) {
            playerSlashActive = 0;
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

//
// drawSwordSlash: draws the player's slash effect.
// The sprite is 16x16 and located at tile (0,20) in spriteNormal.h.
//
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
 
    // Draw player's sprite: if the slash effect is active, draw that instead.
    if (playerSlashActive) {
        drawSwordSlash(0, 0);
    } else {
        drawPlayer(0, 0);
    }
    
    drawBoss();
    drawFireballs();
    drawSlash(0, 0); // Draw travelling slash.
 
    // Hide any remaining sprites.
    for (int i = 3 + MAX_FIREBALLS + 2; i < 128; i++) {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
 
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}
