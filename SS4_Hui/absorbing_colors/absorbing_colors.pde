//absorbing colors of colorful gems 
//click mouse to absorb colors

//cacher on the mouse
Catcher catcher;
//array of gems
Gem[] gem= new Gem[30];
void setup(){
  size(1000,1000);
  catcher= new Catcher(32);
  //initialize all gems
  for(int i =0; i<gem.length; i++){
    gem[i]=new Gem();
   
  }
}

void draw(){
 background(255); 
  catcher.setLocation(mouseX, mouseY);
  catcher.dispaly();
  //move and dispaly all gems
  for(int i=0; i<gem.length; i++){
  gem[i].move();
  gem[i].display();
  }
 
}