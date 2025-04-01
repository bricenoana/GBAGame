#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "boofBG.h"
#include "boofMap.h"
#include "spritesheet.h"
#include "player.h"
#include "jungleBG.h" // tilemap
#include "jungleTiles.h" // usenti file

OBJ_ATTR shadowOAM[128];

int hOff, vOff;

void initJungleStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(8) | BG_SIZE_SMALL;

    DMANow(3, boofBGPal, BG_PALETTE, 256); //tiles
    DMANow(3, boofBGTiles, &CHARBLOCK[0], boofBGTilesLen / 2); //tiles

    DMANow(3, boofMapMap, &SCREENBLOCK[8], boofMapMap);



    initPlayer();
    hOff = 0;
    vOff = 0;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateJungleStage(void) {
    updatePlayer();
}

void drawJungleStage(void) {
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
