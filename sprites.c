#include "sprites.h"

void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}