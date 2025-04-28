#include "gba.h"
#include "sprites.h"
#include "slash.h"
#include "spriteNormal.h"
#include "player.h"

Slash slashes[MAX_SLASHES];

void initSlashes(void) {
    for (int i = 0; i < MAX_SLASHES; i++) {
        slashes[i].active = 0;
    }
}

void spawnSlash(int x, int y, int dx, int dy) {
    // count active slashes
    int activeCount = 0;
    for (int i = 0; i < MAX_SLASHES; i++) {
        if (slashes[i].active) {
            activeCount++;
        }
    }

    // cheat toggle
    int limit = player.cheat ? MAX_SLASHES : 1;
    if (activeCount >= limit) {
        return;
    }

    for (int i = 0; i < MAX_SLASHES; i++) {
        if (!slashes[i].active) {
            slashes[i].active = 1;
            slashes[i].x      = x;
            slashes[i].y      = y;
            slashes[i].xVel   = dx;
            slashes[i].yVel   = dy;
            break;
        }
    }
}


void updateSlashes(void) {
    for (int i = 0; i < MAX_SLASHES; i++) {
        if (slashes[i].active) {
            slashes[i].x += slashes[i].xVel;
            slashes[i].y += slashes[i].yVel;
            if (slashes[i].x < 0 || slashes[i].x > SCREENWIDTH ||
                slashes[i].y < 0 || slashes[i].y > SCREENHEIGHT) {
                slashes[i].active = 0;
            }
        }
    }
}

void drawSlashes(int hOff, int vOff) {
    for (int i = 0; i < MAX_SLASHES; i++) {
        int oamIndex = 7 + i;
        if (slashes[i].active) {
            int sx = slashes[i].x - hOff;
            int sy = slashes[i].y - vOff;
            shadowOAM[oamIndex].attr0 = ATTR0_Y(sy)     | ATTR0_SQUARE;
            shadowOAM[oamIndex].attr1 = ATTR1_X(sx)     | ATTR1_SMALL;
            shadowOAM[oamIndex].attr2 = ATTR2_TILEID(6,20);
        } else {
            shadowOAM[oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}
