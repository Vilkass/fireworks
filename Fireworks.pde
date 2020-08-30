int FIREWORKS_SIZE = 30;
Firework fireworks[] = new Firework[FIREWORKS_SIZE];
PVector gravity = new PVector(0,0.2);
void setup(){
  size(600,600);
  background(0, 25);
  for(int i = 0; i < FIREWORKS_SIZE; i++){
    fireworks[i] = new Firework( (int)random(5,595),600);
  }
  
}
void draw(){
  background(0, 25);
  for(int i = 0; i < fireworks.length; i++){
    fireworks[i].show();
    fireworks[i].update();
  }
  makeFirework();
}


void makeFirework(){
  for(int i = 0; i < fireworks.length; i++){
    if(fireworks[i].repeat()){
      fireworks[i] = new Firework( (int)random(20,580),600);
    }
  }
}
