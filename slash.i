# 1 "slash.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "slash.c"
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
# 2 "slash.c" 2
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
# 3 "slash.c" 2
# 1 "slash.h" 1





typedef struct {
    int x, y;
    int xVel, yVel;
    int active;
} Slash;

extern Slash slash;

void initSlash(void);
void updateSlash(void);
void drawSlash(int hOff, int vOff);
# 4 "slash.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 5 "slash.c" 2

Slash slash;

void initSlash(void) {
    slash.active = 0;
}

void updateSlash(void) {
    if (slash.active) {
        slash.x += slash.xVel;
        slash.y += slash.yVel;
        if (slash.x < 0 || slash.x > 240 ||
            slash.y < 0 || slash.y > 160) {
            slash.active = 0;
        }
    }
}

void drawSlash(int hOff, int vOff) {
    if (slash.active) {
        int screenX = slash.x - hOff;
        int screenY = slash.y - vOff;

        shadowOAM[7].attr0 = ((screenY) & 0xFF) | (0<<14);
        shadowOAM[7].attr1 = ((screenX) & 0x1FF) | (1<<14);
        shadowOAM[7].attr2 = ((((20) * (32) + (6))) & 0x3FF);
    } else {
        shadowOAM[7].attr0 = (2<<8);
    }
}
