#ifndef BOSS_H
#define BOSS_H

typedef struct {
    int x;
    int y;
    int width;
    int height;
    int health;
    int maxHealth;
    int defeated;
} Boss;

extern Boss boss;

void initBoss(void);
void updateBoss(void);
void drawBoss(void);

#endif
