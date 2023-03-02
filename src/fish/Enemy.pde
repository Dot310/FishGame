class Enemy {
  int x, y, diam, speed;
  PImage enemy;

  //constuctor

  Enemy() {
    x = int(random(width));
    y = -100;
    diam = int(random(50, 100));
    speed = int(random(3, 10));
    enemy = loadImage("enemy2.png");
//    int rand = int(random(2));
//    if (rand == 0) {
//      enemy = loadImage(".png");
//    } else if (rand == 1) {
//      e = loadImage(".png");
//    }else if (rand == 2) {
//    }
////  }
  }


  void display() {
    imageMode(CENTER);
    enemy.resize(diam, diam);
    image(enemy, x, y);
  }

  void move() {
    y += speed;
  }
  
  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect (Fish fish) {
    float d = dist(x, y, fish.x,fish.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
