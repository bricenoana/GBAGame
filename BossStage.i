# 1 "BossStage.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "BossStage.c"
# 1 "BossStage.h" 1



extern int playerBlockActive;

void initBossStage(void);
void updateBossStage(void);
void drawBossStage(void);
# 2 "BossStage.c" 2
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
# 3 "BossStage.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "BossStage.c" 2
# 1 "bossBGTest.h" 1







extern const unsigned short bossBGTestMap[1024];
# 5 "BossStage.c" 2
# 1 "bossBGTiles.h" 1
# 21 "bossBGTiles.h"
extern const unsigned short bossBGTilesTiles[9600];


extern const unsigned short bossBGTilesPal[256];
# 6 "BossStage.c" 2
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
# 7 "BossStage.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 8 "BossStage.c" 2
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
# 9 "BossStage.c" 2
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
# 10 "BossStage.c" 2
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
# 11 "BossStage.c" 2
# 1 "slash.h" 1





typedef struct {
    int x, y;
    int xVel, yVel;
    int active;
} Slash;

extern Slash slash;

void initSlash(void);
void updateSlash(void);
void drawSlash(int hOff, int vOff);
# 12 "BossStage.c" 2

int hOff, vOff;

static int playerSlashActive = 0;
static int playerSlashTimer = 0;

int playerBlockActive;


void initBossStage(void) {
    (*(volatile unsigned short *)0x4000000) = ((0) & 7) | (1 << (8 + (0 % 4))) | (1 << 12);
    (*(volatile unsigned short*) 0x4000008) = ((0) << 2) | ((27) << 8) | (0 << 14) | (0 << 7);

    DMANow(3, bossBGTilesPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, bossBGTilesTiles, &((CB*) 0x6000000)[0], 19200 / 2);
    DMANow(3, bossBGTestMap, &((SB*) 0x6000000)[27], (2048) / 2);

    initPlayer();
    initBoss();
    initFireballs();
    initSlash();

    player.x = 200;
    player.y = 100;
    collisionEnabled = 0;

    playerSlashActive = 0;
    playerSlashTimer = 0;
}

void updateBossStage(void) {
    updateBoss();
    updateFireballs();
    updateSlash();

    if (player.x < 0) player.x = 0;
    if (player.x > 240 - player.width) player.x = 240 - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > 160 - player.height) player.y = 160 - player.height;

    if (collision(player.x, player.y, player.width, player.height,
                  boss.x, boss.y, boss.width, boss.height)) {
        player.health -= 20;
        if (player.health <= 0) {
            player.health = 0;
            goToLose();
        }
    }

    static int winDelay = 0;
    if (boss.defeated) {
        if (winDelay == 0) {
            winDelay = 30;
        } else {
            winDelay--;
            if (winDelay <= 0) {
                goToWin();
            }
        }
    } else {
        winDelay = 0;
    }

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        playerSlashActive = 1;
        playerSlashTimer = 20;

        if (!slash.active) {
            slash.active = 1;
            slash.x = player.x;
            slash.y = player.y;
            slash.xVel = -2;
            slash.yVel = 0;
        }
    }

    if (playerSlashActive) {
        playerSlashTimer--;
        if (playerSlashTimer <= 0) {
            playerSlashActive = 0;
        }
    }

    if ((~(buttons) & ((1<<1)))) {
        playerBlockActive = 1;
    } else {
        playerBlockActive = 0;
    }
    if (!playerBlockActive) {
        updatePlayer();
    }

    if (!playerBlockActive && (!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        playerSlashActive = 1;
        playerSlashTimer = 20;
    }


    if (slash.active && collision(slash.x, slash.y, 16, 16, boss.x, boss.y, boss.width, boss.height)) {
        boss.health -= 10;
        playAnalogSound(4);
        slash.active = 0;
        if (boss.health <= 0) {
            boss.health = 0;
            boss.defeated = 1;
        }
    }
}

void drawSwordSlash(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;

    shadowOAM[0].attr0 = ((screenY) & 0xFF) | (0<<14);
    shadowOAM[0].attr1 = ((screenX) & 0x1FF) | (2<<14);
    shadowOAM[0].attr2 = ((((20) * (32) + (0))) & 0x3FF);
}

void drawBlockFrame(int hOff, int vOff) {
    int screenX = player.x - hOff;
    int screenY = player.y - vOff;

    shadowOAM[0].attr0 = ((screenY) & 0xFF) | (2<<14);
    shadowOAM[0].attr1 = ((screenX) & 0x1FF) | (2<<14);
    shadowOAM[0].attr2 = ((((0) * (32) + (6))) & 0x3FF);
}


void drawBossStage(void) {
    (*(volatile unsigned short*) 0x04000010) = 0;
    (*(volatile unsigned short*) 0x04000012) = 0;

    if (playerBlockActive) {
        drawBlockFrame(0, 0);
    } else if (playerSlashActive) {
        drawSwordSlash(0, 0);
    } else {
        drawPlayer(0, 0);
    }


    drawBoss();
    drawFireballs();
    drawSlash(0, 0);

    for (int i = 3 + 5 + 2; i < 128; i++) {
         shadowOAM[i].attr0 = (2<<8);
    }

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
    waitForVBlank();
}
