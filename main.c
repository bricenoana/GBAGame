#include "gba.h"
#include "stateMachine.h"

unsigned short buttons;
unsigned short oldButtons;

int main() {
    initStateMachine();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        updateStateMachine();
    }
}
