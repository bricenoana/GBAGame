#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "sword.h"
#include "swordSprite.h"

Sword sword;

void initSword(void) {
    sword.x = 50;
    sword.y = 110;
    sword.currentFrame = 0;
    sword.numFrames = 3;
    sword.timeUntilNextFrame = 15;
    sword.isAnimating = 0;

    DMANow(3, swordSpriteTiles, &CHARBLOCK[4], swordSpriteTilesLen / 2);
    DMANow(3, swordSpritePal, SPRITE_PAL, swordSpritePalLen / 2);
}

void updateSword(void) {
    if (sword.isAnimating) {
        sword.timeUntilNextFrame--;
        if (sword.timeUntilNextFrame == 0) {
            sword.currentFrame = (sword.currentFrame + 1) % sword.numFrames;
            sword.timeUntilNextFrame = 15;
        }
    }
}

void drawSword(int hOff, int vOff) {
    int screenX = sword.x - hOff;
    int screenY = sword.y - vOff;

    shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_TALL;
    shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
    shadowOAM[2].attr2 = ATTR2_TILEID(512 + sword.currentFrame * 2, 0);
}
