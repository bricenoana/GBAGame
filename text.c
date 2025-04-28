#include "text.h"
#include "gba.h"
#include "mode0.h"
#include "textTiles.h"

#define TILE_OFFSET(r,c)  ((r) * 32 + (c))

// thank u matt (he helped me with this extensively)

void eraseText() {
    for(int i = 0; i < 1024; i++) {
        SCREENBLOCK[10].tilemap[i] = TILEMAP_ENTRY_TILEID(0) | TILEMAP_ENTRY_PALROW(1);
    }
}

void textToTile(const char string[], int offset) {
    int i = 0; 
    while(string[i] != '\0') {
        SCREENBLOCK[10].tilemap[i + offset] = TILEMAP_ENTRY_TILEID(string[i]) | TILEMAP_ENTRY_PALROW(1);
        i++;
    }
}

void drawButton() {
        SCREENBLOCK[10].tilemap[TILE_OFFSET(27,28)] = TILEMAP_ENTRY_TILEID(91) | TILEMAP_ENTRY_PALROW(0) | 0;
}