class Particle {
  float x, y, speedX, speedY;
  color col;

  Particle() {
    x = random(width);
    y = random(height);
    speedX = random(-0.5, 0.5);
    speedY = random(-0.5, 0.5);
    col = color(230, 200, 130);
  }

  void move() {
    x += speedX;
    y += speedY;
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;
  }

  void show() {
    fill(col);
    ellipse(x, y, 15, 15);
    fill(255);
    ellipse(x, y, 8, 8);
  }
}

class OddballParticle extends Particle {
  OddballParticle() {
    super();
    col = color(255, 204, 204);
    speedX = random(-0.3, 0.3);
    speedY = random(-0.3, 0.3);
  }

  void show() {
    fill(col);
    rectMode(CENTER);
    rect(x, y, 30, 30, 8);
  }
}

Particle[] particles = new Particle[100];

void setup() {
  size(800, 600);
  noStroke();
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  particles[0] = new OddballParticle();
}

void draw() {
  background(255);
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}
