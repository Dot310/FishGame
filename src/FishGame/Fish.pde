//Brianna Norton w/ help of Jules + image by cora
class Fish {
  int x, y, w, health;
  PImage fish;

  //constructor

  Fish() {
    x = 150;
    y = 500;
    w = 91;
    health = 1;
    fish = loadImage("fish.png");
  }

  void display() {
    fish.resize(120, 120);
    imageMode(CENTER);
    image(fish, x, y);
  }

  void moveUp() {
    y -=20;


    if (y <= 0)
      y = 0;
    if (y <= 100)
      y = 100;
  }

  void moveDown() {
    y +=20;

    if (y >= height) {
      y = 563;
    }
  }

  boolean intersect (Enemy enemy) {
    float d = dist(x, y, enemy.x, enemy.y);
    if (d<40) { //refine the collision detection
      return true;
    } else {
      return false;
    }
  }
}
