//colorful gem

PFont font;

int x =300;
int y =300;
float easing = 0.03;


void setup(){

size(800,800);
smooth();


font =loadFont("Dialog-48.vlw");
textFont(font);
}

void draw(){
  int d=255;

strokeJoin(ROUND);
 
 //float targetX =mouseX;
 float targetX =mouseX;
 x+=(targetX-x)*easing;
 float targetY =mouseY;
 y+=(targetY-y)*easing;

 float r =random(255);
float g =random(255);
float b =random(255);
float a =random(255);


if(keyPressed&&(key==CODED)){
  if(keyCode==UP){
   d=0;
  }else if(keyCode==DOWN){
    d=255;
  }
}
background(d);
noStroke();
fill(r,g,b,a);//1
triangle(x+35,y+113,x+70,y+70,x+97,y+100);
fill(g,b,r,a);//2
triangle(x+35,y+113,x+70,y+70,x+25,y+66);
fill(b,r,g);//3
triangle(x+90,y+60,x+70,y+70,x+97,y+100);
fill(176,196,229);//5
triangle(x+90,y+60,x+70,y+70,x+50,y+30);
fill(b,r,g);//3
triangle(x+25,y+66,x+70,y+70,x+50,y+30);
fill(r,g,b,a);//1
triangle(x+25,y+66,x+15,y+35,x+50,y+30);
fill(176,196,229);//5
triangle(x+25,y+66,x+15,y+35,x+05,y+80);
fill(r,g,r);//4
triangle(x+25,y+66,x+35,y+113,x+05,y+80);
fill(b,r,g);//3
triangle(x+35,y+113,x+75,y+123,x+97,y+100);
fill(g,b,r,a);//2
triangle(x+90,y+60,x+85,y+40,x+50,y+30);
fill(r,g,r);//4
triangle(x+90,y+60,x+85,y+40,x+110,y+66);
fill(g,b,r,a);//2
triangle(x+90,y+60,x+97,y+100,x+110,y+66);


textSize(102);
text("COLOFUL GEM",50,300);


}

void mousePressed(){
  println("COLORFUL GEM");
}



  
  
  
  
  
  
  
  