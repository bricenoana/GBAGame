# 1 "jungleStage.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "jungleStage.c"
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
# 43 "gba.h"
void waitForVBlank();
# 59 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 75 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 109 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 2 "jungleStage.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "jungleStage.c" 2
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
# 4 "jungleStage.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "jungleStage.c" 2
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
    int flashtimer;
} Player;

extern Player player;

extern int collisionEnabled;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 6 "jungleStage.c" 2
# 1 "npc.h" 1



typedef struct {
    int x, y;
    int width, height;
    int screenX, screenY;
    int active;
    int pickedUp;
} NPC;

extern NPC npc;

void initNPC();
void updateNPC(int hOff, int vOff);
void drawNPC(int hOff, int vOff);
# 7 "jungleStage.c" 2
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
# 8 "jungleStage.c" 2
# 1 "singleLayerJungle.h" 1
# 21 "singleLayerJungle.h"
extern const unsigned short singleLayerJungleTiles[5632];


extern const unsigned short singleLayerJunglePal[256];
# 9 "jungleStage.c" 2
# 1 "singleLayerMap.h" 1







extern const unsigned short singleLayerMapMap[2048];
# 10 "jungleStage.c" 2

int hOff, vOff;

void initJungleStage(void) {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((27) << 8) | (1 << 14);

    DMANow(3, singleLayerJunglePal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, singleLayerJungleTiles, &((CB*) 0x6000000)[0], 11264 / 2);
    DMANow(3, singleLayerMapMap, &((SB*) 0x6000000)[27], (4096)/2);

    initPlayer();
    initTemple();
    initAlert();
    collisionEnabled = 1;

    hOff = 0;
    vOff = 0;
    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    initNPC();

}


void updateJungleStage(void) {
    updatePlayer();
    updateNPC(hOff, vOff);
    updateJungleAlert(hOff, vOff);

    if (checkTempleCollision(player.x, player.y, player.width, player.height) &&
        npc.pickedUp && sword.pickedUp)
    {
        goToBossStage();
    }

    int screenX = player.x - hOff;
}



void drawJungleStage(void) {
    hOff = player.x - (240 / 2);
    vOff = player.y - (160 / 2);
    if (hOff < 0) hOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff < 0) vOff = 0;
    if (vOff > 512 - 160) vOff = 512 - 160;

    (*(volatile unsigned short*) 0x04000010) = hOff;
    (*(volatile unsigned short*) 0x04000012) = vOff;

    drawPlayer(hOff, vOff);
    drawNPC(hOff, vOff);
    drawAlert(hOff, vOff);

    for (int i = 3; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);


    waitForVBlank();
}
