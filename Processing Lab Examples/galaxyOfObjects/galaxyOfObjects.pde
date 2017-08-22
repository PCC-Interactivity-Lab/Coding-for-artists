Star[] galaxy;
int galaxySize = 100;
galaxy = new Star[100];

void setup(){
  size(500, 500);
  for (int i = 0; i < galaxySize; i++){
    galaxy[i].x = 10;
    galaxy[i].y = 10;
    galaxy[i].starSize = 10;
  }
}

void draw(){
  background(0);
  for (int i = 0; i < 10; i++){
    galaxy[i].display();
  }
}

class Star {
  float x;
  float y;
  float starSize;
  color c;
  float transp;
  
  void display() {
    ellipse(x, y, starSize, starSize);
  }
}