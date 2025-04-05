# 1 "Temple.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "Temple.c"
# 1 "Temple.h" 1



typedef struct {
    int x;
    int y;
    int width;
    int height;
} Temple;

extern Temple temple;

void initTemple(void);
int checkTempleCollision(int playerX, int playerY, int playerWidth, int playerHeight);
# 2 "Temple.c" 2

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
