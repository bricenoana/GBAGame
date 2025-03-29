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




Player player;

void initPlayer(void) {
    player.width = 16;
    player.height = 16;
    player.x = 100;
    player.y = 100;
    player.xVel = 1;
    player.yVel = 1;
    player.numFrames = 3;
    player.currentFrame = 0;
    player.timeUntilNextFrame = 10;
    player.isAnimating = 0;
    player.direction = 0;
}

void updatePlayer(void) {
    player.isAnimating = 0;
    if ((~(buttons) & ((1<<6)))) {
        player.y -= player.yVel;
        player.isAnimating = 1;
        player.direction = 1;
    }
    if ((~(buttons) & ((1<<7)))) {
        player.y += player.yVel;
        player.isAnimating = 1;
        player.direction = 0;
    }
    if ((~(buttons) & ((1<<5)))) {
        player.x -= player.xVel;
        player.isAnimating = 1;
        player.direction = 2;
    }
    if ((~(buttons) & ((1<<4)))) {
        player.x += player.xVel;
        player.isAnimating = 1;
        player.direction = 3;
    }
    if (player.isAnimating) {
        player.timeUntilNextFrame--;
        if (player.timeUntilNextFrame == 0) {
            player.currentFrame = (player.currentFrame + 1) % player.numFrames;
            player.timeUntilNextFrame = 10;
        }
    } else {
        player.currentFrame = 0;
        player.timeUntilNextFrame = 10;
    }
    if (player.x < 0) player.x = 0;
    if (player.x > 512 - player.width) player.x = 512 - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > 512 - player.height) player.y = 512 - player.height;
}

void drawPlayer(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;
    shadowOAM[0].attr0 = (screenY & 0x00FF) | (0<<13) | (0<<14);
    shadowOAM[0].attr1 = (screenX & 0x01FF) | (1<<14);
    shadowOAM[0].attr2 = ((((player.direction * 2) * (32) + (player.currentFrame * 2))) & 0x3FF);
}
