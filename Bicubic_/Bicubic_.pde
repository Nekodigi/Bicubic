float scale = 50;
float[] x = linspace(-6, 6, 11);
float[] y = linspace(-6, 6, 11);
float[] xnew = linspace(-6, 6, 100);
float[] ynew = linspace(-6, 6, 100);
float[][] z = new float[x.length][y.length];
float[][] znew = new float[xnew.length][ynew.length];

public void setup() {
  size(600, 600);
  strokeWeight(2);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < y.length; j++) {
      z[i][j] = sin(sqrt(x[i]*x[i]+y[j]*y[j]));
    }
  }
  znew = bicubic(x, y, z, xnew, ynew);
}

public void draw() {
  noStroke();
  translate(width/2, height/2);
  for (int i = 0; i < xnew.length; i++) {
    for (int j = 0; j < ynew.length; j++) {
      fill(znew[i][j]*150+180);
      rect(xnew[i]*scale, ynew[j]*scale, 6, 6);
    }
  }
  stroke(0);
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < y.length; j++) {
      fill(z[i][j]*150+180);
      ellipse(x[i]*scale, y[j]*scale, 10, 10);
    }
  }
}