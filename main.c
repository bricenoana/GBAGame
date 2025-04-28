#include "gba.h"
#include "stateMachine.h"
#include "digitalSound.h"
#include "overallSong.h"
#include "text.h"

unsigned short buttons;
unsigned short oldButtons;

int main(void) {
    setupSounds();
    setupSoundInterrupts();
    initSound();

    initStateMachine();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        updateStateMachine();
    }
}
