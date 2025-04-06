#include "gba.h"
#include "sprites.h"
#include "fireball.h"
#include "spriteNormal.h"
#include "mode0.h"

Fireball fireballs[MAX_FIREBALLS];

void initFireballs(void) {
    int i;
    for (i = 0; i < MAX_FIREBALLS; i++){
        fireballs[i].active = 0;
    }
    DMANow(3, spriteNormalTiles, &CHARBLOCK[4], spriteNormalTilesLen / 2);
    DMANow(3, spriteNormalPal, SPRITE_PAL, 256);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
}

void updateFireballs(void) {
    int i;
    for (i = 0; i < MAX_FIREBALLS; i++){
        if (fireballs[i].active) {
            fireballs[i].x += fireballs[i].xVel;
            fireballs[i].y += fireballs[i].yVel;
            if (fireballs[i].x < 0 || fireballs[i].x > SCREENWIDTH ||
                fireballs[i].y < 0 || fireballs[i].y > SCREENHEIGHT) {
                fireballs[i].active = 0;
            }
        }
    }
}

void drawFireballs(void) {
    int i;
    for (i = 0; i < MAX_FIREBALLS; i++){
        if (fireballs[i].active){
            int screenX = fireballs[i].x;
            int screenY = fireballs[i].y;
            shadowOAM[2 + i].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
            // For a 32x32 sprite, use ATTR1_LARGE (which sets the size bits appropriately)
            shadowOAM[2 + i].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
            // Set tile coordinate to T(9,16) from your spritesheet.
            shadowOAM[2 + i].attr2 = ATTR2_TILEID(9, 16) | (3 << 12);
        } else {
            shadowOAM[2 + i].attr0 = ATTR0_HIDE;
        }
    }
}
