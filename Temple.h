#ifndef TEMPLE_H
#define TEMPLE_H

typedef struct {
    int x;
    int y;
    int width;
    int height;
} Temple;

extern Temple temple;

void initTemple(void);
int checkTempleCollision(int playerX, int playerY, int playerWidth, int playerHeight);

#endif
