//arrow keeys
//int rand = int(random(2));
//    if (rand == 0) {
//      rock = loadImage(".png");
//    } else if (rand == 1) {
//      rock = loadImage(".png");
//    }else if (rand == 2) {
//    }
//  }
Fish bob;
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
Timer enemyTimer, puTimer;
int score;
boolean play;
Particle[] particles = new Particle[32];

void setup() {
  size(850, 500);
  bob = new Fish();
  enemyTimer = new Timer(1000);
  enemyTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
  score = 0;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);

    //particles
    for (int i=0; i<particles.length; i++) {
      particles[i].display();
      particles[i].move();
    }
    noCursor();
  }
  if (enemyTimer.isFinished()) {
    enemys.add(new Enemy());
    enemyTimer.start();
  }
  for (int i = 0; i < enemys.size(); i++) {
    Enemy e = enemys.get(i);
    if (bob.intersect(e)) {
      bob.health-=e.diam;
    }
    if (e.reachedBottom()) {
      enemys.remove(e);
    } else {
      e.display();
      e.move();
      println(enemys.size());
    }
  }
  bob.display();
  bob.move(mouseX, mouseY);
  infoPanel();

  if (bob.health<1) {
    gameOver();
  }
}

void keyPressed() {
}

void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(23);
  text("Score: " + score, width, 40);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text(" Space Game \n Press any key to begin..",
    width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over! \n try again next time",
    width/2, height/2);
  if (keyPressed) {
    //play = false;
    noLoop();
  }
}
