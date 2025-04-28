# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "text.h" 1



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
# 5 "text.h" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 6 "text.h" 2





void eraseText(void);


void textToTile(const char string[], int offset);



void drawButton(void);
# 2 "text.c" 2


# 1 "textTiles.h" 1
# 21 "textTiles.h"
extern const unsigned short textTilesTiles[3584];


extern const unsigned short textTilesPal[256];
# 5 "text.c" 2





void eraseText() {
    for(int i = 0; i < 1024; i++) {
        ((SB*) 0x6000000)[10].tilemap[i] = ((0) & 1023) | (((1) & 15) << 12);
    }
}

void textToTile(const char string[], int offset) {
    int i = 0;
    while(string[i] != '\0') {
        ((SB*) 0x6000000)[10].tilemap[i + offset] = ((string[i]) & 1023) | (((1) & 15) << 12);
        i++;
    }
}

void drawButton() {
        ((SB*) 0x6000000)[10].tilemap[((27) * 32 + (28))] = ((91) & 1023) | (((0) & 15) << 12) | 0;
}
