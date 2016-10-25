class Catcher{
  float r; //radius
  float x; //lacation
  float y;
  
  Catcher(float tempR){
    r=tempR;
    x=0;
    y=0; 
  }
  void setLocation(float tempX, float tempY){
    x=tempX;
    y=tempY;
  }
  void dispaly(){
    stroke(0);
    fill(175);
    ellipse(x,y,r*2,r*2);
  }
  
}