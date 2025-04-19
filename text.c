// // text.c

// #include "text.h"
// #include "mode0.h"     // for CHARBLOCK(n), SCREENBLOCK(n), BG_xxx
// #include "textTiles.h"

// // pick an unused CB/SB pair:
// #define CHARBLOCK_INDEX   2
// #define SCREENBLOCK_INDEX 8

// // VRAM layout: each screen‑block is 0x800 bytes,
// // text layer is 32×32 tiles = 1024 u16 entries.
// static volatile u16 *TILEMAP = (volatile u16*)(0x6000000 + 0x800 * SCREENBLOCK_INDEX);

// // DMA controller struct + macro (16‑bit transfers, src/dst incremented)
// typedef struct {
//     const volatile void *src;
//     volatile void *dst;
//     u32 cnt;
// } DMA_CONTROLLER;
// #define DMA      ((volatile DMA_CONTROLLER*)0x040000B0)
// #define DMA_ON   (1<<31)
// #define DMA_SRC_INC  (0<<23)
// #define DMA_DST_INC  (0<<21)
// #define DMA_16BIT    (0<<26)
// #define DMA3COPY(src,dst,n)  \
//     do { \
//       DMA[3].src = (src); \
//       DMA[3].dst = (dst); \
//       DMA[3].cnt = (n) | DMA_ON | DMA_SRC_INC | DMA_DST_INC | DMA_16BIT; \
//     } while(0)

// // simple VBlank wait (polls REG_VCOUNT)
// void VBlankIntrWait(void) {
//     while (REG_VCOUNT >= 160);
//     while (REG_VCOUNT <  160);
// }

// void initText(void) {
//     // palette (512 bytes → 256 half‑words)
//     DMA3COPY(textTilesPal,
//              BG_PALETTE,
//              textTilesPalLen/2);

//     // tiles  (7168 bytes → 3584 half‑words)
//     DMA3COPY(textTilesTiles,
//              CHARBLOCK[CHARBLOCK_INDEX].tileimg,
//              textTilesTilesLen/2);

//     // now hook BG1 up to CB=2 / SB=8
//     REG_BG1CNT = BG_CHARBLOCK(CHARBLOCK_INDEX)
//                | BG_SCREENBLOCK(SCREENBLOCK_INDEX)
//                | BG_4BPP
//                | BG_SIZE_SMALL;
// }


// void clearText(void) {
//     for (int i = 0; i < 32*32; i++)
//         TILEMAP[i] = 0;
// }

// u16 charToTile(u8 c) {
//     if (c >= 'A' && c <= 'Z')      return (u16)c;
//     if (c >= 'a' && c <= 'z')      return (u16)(c - 'a' + 'A');
//     if (c >= '0' && c <= '9')      return (u16)(c - '0' + '0');  // assumes '0' is at tile‐ID 48
//     if (c == ' ')                  return  0;
//     // add punctuation/etc. here…
//     return 0;
// }

// void drawText(const char *str, int row, int col) {
//     int idx = row * 32 + col;
//     for (; *str; str++, idx++)
//         TILEMAP[idx] = charToTile((u8)*str);
// }

// void showDialogue(const char *str) {
//     clearText();
//     int row = 27, col = 2;
//     for (const char *p = str; *p; p++, col++) {
//         TILEMAP[row*32 + col] = charToTile((u8)*p);
//         VBlankIntrWait();
//     }
// }
