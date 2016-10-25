class Gem{
  
  float x,y;  //location
  float xspeed, yspeed; //speed
  //r. g. b are colors of gems
   float r =random(255);
   float g =random(255);
   float b =random(255);
   float a =random(255);
  Gem(){
    //gems locations
    x=random(width);
    y=random(height);
    
    xspeed=random(-5,5);
    yspeed=random(-5,5);
    
  }
  void move(){
    x+=xspeed;
    y+=yspeed;
    
    if (x>width||x<0){
      xspeed*=-1; 
    }
    if (y>height||y<0){
      yspeed*=-1; 
    }
  }
  void display(){
    //draw gems
    noStroke();
fill(random(r),random(g),random(b),random(a));//1
triangle(x+35,y+113,x+70,y+70,x+97,y+100);
fill(g,b,r,a);//2
triangle(x+35,y+113,x+70,y+70,x+25,y+66);
fill(b,r,g);//3
triangle(x+90,y+60,x+70,y+70,x+97,y+100);
fill(b,g,r);//5
triangle(x+90,y+60,x+70,y+70,x+50,y+30);
fill(random(b),random(r),random(g));//3
triangle(x+25,y+66,x+70,y+70,x+50,y+30);
fill(r,g,b,a);//1
triangle(x+25,y+66,x+15,y+35,x+50,y+30);
fill(r,g,g);//5
triangle(x+25,y+66,x+15,y+35,x+05,y+80);
fill(r,g,r);//4
triangle(x+25,y+66,x+35,y+113,x+05,y+80);
fill(b,r,g);//3
triangle(x+35,y+113,x+75,y+123,x+97,y+100);
fill(g,b,r,a);//2
triangle(x+90,y+60,x+85,y+40,x+50,y+30);
fill(random(r),random(g),random(r));//4
triangle(x+90,y+60,x+85,y+40,x+110,y+66);
fill(g,b,r,a);//2
triangle(x+90,y+60,x+97,y+100,x+110,y+66);
 
 if (mouseX< x+110 && mouseX< x-15 && mouseY<y+123&&mouseY>y+30&& mousePressed){
    x= x-50;
    y= y-50;
    r=115;
    g=115;
    b=115;
  }
  
  } 
}