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

extern Slash slashes[3];

void initSlashes(void);
void spawnSlash(int x, int y, int dx, int dy);
void updateSlashes(void);
void drawSlashes(int hOff, int vOff);
# 4 "slash.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 5 "slash.c" 2
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
    int cheat;

} Player;

extern Player player;

extern int collisionEnabled;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 6 "slash.c" 2

Slash slashes[3];

void initSlashes(void) {
    for (int i = 0; i < 3; i++) {
        slashes[i].active = 0;
    }
}

void spawnSlash(int x, int y, int dx, int dy) {

    int activeCount = 0;
    for (int i = 0; i < 3; i++) {
        if (slashes[i].active) {
            activeCount++;
        }
    }


    int limit = player.cheat ? 3 : 1;
    if (activeCount >= limit) {
        return;
    }

    for (int i = 0; i < 3; i++) {
        if (!slashes[i].active) {
            slashes[i].active = 1;
            slashes[i].x = x;
            slashes[i].y = y;
            slashes[i].xVel = dx;
            slashes[i].yVel = dy;
            break;
        }
    }
}


void updateSlashes(void) {
    for (int i = 0; i < 3; i++) {
        if (slashes[i].active) {
            slashes[i].x += slashes[i].xVel;
            slashes[i].y += slashes[i].yVel;
            if (slashes[i].x < 0 || slashes[i].x > 240 ||
                slashes[i].y < 0 || slashes[i].y > 160) {
                slashes[i].active = 0;
            }
        }
    }
}

void drawSlashes(int hOff, int vOff) {
    for (int i = 0; i < 3; i++) {
        int oamIndex = 7 + i;
        if (slashes[i].active) {
            int sx = slashes[i].x - hOff;
            int sy = slashes[i].y - vOff;
            shadowOAM[oamIndex].attr0 = ((sy) & 0xFF) | (0<<14);
            shadowOAM[oamIndex].attr1 = ((sx) & 0x1FF) | (1<<14);
            shadowOAM[oamIndex].attr2 = ((((20) * (32) + (6))) & 0x3FF);
        } else {
            shadowOAM[oamIndex].attr0 = (2<<8);
        }
    }
}
