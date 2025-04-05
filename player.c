#include "gba.h"
#include "sprites.h"
#include "player.h"
#include "spritesheet.h"
#include "spriteNormal.h"
#include "mode0.h"
#include "collisionMap.h"

#define ROWMASK 0x00FF
#define COLMASK 0x01FF

#define MAPWIDTH 512
#define MAPHEIGHT 274

Player player;
int collisionEnabled = 1; // Default: collision enabled

typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;

inline unsigned char colorAt(int x, int y) {
    return ((unsigned char *) collisionMapBitmap)[OFFSET(x, y, MAPWIDTH)];
}

void initPlayer(void) {
    player.width = 16;
    player.height = 32;
    player.x = 40;
    player.y = 140;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 1;
    player.yVel = 1;

    DMANow(3, spriteNormalTiles, &CHARBLOCK[4], spriteNormalTilesLen / 2);
    DMANow(3, spriteNormalPal, SPRITE_PAL, 256);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
}

void updatePlayer(void) {
    player.isAnimating = 0;

    if (BUTTON_HELD(BUTTON_UP)) {
        player.direction = UP;
        int newY = player.y - player.yVel;
        if (newY >= 0) {
            if (!collisionEnabled || 
                (colorAt(player.x, newY) != 0 &&
                 colorAt(player.x + player.width - 1, newY) != 0)) {
                player.y = newY;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.direction = DOWN;
        int newBottom = player.y + player.height - 1 + player.yVel;
        if (newBottom < MAPHEIGHT) {
            if (!collisionEnabled ||
                (colorAt(player.x, newBottom) != 0 &&
                 colorAt(player.x + player.width - 1, newBottom) != 0)) {
                player.y += player.yVel;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.direction = LEFT;
        int newX = player.x - player.xVel;
        if (newX >= 0) {
            if (!collisionEnabled ||
                (colorAt(newX, player.y) != 0 &&
                 colorAt(newX, player.y + player.height - 1) != 0)) {
                player.x = newX;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.direction = RIGHT;
        int newX = player.x + player.xVel;
        if (newX + player.width - 1 < MAPWIDTH) {
            if (!collisionEnabled ||
                (colorAt(newX + player.width - 1, player.y) != 0 &&
                 colorAt(newX + player.width - 1, player.y + player.height - 1) != 0)) {
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
    
    int tileRow;
    switch (player.direction) {
        case DOWN:
            tileRow = 0;
            break;
        case UP:
            tileRow = 4;
            break;
        case LEFT:
            tileRow = 8;
            break;
        case RIGHT:
            tileRow = 12;
            break;
        default:
            tileRow = 0;
            break;
    }
    
    shadowOAM[0].attr2 = ATTR2_TILEID(player.currentFrame * 2, tileRow);
}
