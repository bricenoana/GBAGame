#include "gba.h"
#include "sprites.h"
#include "player.h"
#include "spriteNormal.h"
#include "mode0.h"
#include "npc.h"

#define SPRITESHEET_TILE_WIDTH 32

NPC npc;

void initNPC() {
    npc.x = 240;
    npc.y = 140;
    npc.width = 32;
    npc.height = 64;
    npc.active = 1;
}

void updateNPC(int hOff, int vOff) {
    npc.screenX = npc.x - hOff;
    npc.screenY = npc.y - vOff;
}

void drawNPC(int hOff, int vOff) {
    if (npc.active) {
        int screenX = npc.x - hOff;
        int screenY = npc.y - vOff;
        int tileIndex = 24 * SPRITESHEET_TILE_WIDTH;
        shadowOAM[4].attr0 = ATTR0_Y(screenY) | ATTR0_TALL;
        shadowOAM[4].attr1 = ATTR1_X(screenX) | ATTR1_MEDIUM;
        shadowOAM[4].attr2 = tileIndex | ATTR2_PALROW(1) | ATTR2_PRIORITY(0);
    }
}


