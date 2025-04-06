#ifndef SWORDSPRITE_H
#define SWORDSPRITE_H

typedef struct {
    int x;
    int y;
    int currentFrame;
    int numFrames;
    int timeUntilNextFrame;
    int isAnimating;
} Sword;

extern Sword sword;

void initSword(void);
void updateSword(void);
void drawSword(int hOff, int vOff);

#endif
