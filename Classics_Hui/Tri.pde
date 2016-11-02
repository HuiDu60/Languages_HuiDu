class Tri{
float e = 1;
float col=random(80,90);
float r=random(0,100);
float g=random(100,160);
float b=random(0,140);
float d=15;
float x2;
float y2;
float diameter;
int d2= 300;
//constructor 
  Tri(float start,float tempDiameter)
 {
   e = start;  
   diameter=tempDiameter;
 }
 void display(){
   
 fill(g,b,r,col);
 noStroke();
 rect((width/2)+x2, (height/2)+y2-d,(width/2)+x2+15, (height/2)+y2-35);
}

 void spin()
 {
 x2 = sin(e) * -d2;
 y2 = cos(e) * +d2;
 e = e + 0.03;
 }
void change(){
  if (keyPressed) {
      if (key== '1') {
        d--;
      } else if (key=='2') {
        d++;
      }
    }
}
}
  
  
  
  
  
  
  
  
  
  
 