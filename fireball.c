#include "gba.h"
#include "sprites.h"
#include "fireball.h"
#include "spriteNormal.h"
#include "mode0.h"
#include "player.h"
#include "BossStage.h"

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
            fireballs[i].active = 0;              // fireball disappears either way
        
            if (!playerBlockActive) {             // ▸ only hurt if NOT blocking
                player.health -= 20;
        
                if (player.health <= 0) {
                    player.health = 0;
                    goToLose();
                }
            }
        }
        
    }
}

void drawFireballs(void) {
    int i;
    for (i = 0; i < MAX_FIREBALLS; i++){
        if (fireballs[i].active){
            int screenX = fireballs[i].x;
            int screenY = fireballs[i].y;
            shadowOAM[2 + i].attr0 = ATTR0_Y(screenY) | ATTR0_SQUARE;
            shadowOAM[2 + i].attr1 = ATTR1_X(screenX) | ATTR1_SMALL;
            shadowOAM[2 + i].attr2 = ATTR2_TILEID(14, 17) | (2 << 12);
        } else {
            shadowOAM[2 + i].attr0 = ATTR0_HIDE;
        }
    }
}
