class LSystem{
  int steps = 0;
  
  String axiom;
  String rule;
  String production;
  
  float startLength;
  float drawLength;
  float theta;
  
  int generations;
  
  
  LSystem(){
    axiom = "F";
    rule = "F+F-F";
    startLength = 50.0;
    theta = radians(45.0);
    reset();
  }
  
  void reset(){
    production = axiom;
    drawLength = startLength;
    generations = 0;
  }
  
  void render(){
    translate(width/2, height);
    steps +=5;
    if(steps > production.length()){
      steps = production.length();
    }
    
    for(int i = 0; i < steps; i++){
      char step = production.charAt(i);
      if(step == 'F')
      {
        fill(168,35,35);
        stroke(196,164,0);
        strokeWeight(2.0);
        triangle(0,0,20,0, 10,17.3);
        translate(0, -drawLength);
      }
       else if (step == '+') {
        rotate(theta);
      } 
      else if (step == '-') {
        rotate(-theta);
      } 
      else if (step == '[') {
        pushMatrix();
      } 
      else if (step == ']') {
        popMatrix();            
      }
    }
  }
}
