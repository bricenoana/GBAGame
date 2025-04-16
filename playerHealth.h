#ifndef PLAYER_HEALTH_H
#define PLAYER_HEALTH_H

#include "gba.h"

#define MAX_HEARTS 5
#define HEART_TILE_ID 4 * 32 + 29
#define HEART_WIDTH 8
#define HEART_HEIGHT 8

typedef struct {
    int x;
    int y;
    int active;
} Heart;

extern Heart hearts[MAX_HEARTS];

void initHearts(void);
void drawHearts(void);
void loseHeart(void);
void resetHearts(void);
int getHealth(void);

#endif
