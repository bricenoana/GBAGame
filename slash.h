#ifndef SLASH_H
#define SLASH_H

#define MAX_SLASHES 1

typedef struct {
    int x, y;
    int xVel, yVel;
    int active;
} Slash;

extern Slash slash;

void initSlash(void);
void updateSlash(void);
void drawSlash(int hOff, int vOff);

#endif
