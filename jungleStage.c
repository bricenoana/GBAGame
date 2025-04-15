#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "spritesheet.h"
#include "player.h"
#include "singleLayerJungle.h" //tiles
#include "singleLayerMap.h" //map

OBJ_ATTR shadowOAM[128];

int hOff, vOff;

void initJungleStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_WIDE;

    DMANow(3, singleLayerJunglePal, BG_PALETTE, singleLayerJunglePalLen/2);
    DMANow(3, singleLayerJungleTiles, &CHARBLOCK[0], singleLayerJungleTilesLen / 2);
    DMANow(3, singleLayerMapMap, &SCREENBLOCK[27], singleLayerMapLen/2);

    initPlayer();
    initTemple();
    initAlert();
    collisionEnabled = 1;
    
    hOff = 0;
    vOff = 0;
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    initNPC();

}


void updateJungleStage(void) {
    updatePlayer();
    updateNPC(hOff, vOff);
    updateAlert(hOff, vOff);


    if (checkTempleCollision(player.x, player.y, player.width, player.height)) {
        goToBossStage();
    }
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
    drawNPC(hOff, vOff);
    drawAlert(hOff, vOff);

    for (int i = 3; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);
    

    waitForVBlank();
}

