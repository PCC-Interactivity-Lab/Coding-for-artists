import gab.opencv.*;
import processing.video.*;
import java.awt.*;

PImage afx;
Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  afx = loadImage("afx.png");

  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    //rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    //below looks confusing b/c I'm subtracting/offsetting amounts to line them up after making them bigger
    image(afx, faces[i].x-(faces[i].width*0.15), faces[i].y-(faces[i].width*0.15), faces[i].width*1.3, faces[i].height*1.3);
  }
}

void captureEvent(Capture c) {
  c.read();
}