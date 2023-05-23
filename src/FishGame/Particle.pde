//Brianna Norton w/ help of kalis
class Particle {
  int x, y, diam, speed;
  PImage particle;
  Particle () {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(5, 15));
    speed = int(random(2, 5));
    particle = loadImage ("bubble.png");
  }

  void display() {
    imageMode(CENTER);
    particle.resize(diam, diam);
    image(particle, x, y);
  }

  void move() {
    if (x<0) {
      x = width;
    } else {
      x -= speed;
    }
  }

  boolean reachedSide() {
    return true;
  }
}
