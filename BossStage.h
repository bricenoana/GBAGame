#ifndef BOSS_STAGE_H
#define BOSS_STAGE_H

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

void initBossStage(void);
void updateBossStage(void);
void drawBossStage(void);

#endif // BOSS_STAGE_H
