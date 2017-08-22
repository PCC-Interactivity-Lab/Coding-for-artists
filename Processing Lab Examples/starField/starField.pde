Star[] galaxy = new Star[8000]; //define an array to later fill with instances of the Star class

void setup(){
  fullScreen(1);
  for (int i = 0; i < galaxy.length; i++){ //setup a loop to initialize the array
    galaxy[i] = new Star(); //calls the Star() constructor for each element of the array
  }
}

void draw(){
 background(0);
  for (int i = 0; i < galaxy.length; i++){ //loops through the array
    galaxy[i].move(); //move each star
    galaxy[i].display(); //then draw each star
  }
}
  
//definition for our Star class
class Star{
  float x; //first we setup instance variables for each property
  float y;
  float xspeed;
  float yspeed;
  float starSize;
  float brightness;
  
  //constructor for Star class - this runs when the 'new' keyword is used
  Star(){
    xspeed = random(-100, 100)/100; //generates a random float between -1 and 1
    yspeed = random(-100, 100)/100;
    x = width/2 + xspeed; //start each start at the center - but with a slight offset
    y = height/2 + yspeed; //these slight offsets give each star a different direction and speed
    brightness = random(255);
    starSize = 1;
  }
  
  //here we define a move() function inside our Star class
  void move(){
    //reset if any of the four conditions below are met (which would indicate that the star is offscreen)
    if ((y > height) || (y < 0) || (x > width) || (x < 0)){
          //lines below are copy/pasted from our constructor above
          xspeed = random(-100, 100)/100;
          yspeed = random(-100, 100)/100;
          x = width/2 + xspeed;
          y = height/2 + yspeed;
          brightness = random(255);
          starSize = 1;
    }
    
    x = x + xspeed; //move each star according to it's stored offsets
    y = y + yspeed;
    
    starSize = starSize+starSize/30; //grow the star by 1/30th of its size each frame
    xspeed = xspeed*1.1; //speed up the stars a little bit each frame
    yspeed = yspeed*1.1;
  }
  
  //the function that actually draws our star
  void display(){
    noStroke();
    fill(255, brightness);
    //rect has better performance than ellipse
    rect(x, y, starSize, starSize);
  }
  
  
}