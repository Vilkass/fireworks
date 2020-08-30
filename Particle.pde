class Particle{
   PVector pos;
   PVector vel;
   PVector acc;
   
   // Jeigu nori kad butu visu particles spalva skirtinga
   //int r, g, b;
   
  Particle(int x, int y, boolean firework){
     pos = new PVector(x,y);
     if(firework){
       vel = new PVector(0,(int)random(-15,-9));
     } else{
       vel = PVector.random2D();
       vel.mult(random(2, 8));
     }
     acc = new PVector(0,0);
     
     //r = (int)random(0, 255);
     //g = (int)random(0, 255);
     //b = (int)random(0, 255);
    
  }
  
  void show(int r, int g, int b, int lifespan){
    fill(r, g, b, lifespan);
    ellipse(pos.x,pos.y,5,5);  
  }
  
  void applyForce(PVector force){
    vel.add(force);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    applyForce(gravity);
  }

}
