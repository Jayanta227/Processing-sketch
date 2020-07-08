//determining value of pi using collision

float SIDE_B = 60.0;
float SIDE_S = 30.0;
double M_RATIO = 10000000000.0;
box boxB;
box boxS;
int count = 0;
int timestep = 10000;
void setup(){
  size(800,400);
  frameRate(40);
  rectMode(CENTER);
  boxB = new box(SIDE_B, M_RATIO, -2.0);
  boxS = new box(SIDE_S, 1.0, 0.0);
  boxB.posx = 400.0;
  boxS.posx = 320.0;

}
void draw(){
  background(60);
  for(int i = 0; i<timestep; i++){
  //implement the collision
  if (/*(boxS.vel<=0 && boxB.vel<=0) && */(boxS.posx + SIDE_S/2 >= boxB.posx - SIDE_B/2)){
    double u1 = boxS.vel;
    double u2 = boxB.vel;
    double r = M_RATIO;
    //println("collision");
    boxB.vel = (2*u1+u2*(r-1))/(r+1);
    boxS.vel = (2*r*u2-u1*(r-1))/(r+1);
    count++;
    }

    else if ((boxS.posx - SIDE_S/2)<=0.0){
    boxS.vel *= (-1);
    count++;
    }
    boxB.posx += boxB.vel/(float)timestep;
    boxS.posx += boxS.vel/(float)timestep;
  }
  //boxB.posx += boxB.vel*frameRate;
  //boxS.posx += boxS.vel*frameRate;
  boxB.show(boxB.posx);
  boxS.show(boxS.posx);
  println(count);



}

class box{
  double edge, mass, vel, posx, posy;
  box(double edge, double mass, double vel){
    this.edge = edge;
    this.vel = vel;
    this.mass = mass;
  }
  void show(double posx){
    this.posx = posx;
    square((float)this.posx, (float)(height-this.edge/2), (float)this.edge);
  }
}
