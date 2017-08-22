/**
  * This sketch demonstrates how to monitor the currently active audio input 
  * of the computer using an AudioInput. What you will actually 
  * be monitoring depends on the current settings of the machine the sketch is running on. 
  * Typically, you will be monitoring the built-in microphone, but if running on a desktop
  * it's feasible that the user may have the actual audio output of the computer 
  * as the active audio input, or something else entirely.
  * <p>
  * Press 'm' to toggle monitoring on and off.
  * <p>
  * When you run your sketch as an applet you will need to sign it in order to get an input.
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/ 
  */

import ddf.minim.*;

Minim minim;
AudioInput in;

color bgColor;
void setup()
{
  //size(512, 200, P3D);
  fullScreen(P3D, 2);
  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
}

void draw()
{
  background(bgColor);
  stroke(255);
  if (in.left.get(0) > 0.1){
    float r = random(255);
    float g = random(255);
    float b = random(255);
    bgColor = color(r, g, b);
  }
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i*2, height/3 + in.left.get(i)*(height/3), i*2+1, height/3 + in.left.get(i+1)*50 );
    line( i*2, height/2 + in.right.get(i)*(height/3), i*2+1, height/2 + in.right.get(i+1)*50 );
  }
  
  String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
  text( "audio level is " + in.left.get(0), 100, 15 );
}

void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    }
    else
    {
      in.enableMonitoring();
    }
  }
}