import drawing.library.*;
import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;
DrawingManager drawingManager;

int knobCValue1 = 50;
int knobCValue2 = 50;
int knobCValue3 = 50;

Knob Cknob1;
Knob Cknob2;
Knob Cknob3;

void setup() {
  size(1800,1500,P3D);
  background(255);
  frameRate(20);
  smooth();
  
  cp5 = new ControlP5(this);
  
  Cknob1 = cp5.addKnob("Red")
               .setRange(0,255)
               .setValue(50)
               .setColorForeground(color(255))
               .setColorActive(color(255,255,255)) 
               .setColorBackground(color(knobCValue1, 20, 20))
               .setPosition(70,100)
               .setRadius(200)
               .setDragDirection(Knob.VERTICAL)
               ;
  Cknob2 = cp5.addKnob("Green")
               .setRange(0,255)
               .setValue(50)
               .setColorForeground(color(255))
               .setColorActive(color(255,255,255)) 
               .setColorBackground(color(20, knobCValue2, 20))
               .setPosition(70,500)
               .setRadius(200)
               .setDragDirection(Knob.VERTICAL)
               ;
  Cknob3 = cp5.addKnob("Blue")
               .setRange(0,255)
               .setValue(50)
               .setColorForeground(color(255))
               .setColorActive(color(255,255,255)) 
               .setColorBackground(color(20, 20,knobCValue3))
               .setPosition(70,900)
               .setRadius(200)
               .setDragDirection(Knob.VERTICAL)
               ;
  
  drawingManager = new DrawingManager(this);

  
 }

void draw() {
  knobCValue1 = (int)Cknob1.getValue();
  knobCValue2 = (int)Cknob2.getValue();
  knobCValue3 = (int)Cknob3.getValue();
  
  Cknob1.setColorBackground(color(knobCValue1, 20, 20));
  Cknob2.setColorBackground(color(20, knobCValue2, 20));
  Cknob3.setColorBackground(color(20, 20,knobCValue3));
  
  drawingManager.stroke(knobCValue1,knobCValue2,knobCValue3);
  drawingManager.fill(knobCValue1,knobCValue2,knobCValue3);
}

void keyPressed() {
  if(key == ' '){
    drawingManager.savePDF();
  }
   if(key == 'c'){
    drawingManager.clear();
  }

}

void mouseDragged(){

  if(frameCount % 5 == 0)
  {
      float theta = radians(random(-120,120));
      drawingManager.pushMatrix();
      //drawingManager.translate(mouseX,mouseY);
      drawingManager.translate(pmouseX,pmouseY);
      drawingManager.rotate(theta);
      drawingManager.scale(random(0.5,1.2),random(0.5,1.2));
      drawingManager.ellipse(0,0,40,30);
      drawingManager.popMatrix();
  }
 
}
