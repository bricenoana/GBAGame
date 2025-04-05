# 1 "stateMachine.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "stateMachine.c"
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
# 2 "stateMachine.c" 2
# 1 "stateMachine.h" 1



typedef enum {
    START,
    INSTRUCTIONS,
    CAVE,
    GAME,
    BOSS,
    PAUSE,
    WIN,
    LOSE
} GameState;

void initStateMachine(void);
void updateStateMachine(void);

void goToStart(void);
void goToInstructions(void);
void goToGame(void);
void goToPause(void);
void goToWin(void);
void goToLose(void);
# 3 "stateMachine.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 4 "stateMachine.c" 2
# 1 "mode4.h" 1
# 9 "mode4.h"
void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u16* image);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 5 "stateMachine.c" 2
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
# 6 "stateMachine.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 7 "stateMachine.c" 2
# 1 "startBG.h" 1
# 21 "startBG.h"
extern const unsigned short startBGBitmap[19200];


extern const unsigned short startBGPal[256];
# 8 "stateMachine.c" 2
# 1 "pause.h" 1
# 21 "pause.h"
extern const unsigned short pauseBitmap[19200];


extern const unsigned short pausePal[256];
# 9 "stateMachine.c" 2
# 1 "INSTRUCTIONS.h" 1
# 21 "INSTRUCTIONS.h"
extern const unsigned short INSTRUCTIONSBitmap[19200];


extern const unsigned short INSTRUCTIONSPal[256];
# 10 "stateMachine.c" 2
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
# 11 "stateMachine.c" 2
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
# 12 "stateMachine.c" 2
# 1 "caveStage.h" 1



void initCaveStage(void);
void updateCaveStage(void);
void drawCaveStage(void);
# 13 "stateMachine.c" 2

extern unsigned short buttons;
extern unsigned short oldButtons;

static GameState state;

void goToStart(void) {

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | ((1 << (8 + (2 % 4)))) | (1 << 4);
    DMANow(3, startBGPal, ((unsigned short *)0x5000000), 512 / 2);
    drawFullscreenImage4(startBGBitmap);
    waitForVBlank();
    flipPage();
    state = START;
}

void goToCave(void) {
    initCaveStage();
    state = CAVE;
}

void goToGame(void) {
    initJungleStage();
    state = GAME;
}

void goToInstructions(void) {

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | ((1 << (8 + (2 % 4)))) | (1 << 4);
    for (int i = 0; i < 240 * 160; i++) {
        ((unsigned short*) 0x06000000)[i] = 0;
        ((unsigned short*) 0x0600A000)[i] = 0;
    }
    DMANow(3, INSTRUCTIONSPal, ((unsigned short *)0x5000000), 512 / 2);
    drawFullscreenImage4(INSTRUCTIONSBitmap);
    waitForVBlank();
    flipPage();
    state = INSTRUCTIONS;
}

void goToPause(void) {

    (*(volatile unsigned short *)0x4000000) = ((4) & 7) | ((1 << (8 + (2 % 4)))) | (1 << 4);
    for (int i = 0; i < 240 * 160; i++) {
        ((unsigned short*) 0x06000000)[i] = 0;
        ((unsigned short*) 0x0600A000)[i] = 0;
    }
    DMANow(3, pausePal, ((unsigned short *)0x5000000), 512 / 2);
    drawFullscreenImage4(pauseBitmap);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void goToWin(void) {

    state = WIN;
}

void goToLose(void) {

    state = LOSE;
}

void goToBossStage(void) {
    resetSprites();

    player.x = 32;
    player.y = 32;
    initBossStage();
    state = BOSS;
}



static void startState(void) {

    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToCave();
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToGame();
    }
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToInstructions();
    }
}

static void instructionsState(void) {

    drawFullscreenImage4(INSTRUCTIONSBitmap);
    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        goToStart();
    } else if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        goToGame();
    } else if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToStart();
    }
    waitForVBlank();
    flipPage();
}

static void caveState(void) {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToPause();
    }
    updateCaveStage();
    drawCaveStage();
}

static void gameState(void) {
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToPause();
    }
    if ((!(~(oldButtons) & ((1<<1))) && (~(buttons) & ((1<<1))))) {
        goToCave();
    }
    updateJungleStage();
    drawJungleStage();
}

static void bossState(void) {
    updateBossStage();
    drawBossStage();
}


static void pauseState(void) {
    drawFullscreenImage4(pauseBitmap);
    waitForVBlank();
    flipPage();
    if ((!(~(oldButtons) & ((1<<2))) && (~(buttons) & ((1<<2))))) {
        goToGame();
    }
}

static void winState(void) {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

static void loseState(void) {
    if ((!(~(oldButtons) & ((1<<3))) && (~(buttons) & ((1<<3))))) {
        goToStart();
    }
}

void initStateMachine(void) {
    goToStart();
}

void resetSprites(void) {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = (2<<8);
    }
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void updateStateMachine(void) {
    switch (state) {
        case START:
            startState();
            break;
        case INSTRUCTIONS:
            instructionsState();
            break;
        case CAVE:
            caveState();
            break;
        case GAME:
            gameState();
            break;
        case PAUSE:
            pauseState();
            break;
        case BOSS:
            bossState();
            break;
        case WIN:
            winState();
            break;
        case LOSE:
            loseState();
            break;
        default:
            break;
    }
}
