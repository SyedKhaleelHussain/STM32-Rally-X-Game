#line 1 "C:/Users/UCHIHA/Desktop/embedded system project/options_menu.c"
 void up_button();
 void down_button();
 void main_screen();
 void start_game();
 void score();
 void button_click();
 int x1=70,x2=130,y1=90,y2=130;

 void options_menu(){
 delay_ms(250);
 while(GPIOC_IDR.B13!=0) {
 TFT_Fill_Screen(CL_BLUE);
 TFT_Set_Brush(0, CL_RED, 0,0,0,0);
 TFT_Write_Text("START", 80, 100);
 TFT_Write_Text("SCORE", 80, 150);
 TFT_Write_Text("EXIT", 80, 200);
 TFT_Set_Brush(0, CL_RED, 0,0,0,0);
 TFT_Rectangle_Round_Edges(x1, y1, x2, y2, 6);
 if(GPIOD_IDR.B4==0){up_button();}
 else if(GPIOB_IDR.B5==0){down_button();}
 } button_click();}


 void up_button(){
 y1=y1-50;y2=y2-50;
 if(y1<90){x1=70;x2=130;y1=90;y2=130;}
 }

 void down_button(){
 y1=y1+50;y2=y2+50;
 if(y1>190){y1=190;y2=230;;}
 }
 void button_click(){
 if(y1==90){start_game();}
 else if(y1==140){score();}
 else if(y1==190){main_screen();} }
