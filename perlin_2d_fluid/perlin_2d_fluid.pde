//perlin vector field with fluid like simulations

float temp_coorx[] = new float[1000];
float temp_coory[] = new float[1000];
float randomness=3.0;
float step=20;
int count = 0;

void setup() {
  size(600, 600);
  strokeWeight(3);
  frameRate(5);
  for (int i=0; i<=600; i+=20) {
    for (int j=0; j<=600; j+=20) {
      temp_coorx[count] = i;
      temp_coory[count] = j;
      count++;
    }
  }


    for (int i=0; i<=600; i+=step) {
    for (int j=0; j<=600; j+=step) {

      float x = map(i, 0, 600, 0, randomness);
      float y = map(j, 0, 600, 0, randomness);
      float angle = map(noise(x, y), 0, 1, -3, 3);

      //stroke(map(angle, 0, 1, 150, 200));
      //point(i, j);

      line(i, j, i+20*cos(angle), j+20*sin(angle));
      //println(angle);
    }
  }
}

void draw() {
  stroke(150,150);
  background(255);
  for (int i=0; i<960; i++) {
    
    flow(i);
  }
}

void flow(int i) {
  float x = map(temp_coorx[i], 0, 600, 0, randomness);
  float y = map(temp_coory[i], 0, 600, 0, randomness);
  float angle = map(noise(x, y), 0, 1, -3, 3);
  float temp_x = temp_coorx[i]+5*cos(angle);
  float temp_y = temp_coory[i]+5*sin(angle);
  line(temp_coorx[i], temp_coory[i], temp_x, temp_y);
  temp_coorx[i] += 5*cos(angle);
  temp_coory[i] += 5*sin(angle);
}
int toggle = 0;
void mouseClicked(){
  if(toggle%2 == 0){noLoop();}
  else{loop();}
  toggle++;
}
