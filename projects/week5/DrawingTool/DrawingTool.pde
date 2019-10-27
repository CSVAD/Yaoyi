import drawing.library.*;
import processing.pdf.*;

DrawingManager drawingManager;
DShape shape;
ArrayList<DShape> flowers = new ArrayList<DShape>();
PImage ptl;

ArrayList<DShape> snows = new ArrayList<DShape>();
float dripRate = 0.1;

void setup() {
  size(1800,1500,P3D);
  background(255);
  frameRate(20);
  smooth();
  
  ptl = loadImage("patel.png");
  imageMode(CORNER);
  
  drawingManager = new DrawingManager(this);
  drawingManager.stroke(243,184,229);
  
 }

void draw() {
   
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
     flowers.clear(); 
  }
}

void mouseDragged(){

  if(frameCount % 3 == 0)
  {
      float theta = radians(random(-120,120));
      drawingManager.pushMatrix();
      //drawingManager.translate(mouseX,mouseY);
      drawingManager.translate(pmouseX,pmouseY);
      drawingManager.rotate(theta);
      drawingManager.scale(random(0.05,0.4),random(0.05,0.4));
      drawingManager.image(ptl,-ptl.width/2,-ptl.height/2,ptl.width,ptl.height);
      drawingManager.translate(pmouseX-0.5,pmouseY-0.5);
      drawingManager.image(ptl,-ptl.width/2,-ptl.height/2,ptl.width,ptl.height);
      drawingManager.popMatrix();
  }
 
}
