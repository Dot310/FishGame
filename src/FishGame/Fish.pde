//Brianna Norton
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
    fish.resize(190, 190);
    imageMode(CENTER);
    image(fish, x, y);
  }

  void moveUp() {
    y -=5;
  }

  void moveDown() {
    y +=5;
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