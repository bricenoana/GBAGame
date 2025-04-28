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
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
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
    int flashTimer;
    u16 baseColor;
    int cheat;

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
# 1 "text.h" 1
# 11 "text.h"
void eraseText(void);


void textToTile(const char string[], int offset);



void drawButton(void);
# 11 "jungleStage.c" 2
# 1 "textTiles.h" 1
# 21 "textTiles.h"
extern const unsigned short textTilesTiles[3584];


extern const unsigned short textTilesPal[256];
# 12 "jungleStage.c" 2
# 1 "dialogueBoxes.h" 1
# 10 "dialogueBoxes.h"
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
# 13 "jungleStage.c" 2




int hOff, vOff;
int textState;

void initJungleStage(void) {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (1 % 4))) | (1 << 12);

    (*(volatile unsigned short*) 0x400000A) = ((0) << 2) | ((27) << 8) | (1 << 14) | 1;
    DMANow(3, singleLayerJunglePal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, singleLayerJungleTiles, &((CB*) 0x6000000)[0], 11264/2);
    DMANow(3, singleLayerMapMap, &((SB*) 0x6000000)[27], (4096)/2);

    (*(volatile unsigned short*) 0x4000008) = ((2) << 2) | ((10) << 8) | (0 << 14) | 0;
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;

    DMANow(3, textTilesTiles, &((CB*) 0x6000000)[2], 7168/2);
    DMANow(3, textTilesPal, &((unsigned short *)0x5000000)[16], 512/2);
    for (int i = 0; i < 32*32; i++) {
      ((SB*) 0x6000000)[10].tilemap[i] = ((0) & 1023) | (((0) & 15) << 12);
    }

    DMANow(3, spriteNormalTiles, &((CB*) 0x6000000)[4], 32768/2);
    DMANow(3, spriteNormalPal, ((u16 *)0x5000200), 512/2);

    initPlayer();
    initTemple();
    initAlert();
    initNPC();


    initBoxes();
    boxInactive();

    textState = 0;
    collisionEnabled = 1;
    player.cheat = 0;

    hOff = vOff = 0;
    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;

    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);
}

void updateJungleStage(void) {
    updatePlayer();
    updateNPC(hOff, vOff);
    updateJungleAlert(hOff, vOff);

    if (!player.cheat
        && ((~(buttons) & ((1<<9))) && (~(buttons) & ((1<<8)))))
    {
        int dx = player.x - 165;
        if (dx < 0) dx = -dx;
        int dy = player.y - 15;
        if (dy < 0) dy = -dy;


        if (dx <= 15 && dy <= 15) {
            player.cheat = 1;
            playAnalogSound(9);
        }
    }

    if (textState == 0) {
        (*(volatile unsigned short *)0x4000000) |= (1 << (8 + (0 % 4)));
    }

    if (checkTempleCollision(player.x, player.y, player.width, player.height) && sword.pickedUp == 1 && npc.pickedUp == 1) {
        goToBossStage();
    }

    if (textState > 0 &&
        !collision(
            player.x, player.y, player.width, player.height,
            npc.x, npc.y, npc.width, npc.height))
    {
        (*(volatile unsigned short *)0x4000000) &= ~(1 << (8 + (0 % 4)));
        boxInactive();
        eraseText();
        textState = 0;
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0)))) &&
        collision(player.x, player.y, player.width, player.height,
                  npc.x, npc.y, npc.width, npc.height))
    {

        eraseText();

        boxActive();


        switch (textState) {
            case 0:
                textToTile("JUAN: HI THERE!", ((16) * 32 + (1)));
                break;
            case 1:
                textToTile("I SAW AN ALEBRIJE FLY BY...", ((16) * 32 + (1)));
                break;
            case 2:
                textToTile("THAT COULD ONLY MEAN TROUBLE", ((16) * 32 + (1)));
                break;
            case 3:
                textToTile("TAKE THIS SHIELD WITH YOU", ((16) * 32 + (1)));
                break;
            case 4:
                textToTile("USE IT TO PROTECT YOURSELF", ((16) * 32 + (1)));
                break;
            case 5:
                textToTile("!YOU HAVE RECEIVED A SHIELD!", ((16) * 32 + (1)));
                break;
            default:
                (*(volatile unsigned short *)0x4000000) &= ~(1 << (8 + (0 % 4)));
                boxInactive();
                eraseText();
                textState = -1;
                break;
        }
        textState++;
    }
}

void drawJungleStage(void) {
    hOff = player.x - (240/2);
    vOff = player.y - (160/2);

    if (hOff < 0) hOff = 0;
    if (hOff > 512 - 240) hOff = 512 - 240;
    if (vOff < 0) vOff = 0;
    if (vOff > 512 - 160) vOff = 512 - 160;

    (*(volatile unsigned short*) 0x04000014) = hOff;
    (*(volatile unsigned short*) 0x04000016) = vOff;

    hideSprites();

    drawPlayer(hOff, vOff);
    drawNPC(hOff, vOff);
    drawAlert(hOff, vOff);

    if ((*(volatile unsigned short *)0x4000000) & (1 << (8 + (0 % 4)))) {
      drawBoxes();
    }

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}
