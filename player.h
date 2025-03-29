
#ifndef PLAYER_H
#define PLAYER_H

typedef struct {
    int x;           
    int y;           
    int width;         
    int height;     
    int xVel;         
    int yVel;         
    int currentFrame;  
    int numFrames;    
    int timeUntilNextFrame;
    int isAnimating;
    int direction;
} Player;

#endif
