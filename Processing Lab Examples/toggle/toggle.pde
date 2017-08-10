boolean toggle = false;

void setup(){
  size(500,500);
}

void draw(){
  background(0);
  if (toggle){
    ellipse(mouseX,mouseY, 200, 200);
  }
}
  
void mousePressed(){
  if (toggle){
    toggle = false;
  }else{
    toggle = true;
  }
}