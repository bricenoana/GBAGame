# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
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
# 3 "main.c" 2

unsigned short buttons;
unsigned short oldButtons;

int main() {
    initStateMachine();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        updateStateMachine();
    }
}
