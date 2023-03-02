class Fish {
  int x, y, w, health;
  PImage fish;

  //constructor

  Fish() {
    x = 0;
    y = 0;
    w = 90;
    health = 1;
    fish = loadImage("fish.png");
  }

  void display() {
    fish.resize(90, 90);
    imageMode(CENTER);
    image(fish, x, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
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
