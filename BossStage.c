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

    int oldCheat = player.cheat;

    DMANow(3, bossBGTilesPal, BG_PALETTE, bossBGTilesPalLen / 2);
    DMANow(3, bossBGTilesTiles, &CHARBLOCK[0], bossBGTilesTilesLen / 2);
    DMANow(3, bossBGTestMap, &SCREENBLOCK[27], bossBGTestLen / 2);
    
    initPlayer();
    player.cheat = oldCheat;
    hideSprites();
    initBoss();
    initFireballs();
    initSlashes();

    player.x = 200;
    player.y = 100;
    collisionEnabled = 0;
    
    playerSlashActive = 0;
    playerSlashTimer = 0;
}

void updateBossStage(void) {
    updateBoss();
    updateFireballs();
    updateSlashes();

    // palette mod for dmg
    if (player.flashTimer > 0) {
        player.flashTimer--;
        if (player.flashTimer & 1) {
            SPRITE_PAL[4] = RGB(31, 0, 0);
        } else {
            SPRITE_PAL[4] = player.baseColor;
        }
    }

    if (player.x < 0)                             player.x = 0;
    if (player.x > SCREENWIDTH - player.width)    player.x = SCREENWIDTH - player.width;
    if (player.y < 0)                             player.y = 0;
    if (player.y > SCREENHEIGHT - player.height)  player.y = SCREENHEIGHT - player.height;

    // auto lose if u collide with boss
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

        if (BUTTON_PRESSED(BUTTON_A) && !playerSlashActive) {
            playerSlashActive = 1;
            // cheat? half the cooldown
            playerSlashTimer  = player.cheat ? 20 : 20;
            spawnSlash(player.x, player.y, -2, 0);
        }
        if (playerSlashActive) {
            playerSlashTimer--;
            if (playerSlashTimer <= 0) {
                playerSlashActive = 0;
            }
        }

    // blocking & movement
    if (BUTTON_HELD(BUTTON_B)) {
        playerBlockActive = 1;
    } else {
        playerBlockActive = 0;
    }
    if (!playerBlockActive) {
        updatePlayer();
    }

    // throwing the slashes
    for (int i = 0; i < MAX_SLASHES; i++) {
        if (slashes[i].active &&
            collision(slashes[i].x, slashes[i].y, 16, 16,
                      boss.x,        boss.y,        boss.width, boss.height)) {
            boss.health -= 10;
            playAnalogSound(4);
            slashes[i].active = 0;
            if (boss.health <= 0) {
                boss.health   = 0;
                boss.defeated = 1;
            }
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
 
    hideSprites();
    if (playerBlockActive) {
        drawBlockFrame(0,0);
    } else {
        // see if any slashes are active
        int any = 0;
        for (int i = 0; i < MAX_SLASHES; i++) {
            if (slashes[i].active) { any = 1; break; }
        }
        if (any) {
            drawSwordSlash(0,0);
        } else {
            drawPlayer(0,0);
        }
    }

    
    drawBoss();
    drawFireballs();
    drawSlashes(0, 0);
 
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}