// GAME VARIABLES


float friction = 0.99;
color vermell;
Ball pilota;
Table taula;

int numBalls = 5;

float strokeStrenght = 0.05;

Ball[] balls = new Ball[numBalls];

void setup(){ // SETUP
  
  size(1800,1000);
  
   
  taula = new Table();
  
  
  vermell = color(255,8,5);
  
  balls[0] = new Ball(500,500,friction,vermell,taula, 1);
  
  
  
  
}

void draw(){
  
  background(243,70,70);
  
  taula.paint();
  
  balls[0].wallCollision();
  
  if (!balls[0].isStop()) {balls[0].movement(); }
  
  else {
    throwLine();
  
  }
  println(balls[0].isStop());
  
  balls[0].paint();
  
  
  
}

void throwLine(){
  
  stroke(255);
  
  strokeWeight(3);
  
 // if (mouseX > taula.x0 && mouseX < taula.x1 && mouseY > taula.y0 && mouseY < taula.y1){
    line(mouseX,mouseY,balls[0].pos[0],balls[0].pos[1]);
 // }
  
}

void mouseClicked(){
  
  balls[0].transMatrix[0][2] = (mouseX - balls[0].pos[0]) /* / distance(mouseX,mouseY,balls[0].pos[0],balls[0].pos[1])*/ * strokeStrenght;
  balls[0].transMatrix[1][2] = (mouseY - balls[0].pos[1]) /* / distance(mouseX,mouseY,balls[0].pos[0],balls[0].pos[1]) */ * strokeStrenght;
  
}

float distance(float x1, float y1, float x2, float y2){
  
    return sqrt(sq(x1 - x2) + sq(y1 - y2));
}