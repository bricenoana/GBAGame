// // text.h

// #ifndef TEXT_H
// #define TEXT_H

// #include "gba.h"

// // call once at startup
// void initText(void);

// // clear entire text layer
// void clearText(void);

// // draw an ASCII string at (row,col) in tile‑coords
// void drawText(const char *str, int row, int col);

// // simple “type‑on” dialogue effect
// void showDialogue(const char *str);

// // helper (now non‑inline) so it emits a real symbol
// u16 charToTile(u8 c);

// // wait for vertical blank
// void VBlankIntrWait(void);

// #endif // TEXT_H
