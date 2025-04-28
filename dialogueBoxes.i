# 1 "dialogueBoxes.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "dialogueBoxes.c"
# 1 "dialogueBoxes.h" 1



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
# 5 "dialogueBoxes.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 6 "dialogueBoxes.h" 2
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
# 7 "dialogueBoxes.h" 2



typedef struct {
    int x;
    int y;
    int width;
    int height;
    int oamIndex;
    int active;
} Box;

extern Box dialogueBox[4];

void initBoxes(void);

void drawBoxes(void);

void boxInactive(void);
void boxActive(void);
# 2 "dialogueBoxes.c" 2


Box dialogueBox[4];

void initBoxes() {
  for(int i = 0; i < 4; i++) {
    dialogueBox[i].width = 64;
    dialogueBox[i].height = 64;
    dialogueBox[i].active = 1;
  }
  dialogueBox[0].x = 0; dialogueBox[0].y = 96; dialogueBox[0].oamIndex = 20;
  dialogueBox[1].x = 64; dialogueBox[1].y = 96; dialogueBox[1].oamIndex = 21;
  dialogueBox[2].x = 128; dialogueBox[2].y = 96; dialogueBox[2].oamIndex = 22;
  dialogueBox[3].x = 192; dialogueBox[3].y = 96; dialogueBox[3].oamIndex = 23;
}

void drawBoxes() {
  for(int i = 0; i < 4; i++) {
    if(dialogueBox[i].active) {
      shadowOAM[ dialogueBox[i].oamIndex ].attr0
        = ((dialogueBox[i].y + 20) & 0xFF)
        | (0<<8)
        | (0<<14);
      shadowOAM[ dialogueBox[i].oamIndex ].attr1
        = ((dialogueBox[i].x) & 0x1FF)
        | (3<<14);
      shadowOAM[ dialogueBox[i].oamIndex ].attr2
        = ((((9) * (32) + (21))) & 0x3FF)
        | (((1) & 3) << 10);
    } else {
      shadowOAM[ dialogueBox[i].oamIndex ].attr0 = (2<<8);
    }
  }
}

void boxInactive(void) {
  for (int i = 0; i < 4; i++) {
      dialogueBox[i].active = 0;
  }
}

void boxActive(void) {
  for (int i = 0; i < 4; i++) {
      dialogueBox[i].active = 1;
  }
}
