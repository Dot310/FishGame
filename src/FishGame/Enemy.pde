//Brianna Norton image by cora
class Enemy {
  int x, y, diam, speed;
  PImage enemy, skeletonoct;

  //constuctor

  Enemy(int y) {
    x = width+50;
    this.y =y;
    diam = int(random(120, 150));
    speed = 8;
    //this.speed=speed;
    enemy = loadImage("enemy2.png");
    //skeletonoct = loadImage("skeletonoct.png");
    //int rand = int(random(2));
    //if (rand == 0) {
    // enemy = loadImage("enemy2.png");
    //} else if (rand == 1) {
    // enemy = loadImage("skeletonoct.png");
    //} else if (rand == 2) {
    //}
  }

  void display() {
    imageMode(CENTER);
    enemy.resize(diam, diam);
    image(enemy, x, y);
    //skeletonoct.resize(diam, diam);
    //image(skeletonoct, x, y);
  }

  void move() {
    x -= speed;
  }

  boolean reachedSide() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect (Fish fish) {
    float d = dist(x, y, fish.x, fish.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
