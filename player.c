#include "gba.h"
#include "sprites.h"
#include "player.h"
#include "mode0.h"
#include "collisionMap.h"
#include "boofCollisionMap.h"

#define ROWMASK 0x00FF
#define COLMASK 0x01FF

#define MAPWIDTH 512
#define MAPHEIGHT 512

Player player;

typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;

inline unsigned char colorAt(int x, int y){
    return ((unsigned char *) boofCollisionMapBitmap) [OFFSET(x, y, MAPWIDTH)];
}

void initPlayer(void) {
    player.width = 16;
    player.height = 16;
    player.x = 40;
    player.y = 100;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;
}

void updatePlayer(void) {
    player.isAnimating = 0;

    if (BUTTON_HELD(BUTTON_UP)) {
        player.direction = UP;
        int newY = player.y - player.yVel;
        if (newY >= 0) {
            if (colorAt(player.x, newY) != 0 &&
                colorAt(player.x + player.width - 1, newY) != 0) {
                player.y = newY;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.direction = DOWN;
        int newBottom = player.y + player.height - 1 + player.yVel;
        if (newBottom < MAPHEIGHT) {
            if (colorAt(player.x, newBottom) != 0 &&
                colorAt(player.x + player.width - 1, newBottom) != 0) {
                player.y += player.yVel;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.direction = LEFT;
        int newX = player.x - player.xVel;
        if (newX >= 0) {
            if (colorAt(newX, player.y) != 0 &&
                colorAt(newX, player.y + player.height - 1) != 0) {
                player.x = newX;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.direction = RIGHT;
        int newX = player.x + player.xVel;
        if (newX + player.width - 1 < MAPWIDTH) {
            if (colorAt(newX + player.width - 1, player.y) != 0 &&
                colorAt(newX + player.width - 1, player.y + player.height - 1) != 0) {
                player.x = newX;
            }
        }
    }

    if (BUTTON_HELD(BUTTON_UP) || BUTTON_HELD(BUTTON_DOWN) ||
        BUTTON_HELD(BUTTON_LEFT) || BUTTON_HELD(BUTTON_RIGHT)) {
        player.isAnimating = 1;
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
    }
}


void drawPlayer(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;

    shadowOAM[0].attr0 = ATTR0_Y(screenY) | ATTR0_TALL;
    shadowOAM[0].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.direction * 2, player.currentFrame * 4);

    hOff = player.x - SCREENWIDTH / 2;
    vOff = player.y - SCREENHEIGHT / 2;

    if (hOff < 0) {
        hOff = 0;
    } else if (hOff > MAPWIDTH - SCREENWIDTH) {
        hOff = MAPWIDTH - SCREENWIDTH;
    }

    if (vOff < 0) {
        vOff = 0;
    } else if (vOff > MAPHEIGHT - SCREENHEIGHT) {
        vOff = MAPHEIGHT - SCREENHEIGHT;
    }

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);
}

