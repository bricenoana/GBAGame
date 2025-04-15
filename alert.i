# 1 "alert.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "alert.c"
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
# 2 "alert.c" 2
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
# 3 "alert.c" 2
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
# 4 "alert.c" 2
# 1 "npc.h" 1



typedef struct {
    int x, y;
    int width, height;
    int screenX, screenY;
    int active;
} NPC;

extern NPC npc;

void initNPC();
void updateNPC(int hOff, int vOff);
void drawNPC(int hOff, int vOff);
# 5 "alert.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[25600];


extern const unsigned short spriteNormalPal[256];
# 6 "alert.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 7 "alert.c" 2
# 1 "alert.h" 1



void initAlert();

void updateAlert(int hOff, int vOff);

void drawAlert(int hOff, int vOff);
# 8 "alert.c" 2





typedef struct {
    int worldX;
    int worldY;
    int screenX;
    int screenY;
    int active;
} Alert;

Alert alert;

void initAlert() {
    alert.active = 0;
}

void updateJungleAlert(int hOff, int vOff) {
    if (collision(player.x, player.y, player.width, player.height,
                  npc.x, npc.y, npc.width, npc.height)) {
        alert.active = 1;

        int baseX = npc.x + (npc.width / 2) - (16 / 2);
        int baseY = npc.y - 16 - 4;

        alert.worldX = baseX - 8;
        alert.worldY = baseY + 5;

        alert.screenX = alert.worldX - hOff;
        alert.screenY = alert.worldY - vOff;
    } else {
        alert.active = 0;
    }
}

void updateCaveAlert(int hOff, int vOff) {
    if (player.x >= 380 && player.x <= 420) {
        alert.active = 1;
        alert.worldX = 399;
        alert.worldY = 90;
    } else {
        alert.active = 0;
    }

    alert.screenX = alert.worldX - hOff;
    alert.screenY = alert.worldY - vOff;
}


void drawAlert(int hOff, int vOff) {
    if (alert.active) {
        int tileIndex = 29 * 32;
        shadowOAM[2].attr0 = ((alert.screenY) & 0xFF) | (0<<14);
        shadowOAM[2].attr1 = ((alert.screenX) & 0x1FF) | (1<<14);
        shadowOAM[2].attr2 = tileIndex | (((1) & 0xF) <<12) | (((0) & 3) << 10);
    } else {
        shadowOAM[2].attr0 = (2<<8);
    }
}
