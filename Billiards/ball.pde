
class Ball{
  
  
  float[] pos = new float[3];
  
  float r = 20; // ball radius
  
  color c; // ball color 
  
  float n; // ball number
  
  float f; // friccio
  
  float[][] transMatrix = new float[3][3];
  
  Table tauler;
  
  float stopDetection = 0.1;
  
  int num;
  
  
  
  
  
  Ball(float posx, float posy, float friccio, color _color, Table taula, int numerito){ // constructor
  
  transMatrix[0][0] = 1.f;
  transMatrix[0][1] = 0.f;
  transMatrix[0][2] = 0.f;
  transMatrix[1][0] = 0.f;
  transMatrix[1][1] = 1.f;
  transMatrix[1][2] = 0.f;
  transMatrix[2][0] = 0.f;
  transMatrix[2][1] = 0.f;
  transMatrix[2][2] = 1.f;
  
  pos[0] = posx;
  pos[1] = posy;
  pos[2] = 1.f;
  
    
  f = friccio;
  
  c = _color;
  
  tauler = taula;
  
  num = numerito;
  
  }
  
  boolean isStop(){ // detecta si la bola esta aturada
  
  
  
  return (abs(transMatrix[0][2]) < stopDetection && abs(transMatrix[1][2]) < stopDetection);
  

}
  
  void movement(){ // fa jmoure la bola i actualitza la velocitat
    
    matrix3x3by1x3(pos,transMatrix);
    
    transMatrix[0][2] *= f;
   transMatrix[1][2] *= f;
    
  }
  
  void paint(){ // pinta la bola
    
    stroke(0);
    strokeWeight(1);
    fill(c);
            
    ellipse(pos[0],pos[1],r,r);
    
  }
  
  
  Ball collisionBall(){
    Ball report = null; 
  
      for (int i = 0; i < numBalls; i++){
        
        if (distance(balls[i].pos[0],balls[i].pos[1],pos[0],pos[1]) < r + balls[i].r && distance(balls[i].pos[0],balls[i].pos[1],pos[0],pos[1]) != 0)
        {
          report = balls[i];
        }
      }
      return report;
  }
  
  
  
  void wallCollision(){
    
    if (pos[0] + transMatrix[0][2] < tauler.x0 || pos[0] + transMatrix[0][2] > tauler.x1){
      transMatrix[0][2] *= -1;
    }
    if (pos[1] + transMatrix[1][2]  < tauler.y0 || pos[1] + transMatrix[1][2] > tauler.y1){
      transMatrix[1][2] *= -1;
    }
    
    
    
  }
  
  /*float distance(float x1, float y1, float x2, float y2){
  
    return sqrt(sq(x1 - x2) + sq(y1 - y2));
  }*/
  
  void matrix3x3by1x3(float matrix3x1[],float matrix3x3[][]) 
{ 
  float xf,yf,zf;
  
  
  xf = matrix3x3[0][0]*matrix3x1[0] + matrix3x3[0][1]*matrix3x1[1] + matrix3x3[0][2]*matrix3x1[2];
  
  yf = matrix3x3[1][0]*matrix3x1[0] + matrix3x3[1][1]*matrix3x1[1] + matrix3x3[1][2]*matrix3x1[2];  
  
  zf = matrix3x3[2][0]*matrix3x1[0] + matrix3x3[2][1]*matrix3x1[1] + matrix3x3[2][2]*matrix3x1[2];
  
 
  matrix3x1[0] = xf; 
  matrix3x1[1] = yf;
  matrix3x1[2] = zf;

  
}
  
  
  
  
  
  
}