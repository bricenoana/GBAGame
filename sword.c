#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "sword.h"
#include "spriteNormal.h"

Sword sword;
#define SPRITESHEET_TILE_WIDTH 32

void initSword(void) {
    sword.x = 400;
    sword.y = 110;
    sword.width = 32;
    sword.height = 64;
    sword.active = 1;
}

void updateSword(void) {
    if (!sword.active) {
        return;
    }
}

void drawSword(int hOff, int vOff) {
    if (!sword.pickedUp) {
        int screenX = sword.x - hOff;
        int screenY = sword.y - vOff;
        int tileIndex = 24 * SPRITESHEET_TILE_WIDTH + 3;

        shadowOAM[5].attr0 = ATTR0_Y(screenY) | ATTR0_TALL;
        shadowOAM[5].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
        shadowOAM[5].attr2 = tileIndex | ATTR2_PALROW(0) | ATTR2_PRIORITY(0);
    } else {
        shadowOAM[5].attr0 = ATTR0_HIDE;
    }
}