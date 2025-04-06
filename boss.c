#include "gba.h"
#include "mode0.h"
#include "sprites.h"
#include "boss.h"
#include "spriteNormal.h"
#include "fireball.h"

Boss boss;
static int bossFrame = 0;
static int bossFrameDelay = 30;  // Delay between toggling frames
static int bossMoveTimer = 60;   // Frames until a new random direction is chosen
static int bossXVel = 0;
static int bossYVel = 0;

// Simple LCG for pseudo-random numbers.
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
    // Damage handling and animation code...
    if (boss.health <= 0) {
        boss.health = 0;
        boss.defeated = 1;
    }

    // Animate: alternate between frame 0 and 1 if alive.
    if (boss.health > 0) {
        bossFrameDelay--;
        if (bossFrameDelay <= 0) {
            bossFrame = (bossFrame == 0) ? 1 : 0;
            bossFrameDelay = 30;
        }
    }

    // Random movement (or your existing movement code):
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
    
    int frameToDraw;
    if (boss.health == 0) {
        frameToDraw = 2;
    } else {
        frameToDraw = bossFrame; 
    }

    shadowOAM[1].attr2 = ATTR2_TILEID(8 + frameToDraw * 8, 0) | (2 << 12);
}
