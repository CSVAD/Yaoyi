import controlP5.*;

float speed;
float size;
float angle;
float leng;

ControlP5 controlP5;
Slider sizeSlider;
Slider angleSlider;
Slider speedSlider;
Slider lengSlider;

LSystem ls;

void setup(){
  
  size(1800,1500);
  setupGUI();
  frameRate(speed);

  ls = new LSystem();
}

void draw(){
  background(0, 11, 74);

  pushMatrix();
  ls.simulate(3);
  ls.render();
  popMatrix();

}
