#ifndef STATEMACHINE_H
#define STATEMACHINE_H

typedef enum {
    START,
    INSTRUCTIONS,
    OP1,
    OP2,
    OP3,
    OP4,
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
void goToOP1();
void goToOP2();
void goToOP3();
void goToOP4();
void goToGame(void);
void goToPause(void);
void goToWin(void);
void goToLose(void);

#endif
