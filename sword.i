# 1 "sword.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sword.c"
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
# 2 "sword.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "sword.c" 2
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
# 4 "sword.c" 2
# 1 "sword.h" 1



typedef struct {
    int x;
    int y;
    int currentFrame;
    int numFrames;
    int timeUntilNextFrame;
    int isAnimating;
} Sword;

extern Sword sword;

void initSword(void);
void updateSword(void);
void drawSword(int hOff, int vOff);
# 5 "sword.c" 2
# 1 "swordSprite.h" 1
# 21 "swordSprite.h"
extern const unsigned short swordSpriteTiles[16384];


extern const unsigned short swordSpritePal[256];
# 6 "sword.c" 2

Sword sword;

void initSword(void) {
    sword.x = 50;
    sword.y = 110;
    sword.currentFrame = 0;
    sword.numFrames = 3;
    sword.timeUntilNextFrame = 15;
    sword.isAnimating = 0;


    DMANow(3, swordSpriteTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, swordSpritePal, ((u16 *)0x5000200), 512 / 2);
}

void updateSword(void) {

    if (sword.isAnimating) {
        sword.timeUntilNextFrame--;
        if (sword.timeUntilNextFrame == 0) {
            sword.currentFrame = (sword.currentFrame + 1) % sword.numFrames;
            sword.timeUntilNextFrame = 15;
        }
    }
}

void drawSword(int hOff, int vOff) {
    int screenX = sword.x - hOff;
    int screenY = sword.y - vOff;

    shadowOAM[2].attr0 = ((screenY) & 0xFF) | (2<<14);
    shadowOAM[2].attr1 = ((screenX) & 0x1FF) | (2<<14);


    shadowOAM[2].attr2 = ((((0) * (32) + (512 + sword.currentFrame * 2))) & 0x3FF);
}
