#ifndef STATEMACHINE_H
#define STATEMACHINE_H

typedef enum {
    START,
    INSTRUCTIONS,
    CAVE,
    GAME,
    BOSS,
    PAUSE,
    WIN,
    LOSE
} GameState;

void initStateMachine(void);
void updateStateMachine(void);

void goToStart(void);
void goToInstructions(void);
void goToGame(void);
void goToPause(void);
void goToWin(void);
void goToLose(void);

#endif
