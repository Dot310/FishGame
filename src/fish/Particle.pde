class Particle {
  int x, y, diam, speed;
  Particle () {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1,7));
    speed = int(random(2,15));
  }
  
  void display() {
    fill(#D0DCEA);
    circle(x,y,diam);
  }
  
  void move() {
    if (y>height+5) {
      y = -10;
    } else {
      y += speed;
    }
  }
  
  boolean reachedBottom() {
    return true;
  }
}
