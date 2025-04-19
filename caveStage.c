#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "spritesheet.h"
#include "player.h"
#include "backgroundCaveTiles.h" //tiles
#include "backgroundCaveMap.h" //map
#include "foregroundCaveTiles.h"
#include "foregroundCaveMap.h"

int hOff, vOff;

void initCaveStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(26) | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_SIZE_WIDE;

    DMANow(3, foregroundCaveTilesPal, BG_PALETTE, foregroundCaveTilesPalLen / 2);
    DMANow(3, foregroundCaveTilesTiles, &CHARBLOCK[0], foregroundCaveTilesTilesLen / 2);
    DMANow(3, foregroundCaveMapMap, &SCREENBLOCK[27], foregroundCaveMapLen / 2);

    DMANow(3, backgroundCaveTilesPal, BG_PALETTE, backgroundCaveTilesPalLen / 2);
    DMANow(3, backgroundCaveTilesTiles, &CHARBLOCK[1], backgroundCaveTilesTilesLen / 2);
    DMANow(3, backgroundCaveMapMap, &SCREENBLOCK[26], backgroundCaveMapLen / 2);

    initPlayer();
    initSword();
    initAlert();
    player.x = 10;
    player.y = 110;
    collisionEnabled = 0;

    hOff = 0;
    vOff = 0;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateCaveStage(void) {
    updatePlayer();
    updateSword();
    updateCaveAlert(hOff, vOff);


    player.y = 110;
    
    if (player.x >= (512 - player.width)) {
        goToGame();
    }
}



void drawCaveStage(void) {
    hOff = player.x - (SCREENWIDTH / 2);
    if (hOff < 0) hOff = 0;
    if (hOff > 512 - SCREENWIDTH) hOff = 512 - SCREENWIDTH;
    
    vOff = 0;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff;


    drawPlayer(hOff, vOff);
    drawSword(hOff, vOff);
    drawAlert(hOff, vOff);

    for (int i = 0; i < 128; i++) {
        if (i != 0 && i != 3 && i != 2) {
            shadowOAM[i].attr0 = ATTR0_HIDE;
        }
    }
    
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}


