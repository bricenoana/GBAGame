#include "mode4.h"
#include "font.h"

// Sets a pixel in mode 4
void setPixel4(int x, int y, unsigned char colorIndex) {
    unsigned short *pixel = videoBuffer + OFFSET(x / 2, y, SCREENWIDTH / 2);
    if (x & 1) {
        *pixel = (*pixel & 0x00FF) | (colorIndex << 8);
    } else {
        *pixel = (*pixel & 0xFF00) | colorIndex;
    }
}

// Draws a rectangle in mode 4
void drawRect4(int x, int y, int width, int height, volatile unsigned char colorIndex) {
    unsigned short pixelData = (colorIndex << 8) | colorIndex;

    for (int row = 0; row < height; row++) {
        int currentY = y + row;
        if ((x & 1) == 0) {
            if ((width & 1) == 0) {
                DMANow(3,
                       &pixelData,
                       &videoBuffer[(currentY * 240 + x) / 2],
                       (width / 2) | DMA_SOURCE_FIXED | DMA_16);
            } 
            else {
                if (width > 1) {
                    DMANow(3,
                           &pixelData,
                           &videoBuffer[(currentY * 240 + x) / 2],
                           ((width - 1) / 2) | DMA_SOURCE_FIXED | DMA_16);
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
                           (remain / 2) | DMA_SOURCE_FIXED | DMA_16);
                } 
                else {
                    if (remain > 1) {
                        DMANow(3,
                               &pixelData,
                               &videoBuffer[(currentY * 240 + (x + 1)) / 2],
                               ((remain - 1) / 2) | DMA_SOURCE_FIXED | DMA_16);
                    }
                    setPixel4(x + width - 1, currentY, colorIndex);
                }
            }
        }
    }
}

// Fills the screen in mode 4 using specified palette index
void fillScreen4(volatile unsigned char colorIndex) {
    volatile unsigned int color = (colorIndex << 24) | (colorIndex << 16) |
                                  (colorIndex << 8)  | colorIndex;
    
    DMA[3].src = &color;
    DMA[3].dest = videoBuffer;
    DMA[3].ctrl = DMA_ON | DMA_SOURCE_FIXED | DMA_32 | (38400 / 4);


}

// Draws an image in mode 4
void drawImage4(int x, int y, int width, int height, const unsigned short *image) {
    int imageRowWords = width / 2;
    int videoRowWords = SCREENWIDTH / 2;
    for (int j = 0; j < height; j++) {
        DMANow(3, 
            image + j * imageRowWords, 
            videoBuffer + OFFSET(x / 2, y + j, videoRowWords), 
            imageRowWords);
    }
}

// Draws a full-screen image in mode 4
void drawFullscreenImage4(const unsigned short *image) {
    unsigned int numWords = (SCREENWIDTH * SCREENHEIGHT) / 2;
    DMANow(3, image, videoBuffer, numWords);
}

// Draws the specified character at the specified location in Mode 4
void drawChar4(int x, int y, char ch, u8 colorIndex) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel4(x + c, y + r, colorIndex);
        }
    }
}

// Draws the specified string at the specified location in Mode 3
void drawString4(int x, int y, char* str, u8 colorIndex) {
    while (*str) {
        drawChar4(x, y, *str, colorIndex);
        str++;
        x += 6;
    }
}

// Flips page being displayed and page being drawn to
void flipPage() {
    if (REG_DISPCTL & DISP_BACKBUFFER) {
        videoBuffer = BACKBUFFER;
    } else {
        videoBuffer = FRONTBUFFER;
    }
    REG_DISPCTL ^= DISP_BACKBUFFER;
}