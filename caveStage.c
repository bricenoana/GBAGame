#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "spritesheet.h"
#include "player.h"
#include "backgroundCaveTiles.h" //tiles
#include "backgroundCaveMap.h" //map

int hOff, vOff;

void initCaveStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_WIDE;

    DMANow(3, backgroundCaveTilesPal, BG_PALETTE, backgroundCaveTilesPalLen / 2);
    DMANow(3, backgroundCaveTilesTiles, &CHARBLOCK[0], backgroundCaveTilesTilesLen / 2);
    DMANow(3, backgroundCaveMapMap, &SCREENBLOCK[27], backgroundCaveMapLen / 2);

    initPlayer();
    player.x = 16;
    player.y = 16;
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
}

void drawCaveStage(void) {
    hOff = player.x - (SCREENWIDTH / 2);
    vOff = player.y - (SCREENHEIGHT / 2);
    if (hOff < 0) hOff = 0;
    if (hOff > 512 - SCREENWIDTH) hOff = 512 - SCREENWIDTH;
    if (vOff < 0) vOff = 0;
    if (vOff > 512 - SCREENHEIGHT) vOff = 512 - SCREENHEIGHT;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    drawPlayer(hOff, vOff);

    for (int i = 1; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }

    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}
