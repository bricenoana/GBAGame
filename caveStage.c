#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "player.h"
#include "spriteNormal.h"
#include "sword.h"
#include "backgroundCaveTiles.h" //tiles
#include "backgroundCaveMap.h" //map
#include "foregroundCaveTiles.h"
#include "foregroundCaveMap.h"
#include "text.h"
#include "alert.h"
#include "textTiles.h"
#include "textTiles2.h"

#define DIALOGUE_ROW 14
#define DIALOGUE_COL 1


int  hOff, vOff;

void initCaveStage(void) {
    REG_DISPCTL = MODE(0)
               | BG_ENABLE(1)
               | BG_ENABLE(2)
               | SPRITE_ENABLE;

    REG_BG1CNT  = BG_CHARBLOCK(0)
                | BG_SCREENBLOCK(26)
                | BG_SIZE_WIDE;
    DMANow(3, foregroundCaveTilesPal,   BG_PALETTE,               foregroundCaveTilesPalLen / 2);
    DMANow(3, foregroundCaveTilesTiles, &CHARBLOCK[0],            foregroundCaveTilesTilesLen / 2);
    DMANow(3, foregroundCaveMapMap,      &SCREENBLOCK[26],         foregroundCaveMapLen / 2);

    REG_BG2CNT  = BG_CHARBLOCK(1)
                | BG_SCREENBLOCK(27)
                | BG_SIZE_WIDE;
    DMANow(3, backgroundCaveTilesPal,   BG_PALETTE,               backgroundCaveTilesPalLen / 2);
    DMANow(3, backgroundCaveTilesTiles, &CHARBLOCK[1],            backgroundCaveTilesTilesLen / 2);
    DMANow(3, backgroundCaveMapMap,      &SCREENBLOCK[27],         backgroundCaveMapLen / 2);

    DMANow(3, spriteNormalTiles, &CHARBLOCK[4],        spriteNormalTilesLen/2);
    DMANow(3, spriteNormalPal,   SPRITE_PAL,           spriteNormalPalLen/2);

    initPlayer();
    initSword();
    initAlert();

    collisionEnabled = 0;
    hOff = vOff = 0;
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateCaveStage(void) {
    updatePlayer();
    updateSword();
    updateCaveAlert(hOff, vOff);

    player.y = 110;
    
    if (player.x >= (512 - player.width) && sword.pickedUp == 1) {
        goToGame();
    }

    if (BUTTON_PRESSED(BUTTON_A) && alert.active) { // hides sword and alert if pickedup
        sword.pickedUp = 1;
        alert.active = 0;
    }
}

void drawCaveStage(void) {
    hOff = player.x - (SCREENWIDTH/2);
    if (hOff < 0)                     hOff = 0;
    if (hOff > 512 - SCREENWIDTH)    hOff = 512 - SCREENWIDTH;
    vOff = 0;
    
    // parallax func
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
    REG_BG2HOFF = hOff/2;
    REG_BG2VOFF = vOff/2;

    hideSprites();

    drawPlayer(hOff, vOff);
    
    if (!sword.pickedUp) {
        drawSword(hOff, vOff);
    }
    
    drawAlert(hOff, vOff);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}