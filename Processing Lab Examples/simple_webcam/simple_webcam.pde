import processing.video.*;

Capture video;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  
  video.start();
}

void draw() {
  image(video,0,0);
}

void captureEvent(Capture c) {
  c.read();
}