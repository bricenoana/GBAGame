# 1 "BossStage.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "BossStage.c"
# 1 "BossStage.h" 1



typedef struct {
    int x;
    int y;
    int width;
    int height;
    int health;
    int maxHealth;
    int defeated;
} Boss;

extern Boss boss;

void initBossStage(void);
void updateBossStage(void);
void drawBossStage(void);
# 2 "BossStage.c" 2
# 1 "enemySprite.h" 1
# 21 "enemySprite.h"
extern const unsigned short enemyTiles[10000];


extern const unsigned short enemyPal[256];
# 3 "BossStage.c" 2
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
# 4 "BossStage.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 5 "BossStage.c" 2
# 1 "bossBGTest.h" 1







extern const unsigned short bossBGTestMap[1024];
# 6 "BossStage.c" 2
# 1 "singleLayerJungle.h" 1
# 21 "singleLayerJungle.h"
extern const unsigned short singleLayerJungleTiles[5632];


extern const unsigned short singleLayerJunglePal[256];
# 7 "BossStage.c" 2
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
# 8 "BossStage.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 9 "BossStage.c" 2
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

extern int collisionEnabled;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 10 "BossStage.c" 2

Boss boss;
int hOff, vOff;



void initBossStage(void) {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((27) << 8) | (0 << 14);

    DMANow(3, singleLayerJunglePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, singleLayerJungleTiles, &((CB*) 0x6000000)[0], 11264 / 2);
    DMANow(3, bossBGTestMap, &((SB*) 0x6000000)[27], (2048) / 2);
    initPlayer();


    player.x = 16;
    player.y = 16;


    collisionEnabled = 0;

    boss.x = 120;
    boss.y = 80;
    boss.width = 32;
    boss.height = 32;
    boss.maxHealth = 100;
    boss.health = boss.maxHealth;
    boss.defeated = 0;
}




void updateBossStage(void) {
    updatePlayer();

    if (player.x < 0) player.x = 0;
    if (player.x > 240 - player.width) player.x = 240 - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > 160 - player.height) player.y = 160 - player.height;
}

void drawBossStage(void) {


     (*(volatile unsigned short*) 0x04000010) = 0;
     (*(volatile unsigned short*) 0x04000012) = 0;


     drawPlayer(0, 0);


     for (int i = 1; i < 128; i++) {
         shadowOAM[i].attr0 = (2<<8);
     }


     DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
     waitForVBlank();
}
