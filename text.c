#include "text.h"
#include "gba.h"
#include "mode0.h"

void drawText(char string[], int offset, int person) {
    int i = 0;
    while(string[i] != '\0') {
        SCREENBLOCK[31].tilemap[i + offset] = TILEMAP_ENTRY_TILEID(string[i]) | TILEMAP_ENTRY_PALROW(1);
        i++;
    }
}

void eraseText() {
    for (int i = 0; i < 1024; i++) {
        SCREENBLOCK[31].tilemap[i] = TILEMAP_ENTRY_TILEID(0) | TILEMAP_ENTRY_PALROW(1);
    }
}