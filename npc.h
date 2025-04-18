#ifndef NPC_H
#define NPC_H

typedef struct {
    int x, y;
    int width, height;
    int screenX, screenY;
    int active;
    int pickedUp;
} NPC;

extern NPC npc;

void initNPC();
void updateNPC(int hOff, int vOff);
void drawNPC(int hOff, int vOff);

#endif
