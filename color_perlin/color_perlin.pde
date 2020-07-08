//colorful perlin noise

void setup() {
  size(600, 600);
  strokeWeight(1);
  frameRate(5);
}

void draw() {
  for (int i=0; i<=600; i+=1) {
    for (int j=0; j<=600; j+=1) {

      float x = map(i, 0, 600, 0, 5);
      float y = map(j, 0, 600, 0, 5);
      float angle = noise(x, y);
      
      float x1 = map(i, 0, 600, 100, 105);
      float y1 = map(j, 0, 600, 100, 105);
      float angle1 = noise(x1, y1);
      
      float x2 = map(i, 0, 600, 200, 205);
      float y2 = map(j, 0, 600, 200, 205);
      float angle2 = noise(x2, y2);

      stroke(map(angle, 0, 1, 30, 200), map(angle1, 0, 1, 30, 200), map(angle2, 0, 1, 30, 200));
      point(i, j);

      //line(i,j,i+20*cos(angle),j+20*sin(angle));
    }
  }
}
