#include "BossStage.h"
#include "enemySprite.h"
#include "gba.h"
#include "mode0.h"
#include "bossBGTest.h" // test map for bossbg
#include "singleLayerJungle.h" //test tiles for bossbg
#include "sprites.h"
#include "spritesheet.h"
#include "player.h"

Boss boss;

// boss will be in the final stage of the game (still need a tilemap for it)

void initBossStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;

    DMANow(3, singleLayerJunglePal, BG_PALETTE, singleLayerJunglePalLen / 2);
    DMANow(3, singleLayerJungleTiles, &CHARBLOCK[0], singleLayerJungleTilesLen / 2);
    DMANow(3, bossBGTestMap, &SCREENBLOCK[27], bossBGTestLen / 2);

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
    resetSprites(); // Clear all sprites first.
    // Now, set up the boss sprite.
    shadowOAM[0].attr0 = ATTR0_Y(boss.y) | ATTR0_TALL;
    shadowOAM[0].attr1 = ATTR1_X(boss.x) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0); // Use the appropriate tile indices for your boss sprite.
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
}
