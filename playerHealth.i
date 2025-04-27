# 1 "playerHealth.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "playerHealth.c"
# 1 "playerHealth.h" 1



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
# 5 "playerHealth.h" 2






typedef struct {
    int x;
    int y;
    int active;
} Heart;

extern Heart hearts[5];

void initHearts(void);
void drawHearts(void);
void loseHeart(void);
void resetHearts(void);
int getHealth(void);
# 2 "playerHealth.c" 2

Heart hearts[5];

void initHearts(void) {
    for (int i = 0; i < 5; i++) {
        hearts[i].x = 240 - (i + 1) * (8 + 2);
        hearts[i].y = 2;
        hearts[i].active = 1;
    }
}
