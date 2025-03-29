#include "gba.h"
#include "stateMachine.h"
#include "mode0.h"
#include "mode4.h"
#include "sprites.h"
#include "print.h"
#include "startBG.h"
#include "pause.h"
#include "INSTRUCTIONS.h"

extern unsigned short buttons;
extern unsigned short oldButtons;

static GameState state;

void goToStart(void) {
    //drawing the start screen
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    DMANow(3, startBGPal, BG_PALETTE, startBGPalLen / 2);
    drawFullscreenImage4(startBGBitmap);
    waitForVBlank();
    flipPage();
    state = START;
}

void goToGame(void) {
    initJungleStage();
    state = GAME;
}


void goToInstructions(void) {
    //drawing the instruction screen
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    for (int i = 0; i < 240 * 160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i] = 0;
    }
    DMANow(3, INSTRUCTIONSPal, BG_PALETTE, INSTRUCTIONSPalLen / 2);
    drawFullscreenImage4(INSTRUCTIONSBitmap);
    waitForVBlank();
    flipPage();
    state = INSTRUCTIONS;
}

void goToPause(void) {
    //drawing the pause screen
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    for (int i = 0; i < 240 * 160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i] = 0;
    }
    DMANow(3, pausePal, BG_PALETTE, pausePalLen / 2);
    drawFullscreenImage4(pauseBitmap);
    waitForVBlank();
    flipPage();
    state = PAUSE;
}

void goToWin(void) {
    //can't reach state yet, so no screen for now
    state = WIN;
}

void goToLose(void) {
    //can't reach state yet, so no screen for now
    state = LOSE;
}

static void startState(void) {
    //move thru start screen
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

static void instructionsState(void) {
    //move thru instruction screen
    drawFullscreenImage4(INSTRUCTIONSBitmap);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}


static void gameState(void) {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    updateJungleStage();
    drawJungleStage();
}

static void pauseState(void) {
    drawFullscreenImage4(pauseBitmap);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
}

static void winState(void) {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

static void loseState(void) {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void initStateMachine(void) {
    goToStart();
}

void updateStateMachine(void) {
    switch (state) {
        case START:
            startState();
            break;
        case INSTRUCTIONS:
            instructionsState();
            break;
        case GAME:
            gameState();
            break;
        case PAUSE:
            pauseState();
            break;
        case WIN:
            winState();
            break;
        case LOSE:
            loseState();
            break;
        default:
            break;
    }
}
