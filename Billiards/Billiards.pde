// GAME VARIABLES


float friction = 0.3;
color vermell;
Ball pilota;
Table taula;

void setup(){ // SETUP
  
  size(1800,1000);
  
   
  taula = new Table();
  
  
  vermell = color(255,8,5);
  
  pilota = new Ball(500,500,friction,vermell);
  
  
  
  
}

void draw(){
  
  background(243,70,70);
  
  taula.paint();
  
  pilota.paint();
  
  pilota.movement();
  
}