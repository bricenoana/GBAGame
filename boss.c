#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "boss.h"
#include "spriteNormal.h"
#include "fireball.h"
#include "player.h"

Boss boss;
static int bossFrame = 0;
static int bossFrameDelay = 30;
static int bossMoveTimer = 60;
static int bossXVel = 0;
static int bossYVel = 0;

static unsigned int seed = 123456789;
static unsigned int rand_int(void) {
    seed = seed * 1103515245 + 12345;
    return (seed / 65536) % 32768;
}

void initBoss(void) {
    boss.x = 20;
    boss.y = 60;
    boss.width = 64;
    boss.height = 64;
    boss.maxHealth = 100;
    boss.health = 100;
    boss.defeated = 0;
    bossFrame = 0;
    bossFrameDelay = 30;
    bossMoveTimer = 60;
    bossXVel = 0;
    bossYVel = 0;

    DMANow(3, spriteNormalTiles, &CHARBLOCK[4], spriteNormalTilesLen / 2);
    DMANow(3, spriteNormalPal, SPRITE_PAL, 256);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
}

void updateBoss(void) {
    static int fireballTimer = 90;

    if (boss.health <= 0) {
        boss.health = 0;
        boss.defeated = 1;
        return;
    }

    bossFrameDelay--;
    if (bossFrameDelay <= 0) {
        bossFrame = (bossFrame + 1) % 3;
        bossFrameDelay = 30;
    }

    fireballTimer--;
    if (fireballTimer <= 0) {
        fireBossFireball();
        fireballTimer = 90;
    }

    bossMoveTimer--;
    if(bossMoveTimer <= 0) {
        int dir = rand_int() % 4;
        switch (dir) {
            case 0:
                bossXVel = 1;
                bossYVel = 0;
                break;
            case 1:
                bossXVel = -1;
                bossYVel = 0;
                break;
            case 2:
                bossXVel = 0;
                bossYVel = 1;
                break;
            case 3:
                bossXVel = 0;
                bossYVel = -1;
                break;
        }
        bossMoveTimer = 120;
    }
    
    boss.x += bossXVel;
    boss.y += bossYVel;
    
    if (boss.y < 0 || boss.y > SCREENHEIGHT - boss.height) {
        bossYVel = -bossYVel;
    }
    
    int maxX = (2 * SCREENWIDTH) / 3 - boss.width;
    if (boss.x < 0) {
        boss.x = 0;
        bossXVel = -bossXVel;
    }
    if (boss.x > maxX) {
        boss.x = maxX;
        bossXVel = -bossXVel;
    }
}



void drawBoss(void) {
    shadowOAM[1].attr0 = ATTR0_Y(boss.y) | ATTR0_SQUARE;
    shadowOAM[1].attr1 = ATTR1_X(boss.x) | ATTR1_LARGE;
    
    if (boss.health == 0) {
        shadowOAM[1].attr2 = ATTR2_TILEID(9, 8) | (2 << 12);
    } else {
        int frameToDraw = bossFrame;
        if (frameToDraw == 2) {
            shadowOAM[1].attr2 = ATTR2_TILEID(24, 0) | (2 << 12);
        } else {
            shadowOAM[1].attr2 = ATTR2_TILEID(8 + frameToDraw * 8, 0) | (2 << 12);
        }
    }
    
}

void fireBossFireball() { // shooting function for boss
    for (int i = 0; i < MAX_FIREBALLS; i++) {
        if (!fireballs[i].active) {
            fireballs[i].active = 1;
            fireballs[i].x = boss.x + boss.width / 2 - 8; 
            fireballs[i].y = boss.y + boss.height / 2 - 8;

            int dx = player.x - fireballs[i].x;
            int dy = player.y - fireballs[i].y;

            int magnitude = isqrt(dx * dx + dy * dy);
            if (magnitude == 0) magnitude = 1;

            fireballs[i].xVel = (dx * 3) / magnitude;
            fireballs[i].yVel = (dy * 3) / magnitude;

            break;
        }
    }
}

int isqrt(int n) { // function to calculate firball to direction of player
    int x = n;
    int y = (x + 1) / 2;
    while (y < x) {
        x = y;
        y = (x + n / x) / 2;
    }
    return x;
}
