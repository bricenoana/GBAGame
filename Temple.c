#include "Temple.h"

Temple temple;

void initTemple(void) {
    temple.x = 452;
    temple.y = 25;
    temple.width = 30;
    temple.height = 40;
}

int checkTempleCollision(int playerX, int playerY, int playerWidth, int playerHeight) {
    if (playerX < temple.x + temple.width &&
        playerX + playerWidth > temple.x &&
        playerY < temple.y + temple.height &&
        playerY + playerHeight > temple.y) {
        return 1;
    }
    return 0;
}
