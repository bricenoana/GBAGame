# Progress:

## State Machine:
- Press START to switch from start screen to game state
- Press SELECT while on the start screen to pull up instructions screen
- ^^ Instruction screen sometimes glitches and just changes palette instead of pulling up start screen (need to fix)
- Press SELECT during game to pull up pause screen
- Press SELECT during pause to go back to the game
- Made outlines for win/lose states as well

## Complex Movement and Camera
- Implemented movement and the camera follows the sprite around the map

## Boss Fight mechanic
- Began implementing core mechanics for the boss fight in "BossStage.c" and "BossStage.h"

## Player killing enemy
- Began implementing the ability for a player to kill an enemy, just hides their sprite for now.

## FIXING:
- Need help with tilemap and sprite, loading incorrectly, but can still see where sprite "is" around the map
- Have my own tilemap set up, but using Lab09's map and sprite right now to debug