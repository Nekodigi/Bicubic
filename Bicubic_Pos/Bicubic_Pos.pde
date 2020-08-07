int lpp = 100;//mesh line per pixel
int rlpp = 10;//multi resolution by bicubic line per pixel
float[] xnew;
float[] ynew;
PVector[][] ctrPoss;//control points
PVector[][] biPoss;//bicubic interpolated pos 
BicubicPos bicubic;

public void setup(){
  size(1000, 1000);
  ctrPoss = new PVector[width/lpp+1][height/lpp+1];
  
  xnew = linspace(0, ctrPoss[0].length, int(width/rlpp));
  ynew = linspace(0, ctrPoss.length, int(height/rlpp));
  biPoss = new PVector[width/rlpp][width/rlpp];
  
  for (int i = 0; i < width/lpp+1; i++) {
    for (int j = 0; j < height/lpp+1; j++) {
      ctrPoss[i][j] = new PVector(i*lpp, j*lpp);
    }
  }
  
  
}

void draw() {
  background(255);
  noFill();
  ctrPoss[2][2] = new PVector(mouseX, mouseY);
  bicubic = new BicubicPos(ctrPoss);
  biPoss = bicubic.solvePos(xnew, ynew);
  //show control mesh
  //stroke(255, 0, 0, 100);
  //for (int i = 0; i < ctrPoss[0].length; i++) {
  //  beginShape();
  //  for (int j = 0; j < ctrPoss.length; j++) {
  //    vertex(ctrPoss[i][j].x, ctrPoss[i][j].y);
  //  }
  //  endShape();
  //}
  //for (int j = 0; j < ctrPoss.length; j++) {
  //  beginShape();
  //  for (int i = 0; i < ctrPoss[0].length; i++) {
  //    vertex(ctrPoss[i][j].x, ctrPoss[i][j].y);
  //  }
  //  endShape();
  //}
  //show bicubic interpolated mesh
  stroke(0);
  for (int i = 0; i < biPoss[0].length; i++) {
    beginShape();
    for (int j = 0; j < biPoss.length; j++) {
      vertex(biPoss[i][j].x, biPoss[i][j].y);
    }
    endShape();
  }
  for (int j = 0; j < biPoss.length; j++) {
    beginShape();
    for (int i = 0; i < biPoss[0].length; i++) {
      vertex(biPoss[i][j].x, biPoss[i][j].y);
    }
    endShape();
  }
}
