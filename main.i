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
# 2 "main.c" 2
# 1 "stateMachine.h" 1



typedef enum {
    START,
    INSTRUCTIONS,
    OP1,
    OP2,
    OP3,
    OP4,
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
void goToOP1();
void goToOP2();
void goToOP3();
void goToOP4();
void goToGame(void);
void goToPause(void);
void goToWin(void);
void goToLose(void);
# 3 "main.c" 2
# 1 "digitalSound.h" 1



void setupSounds();
void setupSoundInterrupts();
void interruptHandler();

void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();
# 52 "digitalSound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 4 "main.c" 2
# 1 "overallSong.h" 1


extern const unsigned int overallSong_sampleRate;
extern const unsigned int overallSong_length;
extern const signed char overallSong_data[];
# 5 "main.c" 2

unsigned short buttons;
unsigned short oldButtons;

int main(void) {
    setupSounds();
    setupSoundInterrupts();

    initStateMachine();

    while (1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);
        updateStateMachine();
    }
}
