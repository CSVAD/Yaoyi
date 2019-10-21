void setupGUI(){
  
   color activeColor = color(82, 153, 191);
   controlP5 = new ControlP5(this);
   
   controlP5.setColorActive(activeColor);
   controlP5.setColorBackground(color(19, 90, 128));
   controlP5.setColorForeground(color(99, 165, 201));
   controlP5.setColorCaptionLabel(color(255));
   controlP5.setColorValueLabel(color(255));
   
   sizeSlider = controlP5.addSlider("size")
                         .setPosition(100,100)
                         .setSize(300,50)
                         .setRange(0.2, 5.0)
                         .setValue(1.0);
   angleSlider = controlP5.addSlider("angle")
                          .setPosition(100,200)
                          .setSize(300,50)
                          .setRange(0.1, 20.0)
                          .setValue(1.0);
   speedSlider = controlP5.addSlider("speed")
                          .setPosition(100,300)
                          .setSize(300,50)
                          .setRange(1, 60.0)
                          .setValue(10.0);
   lengSlider = controlP5.addSlider("leng")
                          .setPosition(100,400)
                          .setSize(300,50)
                          .setRange(0.1, 10.0)
                          .setValue(1.0);
}
