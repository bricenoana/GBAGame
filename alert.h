#ifndef ALERT_H
#define ALERT_H

typedef struct {
    int worldX;
    int worldY;
    int screenX;
    int screenY;
    int active;
} Alert;

extern Alert alert;

void initAlert();

void updateAlert(int hOff, int vOff);

void drawAlert(int hOff, int vOff);

#endif
