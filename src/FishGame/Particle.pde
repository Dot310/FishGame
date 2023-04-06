//Brianna Norton
class Particle {
  int x, y, diam, speed;
  Particle () {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1,5));
    speed = int(random(2,5));
  }
  
  void display() {
    fill(0);
    circle(x,y,diam);
  }
  
  void move() {
    if (y>height+5) {
      y = -10;
    } else {
      x -= speed;
    }
  }
  
  boolean reachedSide() {
    return true;
  }
}
