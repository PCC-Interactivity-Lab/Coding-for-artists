import processing.video.*;

Capture video;

void setup() {
  fullScreen();
  video = new Capture(this, 640, 480);
  
  video.start();
}

void draw() {
  background(0);
  tint(mouseX, mouseY, mouseX);
  image(video,0,0, 1280, 860);
  float v = map(mouseX, 0, width, 2, 10);
  filter(POSTERIZE, v); //experiment with different filters!
}

void captureEvent(Capture c) {
  c.read();
}