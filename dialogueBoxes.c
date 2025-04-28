#include "dialogueBoxes.h"

#define BOXCOUNT 4
Box dialogueBox[BOXCOUNT];

void initBoxes() {
  for(int i = 0; i < BOXCOUNT; i++) {
    dialogueBox[i].width  = 64;
    dialogueBox[i].height = 64;
    dialogueBox[i].active = 1;
  }
  dialogueBox[0].x =   0; dialogueBox[0].y = 96; dialogueBox[0].oamIndex = 20;
  dialogueBox[1].x =  64; dialogueBox[1].y = 96; dialogueBox[1].oamIndex = 21;
  dialogueBox[2].x = 128; dialogueBox[2].y = 96; dialogueBox[2].oamIndex = 22;
  dialogueBox[3].x = 192; dialogueBox[3].y = 96; dialogueBox[3].oamIndex = 23;
}

void drawBoxes() {
  for(int i = 0; i < BOXCOUNT; i++) {
    if(dialogueBox[i].active) {
      shadowOAM[ dialogueBox[i].oamIndex ].attr0
        = ATTR0_Y(dialogueBox[i].y + 20)
        | ATTR0_REGULAR
        | ATTR0_SQUARE;
      shadowOAM[ dialogueBox[i].oamIndex ].attr1
        = ATTR1_X(dialogueBox[i].x)
        | ATTR1_LARGE;
      shadowOAM[ dialogueBox[i].oamIndex ].attr2
        = ATTR2_TILEID(21,9)
        | ATTR2_PRIORITY(1);
    } else {
      shadowOAM[ dialogueBox[i].oamIndex ].attr0 = ATTR0_HIDE;
    }
  }
}

void boxInactive(void) {
  for (int i = 0; i < BOXCOUNT; i++) {
      dialogueBox[i].active = 0;
  }
}

void boxActive(void) {
  for (int i = 0; i < BOXCOUNT; i++) {
      dialogueBox[i].active = 1;
  }
}
