#include "playerHealth.h"

Heart hearts[MAX_HEARTS];

void initHearts(void) {
    for (int i = 0; i < MAX_HEARTS; i++) {
        hearts[i].x = 240 - (i + 1) * (HEART_WIDTH + 2);
        hearts[i].y = 2;
        hearts[i].active = 1;
    }
}