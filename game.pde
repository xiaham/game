ArrayList<PVector> walls = new ArrayList<PVector>();
ArrayList<PVector> apples =  new ArrayList<PVector>();

int tileSize = 20;
int cs = 400/tileSize;
PVector pos;

void setup(){
  size (400,400);
  ellipseMode(CORNER);
  for (int i = 0; i < cs*cs/4; i++) {
    walls.add(new PVector(int(random(cs)),int(random(cs))));
  }
  for (int i = 0; i < cs*cs/10;) {
    PVector apple = new PVector(int(random(cs)),int(random(cs)));
    if(!walls.contains(apple)){
      apples.add(apple);
      i++;
    }
  }
  pos = new PVector(0,0);
}

void draw(){
  background(255);
  for (int i = 0; i < cs; i++) {
    line (i*tileSize, 0, i*tileSize, height);
  }
  for (int i = 0; i < cs; i++) {
    line (0, i*tileSize, width, i*tileSize);
  }
  for(int i = 0; i < walls.size(); i++) {
    fill(100);
    rect(walls.get(i).x*tileSize,walls.get(i).y*tileSize, tileSize,tileSize);
  }
  
  for(int i = 0; i < apples.size(); i++) {
    fill(255,0,0);
    ellipse(apples.get(i).x*tileSize,apples.get(i).y*tileSize, tileSize,tileSize);
  }

  fill(0,200,0);
  rect(tileSize*pos.x,tileSize*pos.y,tileSize,tileSize);
  
}

void keyPressed(){
  PVector nextPos = pos.copy();
  if (key == CODED) {
    if (keyCode == UP) {
        nextPos.y = nextPos.y - 1;
    } else if (keyCode == DOWN) {
        nextPos.y = nextPos.y + 1;
    } else if (keyCode == LEFT) {
        nextPos.x = nextPos.x - 1;
    } else if (keyCode == RIGHT) {
        nextPos.x = nextPos.x + 1;
    }
  } 
  boolean notWall = !walls.contains(nextPos);
  boolean inBounds = true;
  if (nextPos.x < 0 || nextPos.x > cs - 1 || nextPos.y < 0 || nextPos.y > cs - 1){
    inBounds = false;
  }
  if (notWall && inBounds){
    pos = nextPos;
  }
}