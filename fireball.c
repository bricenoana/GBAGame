#include "gba.h"
#include "sprites.h"
#include "fireball.h"
#include "spriteNormal.h"
#include "mode0.h"
#include "player.h"
#include "BossStage.h"
#include "analogSound.h"

Fireball fireballs[MAX_FIREBALLS];

void initFireballs(void) {
    int i;
    for (i = 0; i < MAX_FIREBALLS; i++){
        fireballs[i].active = 0;
    }
}

void updateFireballs(void) {
    int i;
    for (i = 0; i < MAX_FIREBALLS; i++){
        if (fireballs[i].active) {
            fireballs[i].x += fireballs[i].xVel;
            fireballs[i].y += fireballs[i].yVel;
            if (fireballs[i].x < 0 || fireballs[i].x > SCREENWIDTH ||
                fireballs[i].y < 0 || fireballs[i].y > SCREENHEIGHT) {
                fireballs[i].active = 0;
            }
        }
    }

    for (int i = 0; i < MAX_FIREBALLS; i++) {
        if (fireballs[i].active &&
            collision(player.x, player.y, player.width, player.height,
                      fireballs[i].x, fireballs[i].y, 16, 16))
        {
            fireballs[i].active = 0;
            if (!BUTTON_HELD(BUTTON_B)) {
                playAnalogSound(0);
            }
            
            // if player blocking no dmg
            if (!playerBlockActive) {
                player.health -= 20;
                if (player.flashTimer == 0) {
                    player.health -= 20;
                    player.flashTimer = 30;
                }
                if (player.health <= 0) {
                    player.health = 0;
                    goToLose();
                }
        
                if (player.health <= 0) {
                    player.health = 0;
                    goToLose();
                }
            }
        }
        
    }
}

void drawFireballs(void) {
    for (int i = 0; i < MAX_FIREBALLS; i++) {
        int oamIndex = 2 + i;
        if (fireballs[i].active) {
            int sx = fireballs[i].x;
            int sy = fireballs[i].y;
            shadowOAM[oamIndex].attr0 = ATTR0_Y(sy)    | ATTR0_SQUARE;
            shadowOAM[oamIndex].attr1 = ATTR1_X(sx)    | ATTR1_SMALL;
            shadowOAM[oamIndex].attr2 = ATTR2_TILEID(14, 17) | (2 << 12);
        } else {
            shadowOAM[oamIndex].attr0 = ATTR0_HIDE;
        }
    }
}
