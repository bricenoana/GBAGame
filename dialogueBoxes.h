#ifndef DIALOGUEBOXES_H
#define DIALOGUEBOXES_H

#include "gba.h"
#include "mode0.h"
#include "sprites.h"

#define BOXCOUNT 4

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int oamIndex;
    int active;
} Box;

extern Box dialogueBox[BOXCOUNT];

void initBoxes(void);

void drawBoxes(void);

void boxInactive(void);
void boxActive(void);

#endif
