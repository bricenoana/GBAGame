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
    sword.timeUntilNextFrame = 15;  // adjust to control animation speed
    sword.isAnimating = 0; // start as static; set to 1 when you want to animate

    // Load the sword sprite's tile data and palette into VRAM:
    DMANow(3, swordSpriteTiles, &CHARBLOCK[4], swordSpriteTilesLen / 2);
    DMANow(3, swordSpritePal, SPRITE_PAL, swordSpritePalLen / 2);
}

void updateSword(void) {
    // Only update animation if isAnimating is true.
    if (sword.isAnimating) {
        sword.timeUntilNextFrame--;
        if (sword.timeUntilNextFrame == 0) {
            sword.currentFrame = (sword.currentFrame + 1) % sword.numFrames;
            sword.timeUntilNextFrame = 15;  // reset delay
        }
    }
}

void drawSword(int hOff, int vOff) {
    int screenX = sword.x - hOff;
    int screenY = sword.y - vOff;

    shadowOAM[2].attr0 = ATTR0_Y(screenY) | ATTR0_TALL; // Use appropriate shape flag (TALL or SQUARE)
    shadowOAM[2].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
    // Assuming your sword spritesheet is arranged horizontally (each frame is 2 tiles wide)
    // and the sword images start at a particular row in the tileset (say row 0).
    shadowOAM[2].attr2 = ATTR2_TILEID(512 + sword.currentFrame * 2, 0);
}
