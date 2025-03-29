#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "bug.h"
#include "bugLair.h"
#include "spritesheet.h"
#include "player.h"
#include "boofBG.h"
#include "boofMap.h"

OBJ_ATTR shadowOAM[128];

#define ROWMASK 0x00FF
#define COLMASK 0x01FF

int hOff, vOff;
Player player;

void initJungleStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL | BG_8BPP;

    DMANow(3, boofBGTiles, &CHARBLOCK[0], boofBGTilesLen / 2);
    DMANow(3, boofMapMap, &SCREENBLOCK[27], boofMapLen / 2);
    DMANow(3, boofBGPal, BG_PALETTE, boofBGPalLen/2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITE_PAL, spritesheetPalLen / 2);

    player.width = 16;
    player.height = 16;
    player.x = 100;
    player.y = 100;
    player.xVel = 1;
    player.yVel = 1;
    player.numFrames = 3;
    player.currentFrame = 0;
    player.timeUntilNextFrame = 10;
    player.isAnimating = 0;
    player.direction = 0;

    hOff = 0;
    vOff = 0;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateJungleStage(void) {
    player.isAnimating = 0;

    if (BUTTON_HELD(BUTTON_UP)) {
        player.y -= player.yVel;
        player.isAnimating = 1;
        player.direction = 1;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.y += player.yVel;
        player.isAnimating = 1;
        player.direction = 0;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.x -= player.xVel;
        player.isAnimating = 1;
        player.direction = 2;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.x += player.xVel;
        player.isAnimating = 1;
        player.direction = 3;
    }
    if (player.isAnimating) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
    }

    if (player.x < 0) player.x = 0;
    if (player.x > 512 - player.width) player.x = 512 - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > 512 - player.height) player.y = 512 - player.height;
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

    int screenX = player.x - hOff;
    int screenY = player.y - vOff;

    shadowOAM[0].attr0 = (screenY & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE; 
    shadowOAM[0].attr1 = (screenX & COLMASK) | ATTR1_SMALL; 
    shadowOAM[0].attr2 = ATTR2_TILEID(player.currentFrame * 2, player.direction * 2);
    
    for (int i = 1; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}
