import controlP5.*;
ControlP5 cp5;


float speed;
float size;
int amount = 200;

Controller speedSlider;
Controller sizeSlider;

SnowParticle[] snows = new SnowParticle[500];

int initFrame;

void setup(){
  size(1400, 1500, P3D);

  cp5 = new ControlP5(this);
  
  speedSlider = cp5.addSlider("speed")
    .setPosition(1050,150)
    .setSize(300,50)
    .setRange(0.1, 5.0)
    .setValue(1.0)
    ;
    
  sizeSlider = cp5.addSlider("size")
    .setPosition(1050,300)
    .setSize(300,50)
    .setRange(1.0, 3.0)
    .setValue(1.0)
    ;
    
    lights();
    
    initFrame = frameCount;
    drawParticleGenerater(); 
}

void draw(){
  
  clear();
  background(187, 75, 55);
  for(int i = 0 ; i < amount ; i++)
  {
    strokeWeight(0);
    pushMatrix();
    translate(0,0,snows[i].z);
    rotate(snows[i].rot);
    float trans = (frameCount - initFrame)*speed;
    ellipse(snows[i].x, snows[i].y + trans, 20 * size, 27 *size);
    popMatrix();
    
    if(snows[i].y > (float)height)
    {
      snows[i].y = 0.0;
    }
    
    if(snows[i].x < 0 || snows[i].x > (float)width)
    {
      snows[i].y = 0.0;
      snows[i].x = random(0,1000);
    }
    
  }

}

void drawParticleGenerater(){
  for(int i = 0 ; i < amount ; i++)
  {
    float x = random(0,1000);
    float y = random(0, height);
    float z = random(0, 100);
    
    float rot = random(radians(-30),radians(30));

    SnowParticle newSnow = new SnowParticle(x,y,z,rot);
    snows[i] = newSnow;
  }
}
