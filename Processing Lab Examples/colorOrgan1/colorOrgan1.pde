import themidibus.*; //Import the library

//qunexus has 25 keys so we'll make arrays of 25 things

boolean[] notes = new boolean[25];
float[] reds = new float[25];
float[] greens = new float[25];
float[] blues = new float[25];
float[] locXs = new float[25];
float[] locYs = new float[25];
float[] sizes = new float[25];

MidiBus myBus; // The MidiBus

void setup() {
  fullScreen(1);
  background(0);
  
  for (int i = 0; i < notes.length; i++){
    reds[i] = random(255);
    greens[i] = random(255);
    blues[i] = random(255);
    locXs[i] = random(width);
    locYs[i] = random(height);
    sizes[i] = random(height);
  }

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
  //                 Parent  In        Out
  //                   |     |          |
  myBus = new MidiBus(this, "QuNexus", "loopMIDI Port"); // Create a new MidiBus with no QuNexus as input device and no output device.
}

void draw() {
    background(255);

    for (int i = 0; i < notes.length; i++){
      if (notes[i]){
        fill(reds[i], greens[i], blues[i]);
        rectMode(CENTER);
        rect(locXs[i], locYs[i], sizes[i], sizes[i]);
      }
    }
  

}

void noteOn(int channel, int pitch, int velocity) {
  // Receive a noteOn
  println();
  println("Note On:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  notes[pitch-60] = true;
  myBus.sendNoteOn(channel, pitch, velocity);
}

void noteOff(int channel, int pitch, int velocity) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+channel);
  println("Pitch:"+pitch);
  println("Velocity:"+velocity);
  notes[pitch-60] = false;
  myBus.sendNoteOn(channel, pitch, velocity);
}

void controllerChange(int channel, int number, int value) {
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+channel);
  println("Number:"+number);
  println("Value:"+value);
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}