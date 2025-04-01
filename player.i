# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short *videoBuffer;
# 38 "gba.h"
void waitForVBlank();


int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 70 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 104 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 2 "player.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 3 "player.c" 2
# 1 "player.h" 1




typedef struct {
    int x, y;
    int width, height;
    int xVel, yVel;
    int currentFrame, numFrames;
    int timeUntilNextFrame;
    int isAnimating;
    int direction;
} Player;

extern Player player;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 4 "player.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "player.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 6 "player.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 7 "player.c" 2
# 1 "collisionMap.h" 1
# 21 "collisionMap.h"
extern const unsigned short collisionMapBitmap[65536];


extern const unsigned short collisionMapPal[256];
# 8 "player.c" 2
# 1 "boofCollisionMap.h" 1
# 21 "boofCollisionMap.h"
extern const unsigned short boofCollisionMapBitmap[32768];


extern const unsigned short boofCollisionMapPal[256];
# 9 "player.c" 2







Player player;

typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;





void initPlayer(void) {
    player.width = 16;
    player.height = 32;
    player.x = 40;
    player.y = 140;
    player.numFrames = 3;
    player.direction = DOWN;
    player.timeUntilNextFrame = 10;
    player.xVel = 2;
    player.yVel = 2;

    DMANow(3, spriteNormalTiles, &((CB*) 0x6000000)[4], 32768/2);
    DMANow(3, spriteNormalPal, ((u16 *)0x5000200), 256);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void updatePlayer(void) {
    player.isAnimating = 0;

    if ((~(buttons) & ((1<<6)))) {
        player.direction = UP;
        int newY = player.y - player.yVel;
        if (newY >= 0) {



                player.y = newY;

        }
    }
    if ((~(buttons) & ((1<<7)))) {
        player.direction = DOWN;
        int newBottom = player.y + player.height - 1 + player.yVel;
        if (newBottom < 512) {



                player.y += player.yVel;

        }
    }
    if ((~(buttons) & ((1<<5)))) {
        player.direction = LEFT;
        int newX = player.x - player.xVel;
        if (newX >= 0) {



                player.x = newX;

        }
    }
    if ((~(buttons) & ((1<<4)))) {
        player.direction = RIGHT;
        int newX = player.x + player.xVel;
        if (newX + player.width - 1 < 512) {



                player.x = newX;

        }
    }

    if ((~(buttons) & ((1<<6))) || (~(buttons) & ((1<<7))) ||
        (~(buttons) & ((1<<5))) || (~(buttons) & ((1<<4)))) {
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

    shadowOAM[0].attr0 = ((screenY) & 0xFF) | (2<<14);
    shadowOAM[0].attr1 = ((screenX) & 0x1FF) | (2<<14);

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

    shadowOAM[0].attr2 = ((((tileRow) * (32) + (player.currentFrame * 2))) & 0x3FF);

    hOff = player.x - 240 / 2;
    vOff = player.y - 160 / 2;

    if (hOff < 0) {
        hOff = 0;
    } else if (hOff > 512 - 240) {
        hOff = 512 - 240;
    }
    if (vOff < 0) {
        vOff = 0;
    } else if (vOff > 512 - 160) {
        vOff = 512 - 160;
    }

    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}
