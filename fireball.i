# 1 "fireball.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fireball.c"
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
# 2 "fireball.c" 2
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
# 3 "fireball.c" 2
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
# 4 "fireball.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 5 "fireball.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 6 "fireball.c" 2
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
# 7 "fireball.c" 2

Fireball fireballs[5];

void initFireballs(void) {
    int i;
    for (i = 0; i < 5; i++){
        fireballs[i].active = 0;
    }
    DMANow(3, spriteNormalTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, spriteNormalPal, ((u16 *)0x5000200), 256);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void updateFireballs(void) {
    int i;
    for (i = 0; i < 5; i++){
        if (fireballs[i].active) {
            fireballs[i].x += fireballs[i].xVel;
            fireballs[i].y += fireballs[i].yVel;
            if (fireballs[i].x < 0 || fireballs[i].x > 240 ||
                fireballs[i].y < 0 || fireballs[i].y > 160) {
                fireballs[i].active = 0;
            }
        }
    }

    for (int i = 0; i < 5; i++) {
        if (fireballs[i].active && collision(player.x, player.y, player.width, player.height,
                                             fireballs[i].x, fireballs[i].y, 16, 16)) {
            player.health -= 20;
            fireballs[i].active = 0;

            if (player.health <= 0) {
                player.health = 0;
                goToLose();
            }
        }
    }
}

void drawFireballs(void) {
    int i;
    for (i = 0; i < 5; i++){
        if (fireballs[i].active){
            int screenX = fireballs[i].x;
            int screenY = fireballs[i].y;
            shadowOAM[2 + i].attr0 = ((screenY) & 0xFF) | (0<<14);
            shadowOAM[2 + i].attr1 = ((screenX) & 0x1FF) | (1<<14);
            shadowOAM[2 + i].attr2 = ((((17) * (32) + (14))) & 0x3FF) | (2 << 12);
        } else {
            shadowOAM[2 + i].attr0 = (2<<8);
        }
    }
}
