//float vertices[][] = {{0, 0, 0, },                //vertices of a cube in 3d
//  {0, 0, 50}, {0, 50, 0}, {0, 0, 50}, 
//  {0, 50, 50}, {50, 0, 50}, {50, 50, 0}, 
//  {50, 50, 50}};

float vertices[][] = {{50, 50, 50}, {-50, 50, 50}, {50, -50, 50}, {-50, -50, 50}, 
  {50, 50, -50}, {-50, 50, -50}, {50, -50, -50}, {-50, -50, -50}}; 


float mat_pro[][] = {{1, 0, 0}, {0, 1, 0}};            //projection matrix for 3d to 2d
float ang = 0.05f;



void setup() {
  size(500, 400);
  strokeWeight(5);
  stroke(255);
  
}

void draw() {
  background(0);
  translate(width/2, + height/2);
  float [][]transformed_pt= new float[8][2];
  ang += .01f;
  float rotZ[][] = {{cos(ang), -sin(ang), 0}, {sin(ang), cos(ang), 0}, {0, 0, 1}};
  float rotX[][] = {{1, 0, 0}, {0, cos(ang), -sin(ang)}, {0, sin(ang), cos(ang)}};
  float rotY[][] = {{cos(ang), 0, -sin(ang)}, {0, 1, 0}, {sin(ang), 0, cos(ang)}};
  int i=0;
  float zoom  = 500; //it is just a camera parameter
  float distance = 100;//distance of object from camera
  for (float []ver : vertices) {

    float [][]rotated = mat_mul.mult(rotX, ver);
    rotated = mat_mul.mult(rotZ, rotated);
    rotated = mat_mul.mult(rotY, rotated);



    mat_pro[0][0] = zoom/(distance - rotated[2][0]);      //to give perspective
    mat_pro[1][1] = zoom/(distance - rotated[2][0]);      //to give perspective

    float[][] temp_point = mat_mul.mult(mat_pro, rotated);
    point(temp_point[0][0], temp_point[1][0]);
    transformed_pt[i][0] = temp_point[0][0];
    transformed_pt[i][1] = temp_point[1][0];
    i++;
  }
  connect(transformed_pt[0], transformed_pt[1]);
  connect(transformed_pt[0], transformed_pt[2]);
  connect(transformed_pt[0], transformed_pt[4]);


  connect(transformed_pt[1], transformed_pt[3]);
  connect(transformed_pt[1], transformed_pt[5]);

  connect(transformed_pt[2], transformed_pt[3]);
  connect(transformed_pt[2], transformed_pt[6]);

  connect(transformed_pt[3], transformed_pt[7]);
  connect(transformed_pt[4], transformed_pt[5]);
  connect(transformed_pt[4], transformed_pt[6]);
  connect(transformed_pt[5], transformed_pt[7]);
  connect(transformed_pt[6], transformed_pt[7]);
}
void connect(float [] pt1, float [] pt2) {
  line(pt1[0], pt1[1], pt2[0], pt2[1]);
}
