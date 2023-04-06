//Brianna Norton
class Enemy {
  int x, y, diam, speed;
  PImage enemy;

  //constuctor

  Enemy() {
    x = width+50;
    y = int(random(height));
    diam = int(random(100, 150));
    speed = int(random(3, 5));
    enemy = loadImage("enemy2.png");
  //  int rand = int(random(2));
  //  if (rand == 0) {
  //    enemy = loadImage("enemy2.png");
  //  } else if (rand == 1) {
  //    enemy = loadImage("enemy3.png");
  //  } else if (rand == 2) {
  //  }
  //}
}

void display() {
  imageMode(CENTER);
  enemy.resize(diam, diam);
  image(enemy, x, y);
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
