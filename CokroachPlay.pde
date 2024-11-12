import processing.sound.*;

ArrayList<Cokroach> coks;
PImage img;
SoundFile hitSound;
int lastTime = 0;

void setup() {
  size(800, 800);
  coks = new ArrayList<Cokroach>();
  img = loadImage("kecoa.png");
  hitSound = new SoundFile(this, "hit_sound.mp3"); 
}

void draw() {
  background(255);
  for (Cokroach c : coks) {
    c.live();
  }
  
  if (millis() - lastTime > 5000) {
    coks.add(new Cokroach(img, random(width), random(height)));
    lastTime = millis();
  }
  
  fill(51);
  textSize(16);
  text("nums: " + coks.size(), 50, 750); 
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    for (int i = coks.size() - 1; i >= 0; i--) {
      Cokroach c = coks.get(i);
      if (dist(mouseX, mouseY, c.pos.x, c.pos.y) < 50) {
        hitSound.play();
        coks.remove(i);
      }
    }
  }
}
