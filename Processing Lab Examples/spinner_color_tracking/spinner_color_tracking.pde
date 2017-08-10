import processing.video.*;

// Variable for capture device
Capture video;

// A variable for the color we are searching for.
color trackColor;

PShape spinner;
int framesEllapsed = 0;
//boolean pickColor = true; //for color picking routine

void setup(){
  size(320, 240, P3D);
  //fullScreen(P3D, 2); //sets up a 500 x 500 screen with the 3d renderer
  video = new Capture(this, width, height);
  video.start();
  // Start off tracking for red
  trackColor = color(255, 0, 0);
  spinner = loadShape("spinner.obj");
}

void captureEvent(Capture video) {
  // Read image from the camera
  video.read();
}

void draw(){
  video.loadPixels();
  image(video, 0, 0);
  
    // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1, g1, b1, r2, g2, b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
        closestX = x;
        closestY = y;
      }
    }
  }
  //end color tracking
  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 50) { 
   //background(0); //blacks out background every frame
  lights(); //sets up default lights
  float invertedX = map(closestX, 0, width, width, 0);
  translate(invertedX, closestY, 0); //moves the origin so the shape isn't offscreen
  float spin = framesEllapsed * 10;
  float rx = map(closestY, 0, height, -PI, PI); //maps mouse locations to numbers between -pi and pi
  float ry = map(spin, 0, width, -PI, PI);
  
  rotateX(rx); //rotates x axis using mouse 
  rotateY(ry); //rotates y axis using mouse
  fill(244, 66, 226, 50);
  noStroke();
  rect(0,0, width, height);
  spinner.setFill(color(random(255)));
  //box(60, 80, 60); //draws a float
  shape(spinner, 0, 0);
  }  
  framesEllapsed ++;
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}