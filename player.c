#include "gba.h"
#include "sprites.h"
#include "player.h"

#define ROWMASK 0x00FF
#define COLMASK 0x01FF

Player player;

void initPlayer(void) {
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
}

void updatePlayer(void) {
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

void drawPlayer(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;
    shadowOAM[0].attr0 = (screenY & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (screenX & COLMASK) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.currentFrame * 2, player.direction * 2);
}
