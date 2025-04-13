# Progress:

## Stages:
- Cave Stage: implemented a tile map and horizontal movement. Player goes to jungle stage whenever he reaches the end of the map. (need to add transition screen)
- Jungle Stage: fixed tilemap and collision map. Added a temple object that takes the player to the boss fight once he enters.
- Boss Stage: Implemented combat mechanics. Both player and boss can deal damage to each other + health system implemented. Can reach WIN/LOSE state now by defeating the boss or the player dying.

## Next steps:
- Want to add a sword that the player picks up in the cave stage before entering the jungle.
- In the jungle stage, I want to add a way to discover a "cheat" which helps the player out during the boss fight.

## Later on:
- Implement the opening cutscenes as mode4 images before the cave stage.
- Change the win/lose screens to adhere to the story.

## Needs Fixing:
- replace temporary boss stage tilemap with new one.
- be able to pause from boss stage and not restart from the jungle stage.

## State Machine:
- For debugging purposes, you are able to go to all three stages from the start screen right now.
- START: takes you to cave stage
- A Button: takes you to the jungle stage
- B Button: takes you to the boss stage
- SELECT: takes you to the instructions