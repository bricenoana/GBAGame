# 1 "boss.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "boss.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;


typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
void waitForVBlank();
# 60 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 76 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 110 "gba.h"
void DMANow(int channel, volatile void *src, volatile void *dest, unsigned int ctrl);
# 2 "boss.c" 2
# 1 "mode0.h" 1
# 32 "mode0.h"
typedef struct {
 u16 tileimg[8192];
} CB;



typedef struct {
 u16 tilemap[1024];
} SB;
# 3 "boss.c" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



OBJ_ATTR shadowOAM[128];

struct attr0 {
  u16 regular;
  u16 affine;
  u16 hide;
  u16 double_affine;
  u16 enable_alpha;
  u16 enable_window;
  u16 enable_mosaic;
  u16 fourBpp;
  u16 eightBpp;
  u16 square;
  u16 wide;
  u16 tall;
};

struct attr1 {
  u16 hflip;
  u16 vflip;
  u16 tiny;
  u16 small;
  u16 medium;
  u16 large;
};

struct oam_attrs {
  struct attr0 attr0;
  struct attr1 attr1;
};
# 93 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int xVel;
    int yVel;
    int width;
    int height;
    int timeUntilNextFrame;
    int direction;
    int isAnimating;
    int currentFrame;
    int numFrames;
    u8 oamIndex;
} SPRITE;
# 4 "boss.c" 2
# 1 "boss.h" 1



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
# 5 "boss.c" 2
# 1 "spriteNormal.h" 1
# 21 "spriteNormal.h"
extern const unsigned short spriteNormalTiles[16384];


extern const unsigned short spriteNormalPal[256];
# 6 "boss.c" 2
# 1 "fireball.h" 1





typedef struct {
    int x, y;
    int width, height;
    int xVel, yVel;
    int active;
} Fireball;

extern Fireball fireballs[5];

void initFireballs(void);
void updateFireballs(void);
void drawFireballs(void);
# 7 "boss.c" 2
# 1 "player.h" 1



typedef struct {
    int x, y;
    int width, height;
    int xVel, yVel;
    int currentFrame, numFrames;
    int timeUntilNextFrame;
    int isAnimating;
    int direction;
    int health;
    int maxHealth;
    int defeated;
    int flashTimer;
    u16 baseColor;

} Player;

extern Player player;

extern int collisionEnabled;

void initPlayer(void);
void updatePlayer(void);
void drawPlayer(int hOff, int vOff);
# 8 "boss.c" 2

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

    DMANow(3, spriteNormalTiles, &((CB*) 0x6000000)[4], 32768 / 2);
    DMANow(3, spriteNormalPal, ((u16 *)0x5000200), 256);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
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

    if (boss.y < 0 || boss.y > 160 - boss.height) {
        bossYVel = -bossYVel;
    }

    int maxX = (2 * 240) / 3 - boss.width;
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
    shadowOAM[1].attr0 = ((boss.y) & 0xFF) | (0<<14);
    shadowOAM[1].attr1 = ((boss.x) & 0x1FF) | (3<<14);

    if (boss.health == 0) {
        shadowOAM[1].attr2 = ((((8) * (32) + (9))) & 0x3FF) | (2 << 12);
    } else {
        int frameToDraw = bossFrame;
        if (frameToDraw == 2) {
            shadowOAM[1].attr2 = ((((0) * (32) + (24))) & 0x3FF) | (2 << 12);
        } else {
            shadowOAM[1].attr2 = ((((0) * (32) + (8 + frameToDraw * 8))) & 0x3FF) | (2 << 12);
        }
    }

}

void fireBossFireball() {
    for (int i = 0; i < 5; i++) {
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

int isqrt(int n) {
    int x = n;
    int y = (x + 1) / 2;
    while (y < x) {
        x = y;
        y = (x + n / x) / 2;
    }
    return x;
}
