/*
Hui Du 11/6
cleck every square there will be different sound
*/

import ddf.minim.*;

//input sounds
Minim minim;
AudioSample kick;
AudioSample tan;
AudioSample CHH;
AudioSample drup;
AudioSample water1;
AudioSample water2;

void setup()
{
  size(500, 500, P3D);
  minim = new Minim(this);

  // load BD.wav from the data folder
  kick = minim.loadSample( "BD.mp3", // filename
                            512      // buffer size
                         );
              
  // if a file doesn't exist, loadSample will return null
  if ( kick == null ) println("Didn't get kick!");
  
  // load SD.wav from the data folder
  tan = minim.loadSample("SD.wav", 520);
  if ( tan == null ) println("Didn't get snare!");
  
  CHH = minim.loadSample("CHH.wav", 520);
  if ( CHH == null ) println("Didn't get CHH!");
  
   drup = minim.loadSample("drup.mp3", 520);
  if ( drup == null ) println("Didn't get drup!");
     water1 = minim.loadSample("water1.mp3", 520);
  if ( water1 == null ) println("Didn't get water1!");
    water2 = minim.loadSample("water2.wav", 520);
  if ( water2 == null ) println("Didn't get water2!");
}

void draw()
{
  background(0);
  stroke(255);
  
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, kick.bufferSize(), 0, width);
    float x2 = map(i+1, 0, kick.bufferSize(), 0, width);
    line(x1, 350 - kick.mix.get(i)*50, x2, 350 - kick.mix.get(i+1)*50);
    line(x1, 150 - kick.mix.get(i)*50, x2, 150 - kick.mix.get(i+1)*50);
    stroke(234,23,24);
    fill(234,23,24);
    rect(100, 200, 55, 55);
    rect(20, 255, 55, 55);
    rect(180, 255, 55, 55);
    rect(260, 200, 55, 55);
    rect(340, 255, 55, 55);
    rect(420, 200, 55, 55);
  }
}

void keyPressed() 
{
  if ( key == 's' ) tan.trigger();
  if ( key == 'k' ) kick.trigger();
}
void mousePressed(){
  kick.trigger();
  if (mouseX>20 && mouseX<75&&mouseY>255&&mouseY<310){
    tan.trigger();
    fill(25);
    rect(20, 255, 55, 55);
  }
  if (mouseX>100 && mouseX<155&&mouseY>200&&mouseY<255){
    CHH.trigger();
     fill(25);
     rect(100, 200, 55, 55);
  }
   if (mouseX>180 && mouseX<235&&mouseY>255&&mouseY<310){
    drup.trigger();
     fill(25);
     rect(180, 255, 55, 55);
  }
  if (mouseX>260 && mouseX<315&&mouseY>200&&mouseY<255){
    water2.trigger();
     fill(25);
     rect(260, 200, 55, 55);
  }
  if (mouseX>340 && mouseX<395&&mouseY>255&&mouseY<310){
    water1.trigger();
     fill(25);
     rect(340, 255, 55, 55);
  }
}