// la vida en auto-stop

class Table {
  
  float x0,y0;
  
  float x1,y1;
  
  float llargada = 1200;
  float amplada = 600;
  
  float marges = 60;
  
  float holeRadi = 60;
  
  
  Table(){
  x0 = width / 2 - llargada / 2;
  
  y0 = height / 2 - amplada / 2;
  
  x1 = width / 2 + llargada / 2;
  
  y1 = height / 2 + amplada / 2;
  
  }
  
  void paint(){
    
    
    
    strokeWeight(2);
        
    
    fill(102,51,0);
    quad(x0 - marges,y0- marges,x0- marges,y1+ marges,x1+ marges,y1+ marges,x1+ marges,y0- marges); // pinta els voltants
    
    fill(0,153,76);
    quad(x0,y0,x0,y1,x1,y1,x1,y0); // pintar la taula
    
    fill(0);
    
    for(int i = 0; i < 6; i++){
      
      ellipse(getHoleX(i),getHoleY(i),holeRadi,holeRadi);
      
    }
    
  }
  
  float getHoleX(int num){
    
    float report = 0;
    switch (num){
      
     case 0:
     case 3:
       report = x0;
       break;
     case 1:
     case 4:
       report = x0 + (x1 - x0) / 2;
       break;
     case 2:
     case 5:
       report = x1;
       break;
    
  }
  return report;
  }
  
  float getHoleY(int num){
    float report = 0;
    switch (num){
      
     /*case 0:
     case 1:
     case 2:
       report = y0;
       break;
     case 3:
     case 4:
     case 5:
       report = y1;
       break;*/
       
         case 0:
       case 2:
       report = y0;
       break;
     case 1:
       report = y0 - 10;
       break;
     case 3:
     case 5:
       report = y1;
       break;
     case 4:
       report = y1 + 10;
       break;
  }
  return report;
  }
};

void setup(){
  
  size(1800,1000);
  
  background(243,70,70);
  
  Table taula = new Table();
  
  taula.paint();
  
  
  
}