#include "BossStage.h"
#include "enemySprite.h"
#include "gba.h"

Boss boss;

// boss will be in the final stage of the game (still need a tilemap for it)

void initBossStage(void) {
    boss.x = 120;
    boss.y = 80;
    boss.width = 32;
    boss.height = 32;
    boss.maxHealth = 100;
    boss.health = boss.maxHealth;
    boss.defeated = 0;
}

void updateBossStage(void) {
    // simulate boss taking damage when the A button is pressed
    if (BUTTON_PRESSED(BUTTON_A)) {
        boss.health -= 10;
        if (boss.health < 0) {
            boss.health = 0;
        }
    }
}

void drawBossStage(void) {
    // draw boss sprite here
    // palette modification when damaged?
}
