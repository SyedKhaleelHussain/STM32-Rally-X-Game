#line 1 "C:/Users/UCHIHA/Desktop/embedded system project/RALLY_X_events_code.c"
#line 1 "c:/users/uchiha/desktop/embedded system project/rally_x_objects.h"
typedef struct Screen TScreen;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
};

extern TScreen Screen1;










void DrawScreen(TScreen *aScreen);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/users/uchiha/desktop/embedded system project/rally_x_resources.h"
