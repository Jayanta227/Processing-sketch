//create a visualisation for 1 dimension noise

float NOISE_PARAM = 100; //This specifies how close two points are consider for noise function input
float i = 1/100.0;
float step;
void setup(){
  size(800,400);
  strokeWeight(10);
  
}
void draw(){
  background(255);
  //stroke(random(250), random(250), random(250));
  for(int j=0;j<800;j++){
  
    point(0+j, 300*noise(100+i+j/NOISE_PARAM));
  }
  i += 1/100.0;
  println(frameRate);
}
