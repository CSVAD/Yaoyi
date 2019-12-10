import drawing.library.*;
import processing.pdf.*;
import controlP5.*;

ChildApplet child;
ControlP5 cp5;

DrawingManager drawingManager;
int velNum = 30;
float velvertLength;
int velR = 0;
int velG = 0;
int velB = 0;

int colorStep = 100;
int colorStepCount;

ArrayList<DShape> velvert = new ArrayList<DShape>();

ColorWheel cw1;
ColorWheel cw2;
ColorWheel cw3;

Slider startSl;
Slider2D midSl;
Slider endSl;

void settings()
{
  size(1280, 1080, P3D);
  smooth();
}

void setup()
{
  background(255);
  frameRate(60);
  surface.setTitle("Main sketch");
  child = new ChildApplet();
  //setupGUI();
  drawingManager = new DrawingManager(this);
  drawingManager.strokeWeight(0.7);
}

void draw()
{
//here//check whether the mouse is pressed or not 
//evaluate how far we have moved
   if(mousePressed == true)
   {
     if(colorStepCount > colorStep)
     {
       colorStepCount = colorStep;
     }
     float ratio = (float)colorStepCount / (float)colorStep;
     float rate = ratio /0.5;
     if(ratio < 0.5)
     {
       velR = floor(cw1.r() * (1-rate) + cw2.r()*rate);
     velG = floor(cw1.g() * (1-rate) + cw2.g()*rate); 
     velB = floor(cw1.b() * (1-rate) + cw2.b()*rate); 
     }
     else
     {
       velR = floor(cw2.r()*(2 - rate) + cw3.r() * (rate -1 ));
     velG = floor(cw2.g()*(2 - rate) + cw3.g() * (rate-1));
     velB = floor(cw2.b()*(2 - rate) + cw3.b() * (rate - 1));
     }
     
     colorStepCount++;
      drawingManager.stroke(velR,velG,velB);
     PVector v = new PVector(mouseX-pmouseX,mouseY-pmouseY);
      PVector vn = new PVector(mouseX-pmouseX,mouseY-pmouseY);
      vn.normalize();
      DShape s2 = drawingManager.addShape();  
      DShape s3 = drawingManager.addShape();
      velvert.add(s2);
      velvert.add(s3);
      s2.translate(mouseX, mouseY);
      s3.translate(mouseX, mouseY);
      s2.rotate(radians(-20.0 + random(8)));
      s3.rotate(radians(20.0 - random(8)));
      s2.translate(-mouseX, -mouseY);
      s3.translate(-mouseX, -mouseY);
        
        int i = 0;
        for(i = 0 ; i < velNum ; i ++)
        {
            s2.addVertex(mouseX - vn.y * i * velvertLength ,mouseY + vn.x * i * velvertLength);
            s3.addVertex(mouseX + vn.y * i * velvertLength, mouseY - vn.x * i * velvertLength); 
        }
        
        float xPos = 0.5 * (mouseX + pmouseX);
        float yPos = 0.5 * (mouseY + pmouseY);
        if(v.mag() >= 80.0)
        {
          xPos = mouseX;
          yPos = mouseY;
        }
      DShape s4 = drawingManager.addShape();  
      DShape s5 = drawingManager.addShape();
      velvert.add(s4);
      velvert.add(s5);
      s4.translate(xPos, yPos);
      s5.translate(xPos, yPos);
      s4.rotate(radians(-20.0 + random(8)));
      s5.rotate(radians(20.0 - random(8)));
      s4.translate(-xPos, -yPos);
      s5.translate(-xPos, -yPos);
      
      float lengthRatio = midSl.getArrayValue()[0] / 100.0;
      float startLength = startSl.getValue();
      float midLength = midSl.getArrayValue()[1]/100.0;
      float endLength = endSl.getValue();
      if(ratio <= lengthRatio)
      {
        velvertLength = (lengthRatio-ratio)/lengthRatio * startLength + ratio/lengthRatio * midLength;
      }
      else
      {
        velvertLength = (1 - ratio) / (1 - lengthRatio) * midLength  + (ratio - lengthRatio) / (1 - lengthRatio) * endLength;
      }
      
      
      for(i = 0 ; i < velNum ; i ++)
        {
            s4.addVertex(xPos - vn.y * i * velvertLength,yPos + vn.x * i * velvertLength);
            s5.addVertex(xPos + vn.y * i * velvertLength, yPos - vn.x * i * velvertLength); 
        }
   }
}

void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
   if(key == 'c'){
    drawingManager.clear();
  }
  //stop drips when s is pressed
  if(key == 's'){
     velvert.clear(); 
  }
}

void mousePressed(){
  velvert.clear();
  colorStepCount = 0;
}
