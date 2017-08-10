import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

float sensorVal = 0;
float scaledSensor = 0;

float r = 100;
float g = 100;
float b = 255;
float opacity = 0;

void setup() {
  fullScreen(1);
  background(0);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  //myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In            Out
  //                   |     |              |
  myBus = new MidiBus(this, "Faderfox DJ3"
, -1); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.
}//Teensy MIDI

void draw() {
  noStroke();
  sensorVal = constrain(sensorVal, 0, 127);
  scaledSensor = map(sensorVal, 0, 127, 0, width);
  
  println("raw "+sensorVal);
  println("cooked "+scaledSensor);
  
  if (sensorVal < 64){
    r = map(scaledSensor, 0, width/2, 100, 0);
    g = map(scaledSensor, 0, width/2, 100, 0);
    b = map(scaledSensor, 0, width/2, 255, 0);
    opacity = map(scaledSensor, 0, width/2, 0, 255);
  }else{
    r = map(scaledSensor, width/2, width, 0, 100);
    g = map(scaledSensor, width/2, width, 0, 100);
    b = map(scaledSensor, width/2, width, 0, 255);
    opacity = map(scaledSensor, width/2, width, 255, 0);
  }
  background(r, g, b);
  for (int i = 0; i < 200; i++){
    float x = random(width);
    float y = random(height);
    float starSize = random(1,width/100);
    fill(255, opacity);
    ellipse(x, y, starSize, starSize);
  }
  fill(204, 102, 0);
  ellipse(width/2, height/2 ,width/2,width/2); //sun
  fill(0);
  ellipse(scaledSensor, height/2, width/2-2, width/2-2); //moon

}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  if (number == 1){
    sensorVal = value;
  }
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}