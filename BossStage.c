#include "BossStage.h"
#include "gba.h"
#include "mode0.h"
#include "bossBGTest.h"           // map
#include "bossBGTiles.h"    // tiles
#include "sprites.h"
#include "spritesheet.h"
#include "player.h"
#include "boss.h"
#include "fireball.h"
#include "slash.h"

int hOff, vOff;

static int playerSlashActive = 0;
static int playerSlashTimer = 0;

int playerBlockActive; 


void initBossStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | BG_4BPP;

    DMANow(3, bossBGTilesPal, BG_PALETTE, bossBGTilesPalLen / 2);
    DMANow(3, bossBGTilesTiles, &CHARBLOCK[0], bossBGTilesTilesLen / 2);
    DMANow(3, bossBGTestMap, &SCREENBLOCK[27], bossBGTestLen / 2);
    
    initPlayer();
    initBoss();
    initFireballs();
    initSlash();

    player.x = 200;
    player.y = 100;
    collisionEnabled = 0;
    
    playerSlashActive = 0;
    playerSlashTimer = 0;
}

void updateBossStage(void) {
    updateBoss();
    updateFireballs();
    updateSlash();

    if (player.x < 0) player.x = 0;
    if (player.x > SCREENWIDTH - player.width) player.x = SCREENWIDTH - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > SCREENHEIGHT - player.height) player.y = SCREENHEIGHT - player.height;
    
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
    
    if (BUTTON_PRESSED(BUTTON_A)) {
        playerSlashActive = 1;
        playerSlashTimer = 20;
        
        if (!slash.active) {
            slash.active = 1;
            slash.x = player.x;
            slash.y = player.y;
            slash.xVel = -2;
            slash.yVel = 0;
        }
    }
    
    if (playerSlashActive) {
        playerSlashTimer--;
        if (playerSlashTimer <= 0) {
            playerSlashActive = 0;
        }
    }

    if (BUTTON_HELD(BUTTON_B)) {
        playerBlockActive = 1;      // stay in block mode
    } else {
        playerBlockActive = 0;      // button released → unblock
    }
    if (!playerBlockActive) {
        updatePlayer();           // read arrows & move
    }
    
    if (!playerBlockActive && BUTTON_PRESSED(BUTTON_A)) {
        playerSlashActive = 1;
        playerSlashTimer  = 20;
    }


    if (slash.active && collision(slash.x, slash.y, 16, 16, boss.x, boss.y, boss.width, boss.height)) {
        boss.health -= 10;
        slash.active = 0;
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

void drawBlockFrame(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;

    shadowOAM[0].attr0 = ATTR0_Y(screenY) | ATTR0_TALL;
    shadowOAM[0].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(6,0);
}


void drawBossStage(void) {
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
 
    if (playerBlockActive) {
        drawBlockFrame(0, 0);
    } else if (playerSlashActive) {
        drawSwordSlash(0, 0);
    } else {
        drawPlayer(0, 0);
    }

    
    drawBoss();
    drawFireballs();
    drawSlash(0, 0);
 
    for (int i = 3 + MAX_FIREBALLS + 2; i < 128; i++) {
         shadowOAM[i].attr0 = ATTR0_HIDE;
    }
 
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}