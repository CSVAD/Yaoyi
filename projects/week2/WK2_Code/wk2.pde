PImage mudanFlower1,mudanFlower2,mudanFlower3;

int basicRes = 300;

void setup()
{
  background(20,55,48);
  size(2100,1500);
  
  mudanFlower1 = loadImage("Mudan.png");
  mudanFlower2 = loadImage("Mudan1.png");
  mudanFlower3 = loadImage("Mudan2.png");
  
  imageMode(CORNER);
  
  RectPaint(width, height, mudanFlower1, 0 , 0, 1);
  
  rectMode(CENTER); 
  fill(145,122,104);
  
  stroke(248,202,157);
  strokeWeight(8);
  rect(width/2, height/2,  1500, 900, radians(60));
  
  RectPaint(1500, 900, mudanFlower2, 300, 300, 1);
  
  fill(248,202,157);
  
  stroke(20,55,48);
  strokeWeight(8);
  rect(width/2, height/2,  900, 300, radians(60));
  
 RectPaint(900, 300, mudanFlower3, 600, 600, 1);
 
 save("result_5.png");
}


// For outside part
void RectPaint(int w, int h, PImage img, int baseX, int baseY, float scale){
  
  int rowCount = floor(w / (basicRes * scale)); 
  int subCount = floor(1 / scale);
  
  baseX = floor(baseX/scale);
  baseY = floor(baseY/scale); 
  
  for(int i = 0 ; i < rowCount ; i++)
  {
    for(int k = 0 ; k < subCount; k ++)
    {
       pushMatrix();
       scale(scale);
       translate(i * basicRes + baseX, baseY + basicRes * k);
       image(img,0, 0);
       popMatrix();
    
       pushMatrix();
       scale(scale);
       translate(i * basicRes + baseX, h / scale - basicRes + baseY - basicRes * k);
       image(img, 0, 0);
       popMatrix();
    }
  }
  
  int colCount = floor(h / (basicRes * scale)) - 2 - (subCount - 1);
  
  for(int j = 1 ; j <= colCount ; j++)
  {
    for(int k = 0 ; k < subCount; k ++)
    {
       pushMatrix();
       scale(scale);
       translate(baseX + basicRes * k, j * basicRes  + baseY);
       image(img, 0,0);
       popMatrix();
    
       pushMatrix();
       scale(scale);
       translate(w / scale - basicRes + baseX  - basicRes * k, j * basicRes + baseY );
       image(img, 0, 0);
       popMatrix();
    }
  }
  
}
