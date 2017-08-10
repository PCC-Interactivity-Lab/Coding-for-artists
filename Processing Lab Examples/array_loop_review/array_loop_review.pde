int[] myArray = {5, 46, 63, 25, 6, 7, 9, 105 };
color[] colorArray = new color[9];

void setup(){
  size(500, 500);
  frameRate(300);
  makeColors();
  
}

void draw(){
  background(0);
  for (int i = 0; i < myArray.length; i++){
    fill(colorArray[i]);
    rect(mouseX+i*5, mouseY+i*5, myArray[i], myArray[i]);
  }
 
}

void makeColors(){
    for (int i = 0; i < colorArray.length; i++){
    float r = random(255);
    float g = random(255);
    float b = random(255);
    colorArray[i] = color(r,g,b);
  }
}

void mouseClicked(){
  makeColors();
}