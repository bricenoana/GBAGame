#ifndef JUNGLESTAGE_H
#define JUNGLESTAGE_H

#include "gba.h"
#include "sprites.h"

typedef enum {DOWN, UP, LEFT, RIGHT} DIRECTION;

void initJungleStage(void);
void updateJungleStage(void);
void drawJungleStage(void);

#endif