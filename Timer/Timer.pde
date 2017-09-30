int timer;
int left;
int start;
int w;
boolean run;

void setup() {
  size(700, 500);
  timer = left = 300000;  // 90 Minutes
  start = 0;
  w = 450;
  run = false;
}

void draw() {
  background(0);
  
  // Update timer
  if(run) {
   left = timer - (millis() - start);
   if(left <= 0) {
    reset();
   }
  }
  
  // Arc
  float red = 255 - map(left, 0, timer, 0, 255);
  float green = map(left, 0, timer, 0, 255);
  float endPoint = map(left, 0, timer, radians(-90), radians(270));
  
  noFill();
  strokeWeight(10);
  stroke(red, green, 0);
  arc(width/2, height/2, w, w, radians(-90), endPoint);
  
  // Text
  int totalSec = left / 1000;
  int s = totalSec % 60;
  int m = totalSec / 60;
  
  textAlign(CENTER, CENTER);
  textSize(72);
  if(s < 10)
   text(m + ":0" + s, width/2, height/2);
  else
    text(m + ":" + s, width/2, height/2);
  
}

void reset() {
  run = false;
  left = timer;
}

void keyTyped() {
  
  if(key == ' '){
    run = !run; 
    start = millis();
  }
  
  if(run)
    return;
    
  switch(key) {
    case 'q':
      timer += 60000;
      break;
    case 'a':
      if(timer - 60000 >= 0)
        timer -= 60000;
      else
        timer = 1;
      break;
    case 'w':
      timer += 1000;
      break;
    case 's':
      if(timer - 1000 >= 0)
        timer -= 1000;
      else
        timer = 1;
      break;
    case 'r':
      reset();
      break;
  }
  
  left = timer;
  
}