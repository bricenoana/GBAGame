#ifndef SLASH_H
#define SLASH_H

#define MAX_SLASHES 3

typedef struct {
    int x, y;
    int xVel, yVel;
    int active;
} Slash;

extern Slash slashes[MAX_SLASHES];

void initSlashes(void);
void spawnSlash(int x, int y, int dx, int dy);
void updateSlashes(void);
void drawSlashes(int hOff, int vOff);

#endif