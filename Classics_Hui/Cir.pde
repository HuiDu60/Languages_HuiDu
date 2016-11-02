class Cir{
float a = 1;
float col=random(0,255);
float r=random(10,200);
float g=random(100,200);
float b=random(100,200);
float x1;
float y1;
float diameter;
int d=200 ;
int R;
//constructor 
  Cir(float start,float tempDiameter)
 {
   a = start;  
   diameter=tempDiameter;
 }
 void display(){
 fill(r,g,b,col);
 noStroke();
 rect ((width/2)+x1, (height/2)+y1, diameter,diameter); 
 fill(g,b,r,col);
ellipse ((width/2)+x1, (height/2)+y1, 20+diameter,20+diameter);  
}
 void spin()
 {
 x1 = sin(a) * d;
 y1 = cos(a) * d;
 a = a + 0.01;
 }
void change(){
  if (keyPressed) {
      if (key== '1') {
        diameter++; d++;
      } else if (key=='2') {
        diameter--; d--;
      }
    }
}
}
  
  
  
  
  
  
  
  
  
  
 