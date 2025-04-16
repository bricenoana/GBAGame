#include "gba.h"
#include "stateMachine.h"
#include "digitalSound.h"
#include "overallSong.h"

unsigned short buttons;
unsigned short oldButtons;

int main() {
    initStateMachine();
    setupSounds();
    setupSoundInterrupts();
    
    // playSoundA(overallSong_data, overallSong_length, 1);

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        updateStateMachine();
    }
}
