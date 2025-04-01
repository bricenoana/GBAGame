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

Boss boss;



void initBossStage(void) {
    boss.x = 120;
    boss.y = 80;
    boss.width = 32;
    boss.height = 32;
    boss.maxHealth = 100;
    boss.health = boss.maxHealth;
    boss.defeated = 0;
}

void updateBossStage(void) {

    if ((!(~(oldButtons) & ((1<<0))) && (~(buttons) & ((1<<0))))) {
        boss.health -= 10;
        if (boss.health < 0) {
            boss.health = 0;
        }
    }
}

void drawBossStage(void) {


}
