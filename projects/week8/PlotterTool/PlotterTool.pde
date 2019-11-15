import processing.pdf.*;

int sizex = 600;
int sizey = 400;
int unit = 100;

  size(792,612);
  int xNum = floor(sizex/unit);
  int yNum = floor(sizey/unit);
  int halfUnit = floor(unit/2);

  beginRecord(PDF, "plot.pdf"); 
  noFill();

  for(int i = 0; i <= xNum; i++)
  {
    for(int j = 0 ; j <= yNum; j++)
    {
      int total = i + j + 2;
      float scale = 1.0 * total/(xNum + yNum);
      float size = scale * unit;
      rect(i * unit + halfUnit, j * unit +halfUnit, size, size, 10);
    }
  }
  
  stroke(255,0,0);
  for(int i = 0; i <= xNum; i++)
  {
    for(int j = 0 ; j <= yNum; j++)
    {
      int total = i + j + 2;
      float scale = 1.0 - 1.0 * total/(xNum + yNum);
      float size = scale * unit;
      circle(i * unit + halfUnit, j * unit +halfUnit, size);
    }
  }
  
  endRecord();
