class Firework{
  
  Particle particle;
  int PARTICLES_COUNT = 100;
  Particle particles[] = new Particle[PARTICLES_COUNT];
  boolean exploded = false;
  int lifespan = 255;
  
  // Jeigu nori kad butu visu particles spalva ta pati, bet fireworks skirtinga
   int r, g, b;
  
  
  Firework(int x, int y){
    particle = new Particle(x, y, true);
    
    r = (int)random(0, 255);
    g = (int)random(0, 255);
    b = (int)random(0, 255);
    
  }
  
  
  void show(){
    
    if(!exploded){
      particle.show(r, g, b, 255);
    }
    if(exploded && lifespan > 0){
      
      
      for(int i = 0; i < particles.length; i++){
        
        
          particles[i].show(r, g, b, lifespan);
        
      
      }
    }
  }
  
  void update(){
    
    if(!exploded){
      particle.update();
      
      if(particle.vel.y >= 0){
        
        exploded = true;
        explode();
        particle = null;
      
      }
    }
    
    
    if(exploded && lifespan > 0){
      for(int i = 0; i < particles.length; i++){
      
        particles[i].update();
        particles[i].vel.mult(0.9);
        
      
      }
      lifespan -= 4;
      
      if(lifespan <= 0){
        particles = null;
      }
      
    }
    
    
    
  }
  
  
  void explode(){
    
    for(int i = 0; i < PARTICLES_COUNT; i++){
      
      Particle p = new Particle((int)particle.pos.x, (int)particle.pos.y, false);
      particles[i] = p;
      
    }
    
    
  }
  
  void done(){
    if(lifespan <= 0){
      for(int i = 0; i < particles.length; i++){
        particles[i] = null;
      }
    }
  }
  
  boolean repeat(){
    if(lifespan <= 0){
      return true;
    } else return false;
  }
   
}
