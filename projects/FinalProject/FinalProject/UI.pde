

class ChildApplet extends PApplet {

  public ChildApplet() {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(600, 500, P3D);
    smooth();
  }
  public void setup() { 
    surface.setTitle("Control Panel");
    cp5 = new ControlP5(this);    
    cp5.setColorBackground(color(255));
    cp5.setColorForeground(color(255));
    
    cw1 = cp5.addColorWheel("start color", 0, 0, 200)
           .setRGB(color(180,0,100))
           .setColorBackground(255);
           
    cw2 = cp5.addColorWheel("middle color", 200, 0, 200)
           .setRGB(color(230,200,245))
           .setColorBackground(255);
           
    cw3 = cp5.addColorWheel("end color", 400, 0, 200)
           .setRGB(color(0,0,100))
           .setColorBackground(255);
           
    startSl = cp5.addSlider("start width")
              .setHeight(200)
              .setWidth(50)
              .setPosition(50,250)
              .setRange(0.001,1.0)
              .setValue(0.5)
              ;
              
    endSl = cp5.addSlider("end width")
              .setHeight(200)
              .setWidth(50)
              .setPosition(450,250)
              .setRange(0.001,1.0)
              .setValue(0.5)
              ;
    midSl = cp5.addSlider2D("middle width")
            .setSize(200,200)
            .setPosition(175,250)
            .setMinMax(1.0,1.0,99,100.0)
            .setValue(50,50);
           
  }

  public void draw() {
    background(0);

   }

}
