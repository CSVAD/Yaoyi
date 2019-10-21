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
    axiom = "F-F-F-F-F";
    rule = "F-F++F+F-F-F";
    startLength = 200 * leng;
    theta = radians(15 * angle);
    reset();
  }
  
  void reset(){
    production = axiom;
    drawLength = startLength;
    generations = 0;
  }
  
  void render(){
    
    translate(width/2, height*0.8);
    
    steps += rule.length();
    if(steps > production.length()){
      steps = production.length();
    }
    
    for(int i = 0; i < steps; i++){
      char step = production.charAt(i);
      if(step == 'F')
      {
        fill(91, 168, 227);
        stroke(189, 216, 242);
        strokeWeight(2.0);
        float triLen = 20 * size * random(0.2, 5.0);
        //triangle(0,0,triLen,0, triLen * 0.5,triLen * sqrt(3));
        circle(0,0,triLen);
        
        translate(0, -(drawLength * random(0.2, 3.0)));
        
      }
       else if (step == '+') {
         
        rotate(theta * random(0.1,10));
        
      } 
      else if (step == '-') {
        
        rotate(-(theta * random(-10,-0.1)));
        
      } 
      else if (step == '[') {
        pushMatrix();
      } 
      else if (step == ']') {
        popMatrix();            
      }
    }
  }
  
  int getAge() {
    return generations;
  }
  
    void simulate(int gen) {
    while (getAge() < gen) {
      production = iterate(production, rule);
    }
  }

  String iterate(String prod_, String rule_) {
    drawLength = drawLength * 0.6;
    generations++;
    String newProduction = prod_;          
    newProduction = newProduction.replaceAll("F", rule_);
    return newProduction;
  }

}
