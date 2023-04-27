//Brianna Norton w/ some help of Kalyis, Prieston, 
//int rand = int(random(2));
//    if (rand == 0) {
//      rock = loadImage(".png");
//    } else if (rand == 1) {
//      rock = loadImage(".png");
//    } else if (rand == 2) {
//    }
//  }
//running (timer how long they live) high score they lived for stays
//

Fish bob;
//Button[] numButtons = new Button[2];
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
Timer enemyTimer, puTimer;
int x, y;
boolean play;
Particle[] particles = new Particle[20];
PImage sea;


void setup() {
  frameRate(30);
  size(1000, 300);
  background(255);
  sea = loadImage("sea9.png");
  x = width/2;
  y = height/2;
  bob = new Fish();
  enemyTimer = new Timer(2000);
  enemyTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  line(0, 0, width, height);
  println(frameCount);
  stroke(0);
  strokeWeight(3);
  if (!play) {
    startScreen();
  } else {
    background(255);

    //particles
    for (int i=0; i<particles.length; i++) {
      particles[i].display();
      particles[i].move();
    }
  }
  //enemy timer
  if (enemyTimer.isFinished()) {
    enemys.add(new Enemy());
    enemyTimer.start();
  } //enemy
  for (int i = 0; i < enemys.size(); i++) {
    Enemy e = enemys.get(i);
    //  if(frameCount>1000){
    //    e.speed += 1;
    //} else {

    //}
  }
  for (int i = 0; i < enemys.size(); i++) {
    Enemy e = enemys.get(i);
    if (bob.intersect(e)) {
      bob.health-=e.diam;
    }
    if (e.reachedSide()) {
      enemys.remove(e);
    } else {
      e.display();
      e.move();
      println(enemys.size());
    }
  } //display
  bob.display();
  infoPanel();

  if (bob.health<1) {
    gameOver();
  }
}



void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      bob.moveUp();
    } else if (keyCode == DOWN) {
      bob.moveDown();
    }
  }
}


void infoPanel() {
  fill(132);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(0);
  textSize(23);
  text("Score: " + frameCount, width/2, 40);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text(" Welcome to fish game! \n Press any key to begin..",
    width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Game Over! \n try again next time. Score: ",
    width/2, height/2);
  if (keyPressed) {
    //play = false;
    noLoop();
  }
}
