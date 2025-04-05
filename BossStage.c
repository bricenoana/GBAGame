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
int hOff, vOff;

// boss will be in the final stage of the game (still need a tilemap for it)

void initBossStage(void) {
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;

    DMANow(3, singleLayerJunglePal, BG_PALETTE, singleLayerJunglePalLen / 2);
    DMANow(3, singleLayerJungleTiles, &CHARBLOCK[0], singleLayerJungleTilesLen / 2);
    DMANow(3, bossBGTestMap, &SCREENBLOCK[27], bossBGTestLen / 2);
    initPlayer();

    // Set starting position for the boss stage.
    player.x = 16;
    player.y = 16;

    // Disable collision checks in boss stage.
    collisionEnabled = 0;

    boss.x = 120;
    boss.y = 80;
    boss.width = 32;
    boss.height = 32;
    boss.maxHealth = 100;
    boss.health = boss.maxHealth;
    boss.defeated = 0;
}




void updateBossStage(void) {
    updatePlayer();

    if (player.x < 0) player.x = 0;
    if (player.x > SCREENWIDTH - player.width) player.x = SCREENWIDTH - player.width;
    if (player.y < 0) player.y = 0;
    if (player.y > SCREENHEIGHT - player.height) player.y = SCREENHEIGHT - player.height;
}

void drawBossStage(void) {
     // Calculate camera offsets based on player's position.

     REG_BG0HOFF = 0;
     REG_BG0VOFF = 0;
 
     // Update the player sprite.
     drawPlayer(0, 0);
 
     // Hide all other sprites.
     for (int i = 1; i < 128; i++) {
         shadowOAM[i].attr0 = ATTR0_HIDE;
     }
 
     // Now update the entire OAM once and wait for VBlank.
     DMANow(3, shadowOAM, OAM, 128 * 4);
     waitForVBlank();
}

