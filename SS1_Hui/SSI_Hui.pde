//minimalist-Hui Du
//Sliding mouse from 0,0 to 800,800.
//Pushing 'UP' button, pushing 'DOWN' button.

int x =300;
int y =300;
float easing = 0.03;
int d=255;
void setup(){
  size(800,800);
  smooth();
  frameRate(5);
}
void draw(){
  background(d);
  for(int l1=20;l1<width;l1+=80){
    float mx=mouseX/10;
    float  offsetUp=random(-mx,mx);
    float offsetDown=random(-mx,mx);
      strokeWeight(3);
    line(l1+offsetUp,20,l1-offsetDown,740);
  }
    for(int l2=20;l2<width;l2+=80){
    float my=mouseY/10;
    float  offsetLeft=random(-my,my);
    float offsetRight=random(-my,my);
      strokeWeight(3);
    line(20,l2+offsetLeft,740,l2-offsetRight);
  }
  
   
  if(keyPressed&&(key==CODED)){
  if(keyCode==UP){
   d=0;
  }else if(keyCode==DOWN){
    d=255;
  }
  background(d);
  }
}