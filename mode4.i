# 1 "mode4.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode4.c"
# 1 "mode4.h" 1



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
# 5 "mode4.h" 2




void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u16* image);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 2 "mode4.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "mode4.c" 2


void setPixel4(int x, int y, unsigned char colorIndex) {
    unsigned short *pixel = videoBuffer + ((y) * (240 / 2) + (x / 2));
    if (x & 1) {
        *pixel = (*pixel & 0x00FF) | (colorIndex << 8);
    } else {
        *pixel = (*pixel & 0xFF00) | colorIndex;
    }
}


void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex) {
    unsigned short pixelData = (colorIndex << 8) | colorIndex;

    for (int row = 0; row < height; row++) {
        int currentY = y + row;
        if ((x & 1) == 0) {
            if ((width & 1) == 0) {
                DMANow(3,
                       &pixelData,
                       &videoBuffer[(currentY * 240 + x) / 2],
                       (width / 2) | (2 << 23) | (0 << 26));
            }
            else {
                if (width > 1) {
                    DMANow(3,
                           &pixelData,
                           &videoBuffer[(currentY * 240 + x) / 2],
                           ((width - 1) / 2) | (2 << 23) | (0 << 26));
                }
                setPixel4(x + width - 1, currentY, colorIndex);
            }
        }

        else {
            setPixel4(x, currentY, colorIndex);
            if (width > 1) {
                int remain = width - 1;
                if ((remain & 1) == 0) {
                    DMANow(3,
                           &pixelData,
                           &videoBuffer[(currentY * 240 + (x + 1)) / 2],
                           (remain / 2) | (2 << 23) | (0 << 26));
                }
                else {
                    if (remain > 1) {
                        DMANow(3,
                               &pixelData,
                               &videoBuffer[(currentY * 240 + (x + 1)) / 2],
                               ((remain - 1) / 2) | (2 << 23) | (0 << 26));
                    }
                    setPixel4(x + width - 1, currentY, colorIndex);
                }
            }
        }
    }
}


void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned int color = (colorIndex << 24) | (colorIndex << 16) |
                                  (colorIndex << 8) | colorIndex;

    ((DMAChannel*)0x040000B0)[3].src = &color;
    ((DMAChannel*)0x040000B0)[3].dest = videoBuffer;
    ((DMAChannel*)0x040000B0)[3].ctrl = (1 << 31) | (2 << 23) | (1 << 26) | (38400 / 4);


}


void drawImage4(int x, int y, int width, int height, const unsigned short *image) {
    int imageRowWords = width / 2;
    int videoRowWords = 240 / 2;
    for (int j = 0; j < height; j++) {
        DMANow(3,
            image + j * imageRowWords,
            videoBuffer + ((y + j) * (videoRowWords) + (x / 2)),
            imageRowWords);
    }
}


void drawFullscreenImage4(const unsigned short *image) {
    unsigned int numWords = (240 * 160) / 2;
    DMANow(3, image, videoBuffer, numWords);
}


void drawChar4(int x, int y, char ch, u8 colorIndex) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel4(x + c, y + r, colorIndex);
        }
    }
}


void drawString4(int x, int y, char* str, u8 colorIndex) {
    while (*str) {
        drawChar4(x, y, *str, colorIndex);
        str++;
        x += 6;
    }
}


void flipPage() {
    if ((*(volatile unsigned short *)0x4000000) & (1 << 4)) {
        videoBuffer = ((unsigned short*) 0x0600A000);
    } else {
        videoBuffer = ((unsigned short*) 0x06000000);
    }
    (*(volatile unsigned short *)0x4000000) ^= (1 << 4);
}
