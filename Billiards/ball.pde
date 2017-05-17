
class Ball{
  
  
  float x; // ball pos x
  float y; // ball pos y
  
  float r = 20; // ball radius
  
  color c; // ball color 
  
  float n; // ball number
  
  float f; // friccio
  
  float velx = 20; // ball veloxity x
  float vely = 20; // ball velocity y
  
  
  
  
  
  
  
  Ball(float posx, float posy, float friccio, color _color, Table taula){ // constructor
  
  x = posx;
  
  y = posy;
  
    
  f = friccio;
  
  c = _color;
  
  
  }
  
  boolean isStop(){ // detecta si la bola esta aturada
  
  
  
  return ((velx > 0 && velx + f > 0) && (vely > 0 && vely + f > 0));


}
  
  void movement(){ // fa jmoure la bola i actualitza la velocitat
    
    x += velx;
    y += vely;
    
    velx += f;
    vely += f;
    
  }
  
  void paint(){ // pinta la bola
    
    fill(c);
            
    ellipse(x,y,r,r);
    
  }
  
  
  
  
  
}