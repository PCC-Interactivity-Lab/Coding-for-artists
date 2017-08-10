PShape spinner;
int framesEllapsed = 0;

void setup(){
  fullScreen(P3D, 2); //sets up a 500 x 500 screen with the 3d renderer
  spinner = loadShape("spinner.obj");
}

void draw(){
  //background(0); //blacks out background every frame
  lights(); //sets up default lights
  translate(width/4, height/2, 0); //moves the origin so the shape isn't offscreen
  float spin = framesEllapsed * 10;
  float rx = map(mouseY, 0, height, -PI, PI); //maps mouse locations to numbers between -pi and pi
  float ry = map(spin, 0, width, -PI, PI);
  
  rotateX(rx); //rotates x axis using mouse 
  rotateY(ry); //rotates y axis using mouse
  fill(244, 66, 226, 50);
  noStroke();
  rect(0,0, width, height);
  spinner.setFill(color(random(255)));
  //box(60, 80, 60); //draws a float
  shape(spinner, 0, 0);
  
  framesEllapsed ++;
}