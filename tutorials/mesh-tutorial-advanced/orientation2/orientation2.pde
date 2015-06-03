PShape shape;
int N = 100;
PVector[][] positions;
float[][] phases;
float[][] speeds;

void setup() {
  size(800,600,P3D);

  positions = new PVector[N][N];
  phases = new float[N][N];
  speeds = new float[N][N];
  
  
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      positions[i][j] = new PVector(i*width/N, j*height/N);
      phases[i][j] = i*j*0.1;
      speeds[i][j] = 0.1; //+j*0.04f; 
    }
  }
  
  shape = createShape();
  shape.beginShape(LINES);
  shape.stroke(255);
  
  int R = 10;
  float phi = 0.1f;
  
    for (int i=0; i<N; i++) {
      for (int j=0; j<N; j++) {
        shape.vertex (0,0);
        shape.vertex (0,0);
      }
    }
  shape.endShape();
}

void update() {
  
  int R = 10;
  
  for (int i=0; i<N; i++) {
    for (int j=0; j<N; j++) {
      
      float phi = frameCount*speeds[i][j];
      PVector v = shape.getVertex (2*(i*N+j));
      v.x = positions[i][j].x + R*sin(phi + phases[i][j]);
      v.y = positions[i][j].y + R*cos(phi + phases[i][j]);
      shape.setVertex (2*(i*N+j), v);
      
      v = shape.getVertex (2*(i*N+j)+1);
      v.x = positions[i][j].x + R*sin(phi + PI + phases[i][j]);
      v.y = positions[i][j].y + R*cos(phi + PI + phases[i][j]);
      shape.setVertex (2*(i*N+j)+1, v);
    }
  }
}

void draw() {
  background(0);
  update();
  shape(shape);
}
