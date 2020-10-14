ArrayList<Ball> balls;
color bgcolor;
color [] myColors = {color(0), color(255), color(0, 0, 222)};
int newDiam = 0;

void setup(){
  size(800, 600);
  balls = new ArrayList<Ball>();
  noStroke();
  bgcolor = myColors[(int)random(myColors.length)];
}

void mousePressed(){
  Ball b = new Ball(mouseX, mouseY, random(5, 20));
  balls.add(b);
}

void draw(){
  if(mousePressed){
    newDiam++;
  }
  background(bgcolor);
  for(Ball b : balls){
    fill(b.fillColor);
    ellipse(b.x, b.y, b.diameter, b.diameter);
    b.scoot();
  }

}


class Ball{
  float x, y, dx, dy, diameter;
  color fillColor;
 
  public Ball(float newx, float newy, float d){
    x = newx;
    y = newy;
    fillColor = color(random(255), random(255), random(255));
    dx = random(-3, 3);
    dy = random(-3, 3);
    diameter = d;
  }
 
  public void scoot(){
    x += dx;
    y += dy;
   
    if(x > width - diameter/2 || x < diameter/2)
      dx *= -1;
     
    if(y > height - diameter/2 || y < diameter/2)
      dy *= -1;
  }
}
