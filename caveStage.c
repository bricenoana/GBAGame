#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "boofBG.h" //tiles
#include "boofMap.h" //map
#include "spritesheet.h"
#include "player.h"
#include "backgroundCaveTiles.h" //tiles
#include "backgroundCaveMap.h" //map //implement after testing

int hOff, vOff;

void initCaveStage() {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;

    DMANow(3, boofBGPal, BG_PALETTE, boofBGPalLen/2); //tiles
    DMANow(3, boofBGTiles, &CHARBLOCK[0], boofBGTilesLen / 2); //tiles
    DMANow(3, boofMapMap, &SCREENBLOCK[27], boofMapLen/2); //map

    initPlayer();
    hOff = 0;
    vOff = 0;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

