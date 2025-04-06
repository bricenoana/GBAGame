#include "gba.h"
#include "sprites.h"
#include "slash.h"
#include "spriteNormal.h"
#include "mode0.h"

Slash slash;

void initSlash(void) {
    slash.active = 0;
}

void updateSlash(void) {
    if (slash.active) {
        slash.x += slash.xVel;
        slash.y += slash.yVel;
        if (slash.x < 0 || slash.x > SCREENWIDTH ||
            slash.y < 0 || slash.y > SCREENHEIGHT) {
            slash.active = 0;
        }
    }
}

void drawSlash(int hOff, int vOff) {
    if (slash.active) {
        int screenX = slash.x - hOff;
        int screenY = slash.y - vOff;

        shadowOAM[7].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
        shadowOAM[7].attr1 = ATTR1_X(screenX) | ATTR1_SMALL;
        shadowOAM[7].attr2 = ATTR2_TILEID(6,20);
    } else {
        shadowOAM[7].attr0 = ATTR0_HIDE;
    }
}
