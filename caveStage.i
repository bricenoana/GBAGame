# 1 "caveStage.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "caveStage.c"
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
# 2 "caveStage.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "caveStage.c" 2
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
# 4 "caveStage.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "caveStage.c" 2
# 1 "player.h" 1



typedef struct {
    int x, y;
    int width, height;
    int xVel, yVel;
    int currentFrame, numFrames;
    int timeUntilNextFrame;
    int isAnimating;
    int direction;
    int health;
    int maxHealth;
    int defeated;
} Player;

extern Player player;

extern int collisionEnabled;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 6 "caveStage.c" 2
# 1 "swordSprite.h" 1
# 21 "swordSprite.h"
extern const unsigned short swordSpriteTiles[16384];


extern const unsigned short swordSpritePal[256];
# 7 "caveStage.c" 2
# 1 "backgroundCaveTiles.h" 1
# 21 "backgroundCaveTiles.h"
extern const unsigned short backgroundCaveTilesTiles[9600];


extern const unsigned short backgroundCaveTilesPal[256];
# 8 "caveStage.c" 2
# 1 "backgroundCaveMap.h" 1







extern const unsigned short backgroundCaveMapMap[2048];
# 9 "caveStage.c" 2
# 1 "foregroundCaveTiles.h" 1
# 21 "foregroundCaveTiles.h"
extern const unsigned short foregroundCaveTilesTiles[9600];


extern const unsigned short foregroundCaveTilesPal[256];
# 10 "caveStage.c" 2
# 1 "foregroundCaveMap.h" 1







extern const unsigned short foregroundCaveMapMap[2048];
# 11 "caveStage.c" 2

int hOff, vOff;

void initCaveStage(void) {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << (8 + (1 % 4))) | (1 << 12);

    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((27) << 8) | (1 << 14);
    (*(volatile unsigned short*) 0x400000A) = ((1) << 2) | ((26) << 8) | (1 << 14);

    DMANow(3, foregroundCaveTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, foregroundCaveTilesTiles, &((CB*) 0x6000000)[1], 19200 / 2);
    DMANow(3, foregroundCaveMapMap, &((SB*) 0x6000000)[26], (4096) / 2);

    DMANow(3, backgroundCaveTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundCaveTilesTiles, &((CB*) 0x6000000)[0], 19200 / 2);
    DMANow(3, backgroundCaveMapMap, &((SB*) 0x6000000)[27], (4096) / 2);

    initPlayer();
    player.x = 10;
    player.y = 110;
    collisionEnabled = 0;

    hOff = 0;
    vOff = 0;
    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void updateCaveStage(void) {
    updatePlayer();
    updateSword();
    player.y = 110;

    if (player.x >= (512 - player.width)) {
        goToGame();
    }
}



void drawCaveStage(void) {
    hOff = player.x - (240 / 2);
    if (hOff < 0) hOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;

    vOff = 0;

    (*(volatile unsigned short*) 0x04000010) = hOff / 2;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;


    drawPlayer(hOff, vOff);
    drawSword(hOff, vOff);

    for (int i = 1; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    waitForVBlank();
}
