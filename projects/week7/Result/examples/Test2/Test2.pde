import WK7.library.*;

Insetting test1;

void setup() {
  background(20,55,48);
  size(2100,1500);
  smooth();
  
  test1 = new Insetting(this);
  test1.LoadImage("Mudan1.png");
  test1.SettingUpScreenSize(width/2, height/2)
  test1. SettingUpBasePos(1500,900)
  test1.SetUpScale(0.25)
  test1.RectPaint();

}

void draw() {

}
