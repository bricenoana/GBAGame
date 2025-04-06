# 1 "boss.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "boss.c"
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
# 2 "boss.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "boss.c" 2
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
# 4 "boss.c" 2
# 1 "boss.h" 1



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

void initBoss(void);
void updateBoss(void);
void drawBoss(void);
# 5 "boss.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 6 "boss.c" 2
# 1 "fireball.h" 1





typedef struct {
    int x, y;
    int width, height;
    int xVel, yVel;
    int active;
} Fireball;

extern Fireball fireballs[5];

void initFireballs(void);
void updateFireballs(void);
void drawFireballs(void);
# 7 "boss.c" 2

Boss boss;
static int bossFrame = 0;
static int bossFrameDelay = 30;
static int bossMoveTimer = 60;
static int bossXVel = 0;
static int bossYVel = 0;


static unsigned int seed = 123456789;
static unsigned int rand_int(void) {
    seed = seed * 1103515245 + 12345;
    return (seed / 65536) % 32768;
}

void initBoss(void) {
    boss.x = 20;
    boss.y = 60;
    boss.width = 64;
    boss.height = 64;
    boss.maxHealth = 100;
    boss.health = 100;
    boss.defeated = 0;
    bossFrame = 0;
    bossFrameDelay = 30;
    bossMoveTimer = 60;
    bossXVel = 0;
    bossYVel = 0;

    DMANow(3, spriteNormalTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, spriteNormalPal, ((u16 *)0x5000200), 256);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void updateBoss(void) {

    if (boss.health <= 0) {
        boss.health = 0;
        boss.defeated = 1;
    }


    if (boss.health > 0) {
        bossFrameDelay--;
        if (bossFrameDelay <= 0) {
            bossFrame = (bossFrame == 0) ? 1 : 0;
            bossFrameDelay = 30;
        }
    }


    bossMoveTimer--;
    if(bossMoveTimer <= 0) {
        int dir = rand_int() % 4;
        switch (dir) {
            case 0:
                bossXVel = 1;
                bossYVel = 0;
                break;
            case 1:
                bossXVel = -1;
                bossYVel = 0;
                break;
            case 2:
                bossXVel = 0;
                bossYVel = 1;
                break;
            case 3:
                bossXVel = 0;
                bossYVel = -1;
                break;
        }
        bossMoveTimer = 120;
    }

    boss.x += bossXVel;
    boss.y += bossYVel;

    if (boss.y < 0 || boss.y > 160 - boss.height) {
        bossYVel = -bossYVel;
    }

    int maxX = (2 * 240) / 3 - boss.width;
    if (boss.x < 0) {
        boss.x = 0;
        bossXVel = -bossXVel;
    }
    if (boss.x > maxX) {
        boss.x = maxX;
        bossXVel = -bossXVel;
    }
}



void drawBoss(void) {
    shadowOAM[1].attr0 = ((boss.y) & 0xFF) | (0<<14);
    shadowOAM[1].attr1 = ((boss.x) & 0x1FF) | (3<<14);

    int frameToDraw;
    if (boss.health == 0) {
        frameToDraw = 2;
    } else {
        frameToDraw = bossFrame;
    }

    shadowOAM[1].attr2 = ((((0) * (32) + (8 + frameToDraw * 8))) & 0x3FF) | (2 << 12);
}
