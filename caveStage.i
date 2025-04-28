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


typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
void waitForVBlank();
# 60 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 76 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 110 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
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
    int flashTimer;
    u16 baseColor;

} Player;

extern Player player;

extern int collisionEnabled;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 5 "caveStage.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 6 "caveStage.c" 2
# 1 "sword.h" 1



typedef struct {
    int x;
    int y;
    int width;
    int height;
    int active;
    int pickedUp;
} Sword;

extern Sword sword;

void initSword(void);
void updateSword(void);
void drawSword(int hOff, int vOff);
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
# 1 "text.h" 1
# 11 "text.h"
void eraseText(void);


void textToTile(const char string[], int offset);



void drawButton(void);
# 12 "caveStage.c" 2
# 1 "alert.h" 1



typedef struct {
    int worldX;
    int worldY;
    int screenX;
    int screenY;
    int active;
} Alert;

extern Alert alert;

void initAlert();

void updateAlert(int hOff, int vOff);

void drawAlert(int hOff, int vOff);
# 13 "caveStage.c" 2
# 1 "textTiles.h" 1
# 21 "textTiles.h"
extern const unsigned short textTilesTiles[3584];


extern const unsigned short textTilesPal[256];
# 14 "caveStage.c" 2
# 1 "textTiles2.h" 1
# 21 "textTiles2.h"
extern const unsigned short textTiles2Tiles[3584];


extern const unsigned short textTiles2Pal[256];
# 15 "caveStage.c" 2




int hOff, vOff;

void initCaveStage(void) {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7)
               | (1 << (8 + (1 % 4)))
               | (1 << (8 + (2 % 4)))
               | (1 << 12);




    (*(volatile unsigned short*) 0x400000A) = ((0) << 2)
                | ((26) << 8)
                | (1 << 14);

    DMANow(3, foregroundCaveTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, foregroundCaveTilesTiles, &((CB*) 0x6000000)[0], 19200 / 2);
    DMANow(3, foregroundCaveMapMap, &((SB*) 0x6000000)[26], (4096) / 2);


    (*(volatile unsigned short*) 0x400000C) = ((1) << 2)
                | ((27) << 8)
                | (1 << 14);

    DMANow(3, backgroundCaveTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, backgroundCaveTilesTiles, &((CB*) 0x6000000)[1], 19200 / 2);
    DMANow(3, backgroundCaveMapMap, &((SB*) 0x6000000)[27], (4096) / 2);


    DMANow(3, spriteNormalTiles, &((CB*) 0x6000000)[4], 32768/2);
    DMANow(3, spriteNormalPal, ((u16 *)0x5000200), 512/2);


    initPlayer();
    initSword();
    initAlert();

    collisionEnabled = 0;

    hOff = vOff = 0;
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void updateCaveStage(void) {
    updatePlayer();
    updateSword();
    updateCaveAlert(hOff, vOff);

    player.y = 110;

    if (player.x >= (512 - player.width)) {
        goToGame();
    }


    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) && alert.active) {

        sword.pickedUp = 1;
        alert.active = 0;
    }
}

void drawCaveStage(void) {

    hOff = player.x - (240/2);
    if (hOff < 0) hOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    vOff = 0;


    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;
    (*(volatile unsigned short*) 0x04000018) = hOff/2;
    (*(volatile unsigned short*) 0x0400001A) = vOff/2;

    hideSprites();


    drawPlayer(hOff, vOff);


    if (!sword.pickedUp) {
        drawSword(hOff, vOff);
    }

    drawAlert(hOff, vOff);

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}
