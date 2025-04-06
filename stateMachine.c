#include "gba.h"
#include "stateMachine.h"
#include "mode0.h"
#include "mode4.h"
#include "sprites.h"
#include "print.h"
#include "startBG.h"
#include "pause.h"
#include "INSTRUCTIONS.h"
#include "player.h"
#include "BossStage.h"
#include "caveStage.h"
#include "winScreen.h"
#include "loseScreen.h"

extern unsigned short buttons;
extern unsigned short oldButtons;

static GameState state;

void goToStart(void) {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240 * 160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i] = 0;
    }
    
    for (int i = 0; i < 256; i++) {
        BG_PALETTE[i] = 0;
    }
    
    DMANow(3, startBGPal, BG_PALETTE, startBGPalLen / 2);
    
    drawFullscreenImage4(startBGBitmap);
    
    waitForVBlank();
    flipPage();
    
    state = START;
}


void goToCave(void) {
    initCaveStage();
    state = CAVE;
}

void goToGame(void) {
    for (int i = 0; i < 256; i++) {
        BG_PALETTE[i] = 0;
    }
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
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240 * 160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i] = 0;
    }
    
    for (int i = 0; i < 256; i++) {
        BG_PALETTE[i] = 0;
    }
    
    DMANow(3, winScreenPal, BG_PALETTE, winScreenPalLen / 2);

    for (int i = 0; i < 240 * 160; i++) {
        BACKBUFFER[i] = RGB(31, 31, 31);
    }
    
    waitForVBlank();
    flipPage();
    
    state = WIN;
}




void goToLose(void) {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240 * 160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i] = 0;
    }
    
    for (int i = 0; i < 256; i++) {
        BG_PALETTE[i] = 0;
    }
    
    DMANow(3, loseScreenPal, BG_PALETTE, loseScreenPalLen / 2);
    

    for (int i = 0; i < 240 * 160; i++) {
        BACKBUFFER[i] = RGB(31, 31, 31); 
    }

    
    waitForVBlank();
    flipPage();
    
    state = LOSE;
}

void goToBossStage(void) {
    resetSprites();
    player.x = 32;
    player.y = 32;
    initBossStage();
    state = BOSS;  
}



static void startState(void) {
    drawFullscreenImage4(startBGBitmap);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToCave();
    }
    if (BUTTON_PRESSED(BUTTON_A)) { //for debug purposes
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) { //for debug purposes
        goToBossStage();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructions();
    }
}

static void instructionsState(void) {
    //move thru instruction screen
    drawFullscreenImage4(INSTRUCTIONSBitmap);
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToStart();
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
    waitForVBlank();
    flipPage();
}

static void caveState(void) {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    updateCaveStage();
    drawCaveStage();
}

static void gameState(void) {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToCave();
    }
    updateJungleStage();
    drawJungleStage();
}

static void bossState(void) {
    updateBossStage();
    drawBossStage();
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
    drawFullscreenImage4(winScreenBitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    waitForVBlank();
    flipPage();
}


static void loseState(void) {
    drawFullscreenImage4(loseScreenBitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
    waitForVBlank();
    flipPage();
}

void initStateMachine(void) {
    goToStart();
}

void resetSprites(void) {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void updateStateMachine(void) {
    switch (state) {
        case START:
            startState();
            break;
        case INSTRUCTIONS:
            instructionsState();
            break;
        case CAVE:
            caveState();
            break;
        case GAME:
            gameState();
            break;
        case PAUSE:
            pauseState();
            break;
        case BOSS:
            bossState();
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
