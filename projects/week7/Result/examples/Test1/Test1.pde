import WK7.library.*;

Insetting test1;

void setup() {
  background(20,55,48);
  size(2100,1500);
  smooth();
  
  test1 = new Insetting(this);
  test1.LoadImage("Mudan.png");
  test1.SettingUpScreenSize(width, height)
  test1. SettingUpBasePos(0,0)
  test1.SetUpScale(1)
  test1.RectPaint();

}

void draw() {

}
