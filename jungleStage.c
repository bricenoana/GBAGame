#include "gba.h" 
#include "mode0.h"
#include "sprites.h"
#include "spriteNormal.h"
#include "player.h"
#include "npc.h"
#include "sword.h"
#include "singleLayerJungle.h" //tiles
#include "singleLayerMap.h" //map
#include "text.h"
#include "textTiles.h" // tileset for my ascii-aligned letters
// #include "dialogueBoxes.h"

#define DIALOGUE_ROW 14
#define DIALOGUE_COL 1

int hOff, vOff;
int textState;       // GLOBAL textState

void initJungleStage(void) {
    // Display: BG1 (map) + sprites on, leave BG0 off until dialogue
    REG_DISPCTL = MODE(0) | BG_ENABLE(1) | SPRITE_ENABLE;

    // BG1 = jungle
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_WIDE | 1;
    DMANow(3, singleLayerJunglePal,   BG_PALETTE,            singleLayerJunglePalLen/2);
    DMANow(3, singleLayerJungleTiles, &CHARBLOCK[0],         singleLayerJungleTilesLen/2);
    DMANow(3, singleLayerMapMap,      &SCREENBLOCK[27],      singleLayerMapLen/2);

    // BG0 = text (off for now)
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(10) | BG_SIZE_SMALL | 0;
    // in initJungleStage() after you set REG_BG0CNT:
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    DMANow(3, textTilesTiles, &CHARBLOCK[2], textTilesTilesLen/2);
    DMANow(3, textTilesPal,   &BG_PALETTE[16], textTilesPalLen/2);
    for (int i = 0; i < 32*32; i++) {
      SCREENBLOCK[10].tilemap[i] = TILEMAP_ENTRY_TILEID(0) | TILEMAP_ENTRY_PALROW(0);
    }

    // OAM tiles + palette for all sprites (player, boss, fireball, boxes…)
    DMANow(3, spriteNormalTiles, &CHARBLOCK[4], spriteNormalTilesLen/2);
    DMANow(3, spriteNormalPal,   SPRITE_PAL,     spriteNormalPalLen/2);

    //rest of my inits
    initPlayer();
    initTemple();
    initAlert();
    initNPC();
    // initBoxes();
    textState = 0;

    hOff = vOff = 0;
    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128*4);
}

void updateJungleStage(void) {
    updatePlayer();
    updateNPC(hOff, vOff);
    updateJungleAlert(hOff, vOff);

    if (checkTempleCollision(player.x, player.y, player.width, player.height)) {
        goToBossStage();
    }

    if (BUTTON_PRESSED(BUTTON_A) &&
        collision(player.x, player.y, player.width, player.height,
                  npc.x,      npc.y,      npc.width,      npc.height))
    {
        if (textState == 0) {
            REG_DISPCTL |= BG_ENABLE(0);
            // for (int i = 0; i < BOXCOUNT; i++) {
            //     dialogueBox[i].active = 1;
            // }
        }

        eraseText();
        // drawBoxes();

        //switch for my npc dialogue
        switch (textState) {
            case 0:
                textToTile("NPC: HI THERE!", TILE_OFFSET(DIALOGUE_ROW, DIALOGUE_COL));
                break;
            case 1:
                textToTile("I SAW AN ALEBRIJE FLY BY...", TILE_OFFSET(DIALOGUE_ROW, DIALOGUE_COL));
                break;
            case 2:
                textToTile("THAT COULD ONLY MEAN TROUBLE", TILE_OFFSET(DIALOGUE_ROW, DIALOGUE_COL));
                break;
            case 3:
                textToTile("TAKE THIS SHIELD WITH YOU", TILE_OFFSET(DIALOGUE_ROW, DIALOGUE_COL));
                break;
            case 4:
                textToTile("USE IT TO PROTECT YOURSELF", TILE_OFFSET(DIALOGUE_ROW, DIALOGUE_COL));
                break;
            default:
                REG_DISPCTL &= ~BG_ENABLE(0);
                // for (int i = 0; i < BOXCOUNT; i++) {
                //     dialogueBox[i].active = 0;
                // }
                eraseText();
                textState = -1;  // reset so next press starts at 0
                break;
        }
        textState++;
    }
}

void drawJungleStage(void) {
    hOff = player.x - (SCREENWIDTH/2);
    vOff = player.y - (SCREENHEIGHT/2);

    if (hOff < 0) hOff = 0;
    if (hOff > 512 - SCREENWIDTH)  hOff = 512 - SCREENWIDTH;
    if (vOff < 0) vOff = 0;
    if (vOff > 512 - SCREENHEIGHT) vOff = 512 - SCREENHEIGHT;

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    hideSprites();
    
    drawPlayer(hOff, vOff);
    drawNPC(hOff, vOff);
    drawAlert(hOff, vOff);

    // if (REG_DISPCTL & BG_ENABLE(0)) {
    //   drawBoxes();
    // }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}