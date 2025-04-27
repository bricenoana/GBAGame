#include "gba.h"
#include "sprites.h"
#include "player.h"
#include "npc.h"
#include "sword.h"
#include "spriteNormal.h"
#include "mode0.h"
#include "alert.h"

#define SPRITESHEET_TILE_WIDTH 32
#define ALERT_WIDTH  16
#define ALERT_HEIGHT 16


Alert alert;
static int showingDialogue = 0;

void initAlert() {
    alert.active = 0;
}

void updateJungleAlert(int hOff,int vOff) {
    if (collision(player.x, player.y, player.width, player.height,
                  npc.x, npc.y, npc.width, npc.height))
    {
        alert.active = 1;
        int cx = npc.x + (npc.width / 2) - (ALERT_WIDTH/2);
        int cy = npc.y - ALERT_HEIGHT - 4;
        alert.worldX = cx - 8; alert.worldY = cy + 5;
        alert.screenX = alert.worldX - hOff;
        alert.screenY = alert.worldY - vOff;

        if (BUTTON_PRESSED(BUTTON_A)) {
            npc.pickedUp = 1;
            alert.active = 0;
            if (!showingDialogue) {
              // drawText("HELLO ADVENTURER", 0, 0);
              showingDialogue = 1;
            } else {
              eraseText();
              
              showingDialogue = 0;
            }
          }
    } else {
        alert.active = 0;
        if (showingDialogue) {
            eraseText();
            showingDialogue = 0;
          }
    }
}

void updateCaveAlert(int hOff,int vOff) {
    if (collision(player.x, player.y, player.width, player.height,
                  sword.x,  sword.y,  sword.width, sword.height))
    {
        alert.active = 1;
        alert.worldX = sword.x;
        alert.worldY = sword.y - 14;
        alert.screenX = alert.worldX - hOff;
        alert.screenY = alert.worldY - vOff;

        if (BUTTON_PRESSED(BUTTON_A)) {
            sword.pickedUp = 1;
            alert.active = 0;
            if (!showingDialogue) {
              // drawText("HELLO ADVENTURER", 0, 0);
              showingDialogue = 1;
            } else {
              eraseText();
              showingDialogue = 0;
            }
          }
    } else {
        alert.active = 0;
        if (showingDialogue) {
            eraseText();
            showingDialogue = 0;
          }
    }
}


void drawAlert(int hOff, int vOff) {
    if (alert.active) {
        int tileIndex = 29 * SPRITESHEET_TILE_WIDTH;
        shadowOAM[3].attr0 = ATTR0_Y(alert.screenY) | ATTR0_SQUARE;
        shadowOAM[3].attr1 = ATTR1_X(alert.screenX) | ATTR1_SMALL;
        shadowOAM[3].attr2 = tileIndex | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);
    } else {
        shadowOAM[3].attr0 = ATTR0_HIDE;
    }
}

