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
#include "bossSong.h"
#include "overallSong.h"
#include "winSong.h"
#include "loseSong.h"
#include "opening1.h"
#include "opening2.h"
#include "opening3.h"
#include "opening4.h"

extern unsigned short buttons;
extern unsigned short oldButtons;

static GameState state;
static GameState prevState;


void goToStart(void) {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
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

    playSoundA(overallSong_data, overallSong_length, 1);
    
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
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
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

void goToOP1(void) {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240*160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i]  = 0;
    }
    
    DMANow(3, opening1Pal, BG_PALETTE, opening1PalLen/2);
    
    drawFullscreenImage4(opening1Bitmap);
    
    waitForVBlank();
    flipPage();
    
    state = OP1;
}


void goToOP2() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240*160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i]  = 0;
    }
    
    DMANow(3, opening2Pal, BG_PALETTE, opening2PalLen/2);
    
    drawFullscreenImage4(opening2Bitmap);
    
    waitForVBlank();
    flipPage();
    
    state = OP2;
}

void goToOP3() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240*160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i]  = 0;
    }
    
    DMANow(3, opening3Pal, BG_PALETTE, opening3PalLen/2);
    
    drawFullscreenImage4(opening3Bitmap);
    
    waitForVBlank();
    flipPage();
    
    state = OP3;
}

void goToOP4() {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
    for (int i = 0; i < 240*160; i++) {
        FRONTBUFFER[i] = 0;
        BACKBUFFER[i]  = 0;
    }
    
    DMANow(3, opening4Pal, BG_PALETTE, opening4PalLen/2);
    
    drawFullscreenImage4(opening4Bitmap);
    
    waitForVBlank();
    flipPage();
    
    state = OP4;
}

void goToPause(void) {
    prevState = state;
    
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
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
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
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
    playSoundA(winSong_data, winSong_length, 1);
    
    state = WIN;
}

void goToLose(void) {
    REG_DISPCTL = MODE(4) | BG_ENABLE(2) | DISP_BACKBUFFER;
    
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
    playSoundA(loseSong_data, loseSong_length, 1);
    
    state = LOSE;
}

void goToBossStage(void) {
    resetSprites();
    player.x = 32;
    player.y = 32;

    stopSounds();

    initBossStage();
    playSoundA(bossSong_data, bossSong_length, 1);

    state = BOSS;  
}


static void startState(void) {
    drawFullscreenImage4(startBGBitmap);

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToBossStage();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToCave();
    }
}

static void instructionsState(void) {
    drawFullscreenImage4(INSTRUCTIONSBitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToOP1();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToCave();
    }
    waitForVBlank();
    flipPage();
}

static void OP1State() {
    drawFullscreenImage4(opening1Bitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToOP2();
    }
    waitForVBlank();
    flipPage();
}

static void OP2State() {
    drawFullscreenImage4(opening2Bitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToOP3();
    }
    waitForVBlank();
    flipPage();
}

static void OP3State() {
    drawFullscreenImage4(opening3Bitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToOP4();
    }
    waitForVBlank();
    flipPage();
}

static void OP4State() {
    drawFullscreenImage4(opening4Bitmap);
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToCave();
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
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }

    updateBossStage();
    drawBossStage();
}


static void pauseState(void) {
    drawFullscreenImage4(pauseBitmap);
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        switch (prevState) {
            case CAVE:
                goToCave();
                break;
            case GAME:
                goToGame();
                break;
            case BOSS:
                goToBossStage();
                break;
            default:
                goToGame();
                break;
        }
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
        case OP1:
            OP1State();
            break;
        case OP2:
            OP2State();
            break;
        case OP3:
            OP3State();
            break;
        case OP4:
            OP4State();
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

