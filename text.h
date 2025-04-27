#ifndef TEXT_H
#define TEXT_H

#include "gba.h"
#include "mode0.h"

// Compute the tilemap index from row and column
#define TILE_OFFSET(r, c)  ((r) * 32 + (c))

// Clear all text from BG0 (SCREENBLOCK[10])
void eraseText(void);

// Write a C-string to BG0 tilemap starting at the given offset
void textToTile(const char string[], int offset);


// Draw the 'A' button prompt at a fixed position in the chat box
void drawButton(void);

#endif // TEXT_H
