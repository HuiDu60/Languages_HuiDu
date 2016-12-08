import processing.serial.*;

Serial myPort;
int sensorValue;

import ddf.minim.*;
import ddf.minim.effects.*;
int page=1;
PImage bird2_1, bird2_2, bird2_3, bird2_4, bird2_4_1, bird2_5,
       bird2_6, bird2_7, bird2_8, bird2_9, bird2_10, bird2_11,
       bird2_12,bird2_13,bird2_14,bird2_15,bird2_16,bird2_17,
       bird2_18,bird2_19,bird2_20,bird2_21,bird2_22,bird2_23,
       bird2_24,bird2_25,bird2_26,bird2_27,bird2_28;
Minim minim;
AudioSample kick;//line sound
AudioPlayer standing;//background sound
AudioPlayer goback;//fly sound
AudioPlayer group;//the soung of group
AudioPlayer angry;//the soung of birds angry

int e=1; //bire animation
int e1=1;
int a = 8;//by2=by2+a
int z=1;

int bx=450;//bird lacation 1
int by=373;
int b2x=370;//bird lacation 2
int b2y=373;

int bax=450;//bird lacation 1
int bay=373;
int ba2x=370;//bird lacation 2
int ba2y=373;

int bx2 = -50;//bird lacation 1
int by2 = -50;
int b2x2 = -120;//bird lacation 2
int b2y2 = -50;

int bbx1=450;//locations of group birds
int bbx2=350;
int bbx3=1000;
int bbx4=1000;
int bbx5=450;
int bbx6=-100;
int bbx7=-100;
int bbx8=-200;

int bby1=-100;
int bby2=-100;
int bby3=-100;
int bby4=100;
int bby5=700;
int bby6=400;
int bby7=300;
int bby8=200;

int t1,t2, t3;//time



void setup()
{
  size(900, 600, P3D);
  printArray(Serial.list());
  String FA131=Serial.list()[1];
  myPort= new Serial( this, FA131, 9600);
  
  frameRate(24);
  minim = new Minim(this);
  bird2_1=loadImage("stand1.png");
  bird2_2=loadImage("stand2.png");
  bird2_3=loadImage("stand3.png");
  bird2_4=loadImage("stand4.png");
  bird2_4_1=loadImage("stand5.png");
  bird2_5=loadImage("b1.png");
  bird2_6=loadImage("b2.png");
  bird2_7=loadImage("b3.png");
  bird2_8=loadImage("b4.png");
  bird2_9=loadImage("b5.png");
  bird2_10=loadImage("bs2_1.png");
  bird2_11=loadImage("bs2_2.png");
  bird2_12=loadImage("bb1.png");// group bird
  bird2_13=loadImage("bb2.png");
  bird2_14=loadImage("bb3.png");
  bird2_15=loadImage("bb4.png");
  bird2_16=loadImage("bb5.png");
  bird2_17=loadImage("bb1_2.png");
  bird2_18=loadImage("bb2_2.png");
  bird2_19=loadImage("bb3_2.png");
  bird2_20=loadImage("bb4_2.png");
  bird2_21=loadImage("bb5_2.png");
  bird2_22=loadImage("ba_l1.png");//birds angry animations
  bird2_23=loadImage("ba_l2.png");//birds angry
  bird2_24=loadImage("ba_l3.png");//birds angry
  bird2_25=loadImage("ba_r1.png");//birds angry
  bird2_26=loadImage("ba_r2.png");//birds angry
  bird2_27=loadImage("ba_r3.png");//birds angry
  bird2_28=loadImage("ba_r4.png");//birds angry

  // load BD.wav from the data folder
  kick = minim.loadSample( "BD.mp3", // filename
                            512      // buffer size
                         );
  // if a file doesn't exist, loadSample will return null
  //if ( kick == null ) println("Didn't get kick!");
   angry = minim.loadFile( "angry2.wav", 2048);
  //if ( standing == null ) println("Didn't get standing!");
  
   standing = minim.loadFile( "jjzz.wav", 2048);
  //if ( standing == null ) println("Didn't get standing!");
  
  goback = minim.loadFile( "goback.wav", 2048);
  //if ( goback == null ) println("Didn't get goback!");
  group = minim.loadFile( "jjzz2.wav", 2048);
  //if ( group == null ) println("Didn't get group!");
  
    standing.play(); //sound of birds
    standing.loop(); //sound of birds
    //standing.rewind(); 
  }

void draw()
{
  background(0);
  t1=millis();//println(t1,t2); 
  stroke(255);
  strokeWeight(2);
   
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
   //line(x1, 150 - kick.mix.get(i)*50, x2, 150 - kick.mix.get(i+1)*50);
       line(x1, 450 - kick.mix.get(i)*50, x2, 450 - kick.mix.get(i+1)*50);
       }
       
       ///////////////////////////////trigger sensor to change page
if(myPort.available()>0){
    sensorValue=myPort.read();
  }
   if(sensorValue<100){
  kick.trigger();
 
  if( page ==1&& z==1){
    t3=t1;
    page=0;
    angry.play(10);
    angry.rewind(); 
    z++;
  }
  else if( page==1&&z==2){
   
     page = 2;
     goback.play(); 
     goback.rewind();
     z=1;
     
   }
   
   else if( page ==2 ){
     goback.play(); 
     goback.rewind(); 
   }
     else if( page ==3){
       
    if(bx2>0&& bx2<450&& b2x2>0&& b2x2<370){
      
      a*=-1; 
      page=4;
    }
   }
  }
  println(sensorValue); 
     
     //////////////////////////////////////////page1:birds standing on wire
   if (page == 1) {
     bx=450;//bird lacation 1
     by=373;
     b2x=370;//bird lacation 2
     b2y=373;
    if(e==1){
      delay(200);
      image(bird2_1,bx, by);//bird 1
      image(bird2_10,b2x, b2y);//bird 2
      e++;
    }else if(e==2){
      delay(200);
      image(bird2_4_1,bx, by);
      image(bird2_11,b2x, b2y);//bird 2
      e=1; 
      
    }
   }
        //////////////////////////////////////////page0:birds angry on wire
   if (page == 0) {
     angry.play();
     bax=450;//bird lacation 1
     bay=346;
     ba2x=370;//bird lacation 2
     ba2y=373; 
     if(e1==1){
      delay(200);
      image(bird2_25,bax, bay);//bird 1
      image(bird2_22,ba2x, ba2y);//bird 2
      e1++;
     
    }else if(e1==2){
      delay(200);
      image(bird2_27,bax, bay);
      image(bird2_23,ba2x-10, ba2y);//bird 2
      e1++; 
      delay(10);
    }else if(e1==3){
      delay(200);
      image(bird2_28,bax+30, bay-30);
      image(bird2_24,ba2x-10, ba2y);//bird 2
      e1=1;      
      delay(20);

    }
      if (t1-t3>900){  /////////////////// look at this condition

     bx=450;//bird lacation 1
     by=373;
     b2x=370;//bird lacation 2
     b2y=373;
     z=2;
     page=1;
      }
     
   }
    //////////////////////////////////////////////////page2:birds fly away
  if (page == 2) {
     
      bx=bx+10;
      by=by-10;
      b2x=b2x+10;
      b2y=b2y-10;
     z=1;
 
    if(e==1){
      image(bird2_5,bx, by);//bird1
      image(bird2_8,b2x, b2y);//bird2
      e++;
    }else if(e==2){
      image(bird2_6,bx, by);
      image(bird2_9,b2x, b2y);
      e++;
    }else if(e==3){
      image(bird2_7,bx, by);
      image(bird2_5,b2x, b2y);
      e++;
    }else if(e==4){
      image(bird2_8,bx, by);
      image(bird2_6,b2x, b2y);
      e++;
    }else if(e==5){
      image(bird2_9,bx, by);
      image(bird2_7,b2x, b2y);
      e=1;  
    }
    
    if ( bx >1500 )
   {
    bx2 = -50;//bird lacation 1
    by2 = -50;
    b2x2 = -120;//bird lacation 2
    b2y2 = -50;
    page=3;
    t1=t2;
    goback.play(); 
    goback.rewind(); 
   }
    

   }
    /////////////////////////////////////////////////page3:birds go back
 if (page == 3) {
    if(t1-t2>5000){
     bx2=bx2+8;
     by2=by2+a;
     b2x2=b2x2+8;
     b2y2=b2y2+a;
    }


    if(e==1){
      image(bird2_5,bx2, by2);//bird1
      image(bird2_8,b2x2, b2y2);//bird2
      e++;
    }else if(e==2){
      image(bird2_6,bx2, by2);
      image(bird2_9,b2x2, b2y2);
      e++;
    }else if(e==3){
      image(bird2_7,bx2, by2);
      image(bird2_5,b2x2, b2y2);
      e++;
    }else if(e==4){
      image(bird2_8,bx2, by2);
      image(bird2_6,b2x2, b2y2);
      e++;
    }
    else if(e==5){
      image(bird2_9,bx2, by2);
      image(bird2_7,b2x2, b2y2);
      e=1;  
    }

    if( bx2>=371&& b2x2>=301){
   
     a = 8;
     bx=450;//bird lacation 1
     by=373;
     b2x=370;//bird lacation 2
     b2y=373;
     e=1;
     page = 1;
    }
    
   } 
       /////////////////////////////////////////////////page4:birds fly again
 if (page == 4) {
     bx2=bx2+8;
     by2=by2+a;
     b2x2=b2x2+8;
     b2y2=b2y2+a;
     
   if(e==1){
      image(bird2_5,bx2, by2);//bird1
      image(bird2_8,b2x2, b2y2);//bird2
      e++;
    }else if(e==2){
      image(bird2_6,bx2, by2);
      image(bird2_9,b2x2, b2y2);
      e++;
    }else if(e==3){
      image(bird2_7,bx2, by2);
      image(bird2_5,b2x2, b2y2);
      e++;
    }else if(e==4){
      image(bird2_8,bx2, by2);
      image(bird2_6,b2x2, b2y2);
      e++;
    }
    else if(e==5){
      image(bird2_9,bx2, by2);
      image(bird2_7,b2x2, b2y2);
      e=1;  
    }
    
     if(by2<-500 && b2y2<-500){
     goback.play(); 
     goback.rewind(); 
     group.play(); 
     group.rewind();
     bbx1=450;
     bbx2=350;
     bbx3=1000;
     bbx4=1000;
     bbx5=450;
     bbx6=-100;
     bbx7=-100;
     bbx8=-200;
     
     bby1=-100;
     bby2=-100;
     bby3=-100;
     bby4=100;
     bby5=700;
     bby6=400;
     bby7=300;
     bby8=200;
     
     page=5;
 
   }
   
}
       /////////////////////////////////////////////////page5:group birds fly 
 if (page == 5) {
    
     bbx1=bbx1+8;
     bby1=bby1+8;
     bbx2=bbx2+8;
     bby2=bby2+8;
     bbx3=bbx3-8;
     bby3=bby3+8;
     bbx4=bbx4-8;
     bby4=bby4+8;
     bbx5=bbx5-8;
     bby5=bby5-8;
     bbx6=bbx6+8;
     bby6=bby6-8;
     bbx7=bbx7+8;
     bby7=bby7-2;
     bbx8=bbx8+8;
     bby8=bby8-2;
     
       if(e==1){
      image(bird2_12,bbx1, bby1);
      image(bird2_15,bbx2, bby2);
      image(bird2_17,bbx3, bby3);
      image(bird2_20,bbx4, bby4);
      image(bird2_19,bbx5, bby5);
      image(bird2_14,bbx6, bby6);
      image(bird2_12,bbx7, bby7);
      image(bird2_13,bbx8, bby8);
      e++;
    }else if(e==2){
      image(bird2_13,bbx1, bby1);
      image(bird2_16,bbx2, bby2);
      image(bird2_18,bbx3,bby3);
      image(bird2_21,bbx4, bby4);
      image(bird2_20,bbx5, bby5);
      image(bird2_15,bbx6, bby6);
      image(bird2_13,bbx7, bby7);
      image(bird2_14,bbx8, bby8);
      e++;
    }else if(e==3){
      image(bird2_14,bbx1, bby1);
      image(bird2_12,bbx2, bby2);
      image(bird2_19,bbx3, bby3);
      image(bird2_17,bbx4, bby4);
      image(bird2_21,bbx5, bby5);
      image(bird2_16,bbx6, bby6);
      image(bird2_14,bbx7, bby7);
      image(bird2_15,bbx8, bby8);
      e++;
    }else if(e==4){
      image(bird2_15,bbx1, bby1);
      image(bird2_13,bbx2, bby2);
      image(bird2_20,bbx3, bby3);
      image(bird2_18,bbx4, bby4);
      image(bird2_17,bbx5, bby5);
      image(bird2_12,bbx6, bby6);
      image(bird2_15,bbx7, bby7);
      image(bird2_16,bbx8, bby8);
      e++;
    }else if(e==5){
      image(bird2_16,bbx1, bby1);
      image(bird2_14,bbx2, bby2);
      image(bird2_21,bbx3, bby3);
      image(bird2_19,bbx4, bby4);
      image(bird2_18,bbx5, bby5);
      image(bird2_13,bbx6, bby6);
      image(bird2_16,bbx7, bby7);
      image(bird2_12,bbx8, bby8);
      e=1;  
    }
 if(bbx7>1200){
    t1=t2;
    goback.play(); 
    goback.rewind(); 
    a*=-1;
    bx2 = -50;//bird lacation 1
    by2 = -50;
    b2x2 = -120;//bird lacation 2
    b2y2 = -50;

    page=3;
     bx=450;//bird lacation 1
     by=373;
     b2x=370;//bird lacation 2
     b2y=373;
    }
   
 }
   println("key: " + key + "   page: " + page); 
   println ("t1: " + t1 + " t2: " + t2 + " t3: " + t3);
   println("page: " + page + "  bx: " + bx + "  by: " + by + "  b2x: " + b2x + "  b2y: " + b2y ); 

   }




void mousePressed(){
  kick.trigger();
 
  if( page ==1&& z==1){
    t3=t1;
    page=0;
    angry.play(10);
    angry.rewind(); 
    z++;
  }
  else if( page==1&&z==2){
   
     page = 2;
     goback.play(); 
     goback.rewind();
     z=1;
     
   }
   
   else if( page ==2 ){
     goback.play(); 
     goback.rewind(); 
   }
     else if( page ==3){
       
    if(bx2>0&& bx2<450&& b2x2>0&& b2x2<370){
      
      a*=-1; 
      page=4;
    }
   }

}

////////////
void keyPressed(){
  if (key=='0'){
    page=0; // birds angry
  }
  else if (key=='1'){
    page=1; //birds standing on the wire
  }
  else if (key=='2'){
    page=2;  //birds fly away
  }
  else if (key=='3'){  
    page=3;  ////birds fly back
  }
  else if (key=='4'){
    page=4;  //birds fly away again when the birds in the process of fly back
  }
    else if (key=='5'){
      page=5;  //a group of birds fly on the screen
  }

}