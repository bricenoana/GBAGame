#ifndef FIREBALL_H
#define FIREBALL_H

#define MAX_FIREBALLS 5

typedef struct {
    int x, y;
    int width, height;
    int xVel, yVel;
    int active;
} Fireball;

extern Fireball fireballs[MAX_FIREBALLS];

void initFireballs(void);
void updateFireballs(void);
void drawFireballs(void);

#endif
