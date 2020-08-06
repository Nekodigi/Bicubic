float scale = 1000;
int sampling = 100;
float mult = 5;
float[] x = linspace(0, 1-EPSILON, sampling);
float[] y = linspace(0, 1-EPSILON, sampling);
float[] xnew = linspace(0, 1-EPSILON, PApplet.parseInt(sampling*mult));
float[] ynew = linspace(0, 1-EPSILON, PApplet.parseInt(sampling*mult));
float[][] r = new float[x.length][y.length];
float[][] g = new float[x.length][y.length];
float[][] b = new float[x.length][y.length];
float[][] rnew = new float[xnew.length][ynew.length];
float[][] gnew = new float[xnew.length][ynew.length];
float[][] bnew = new float[xnew.length][ynew.length];
PImage img;

public void setup(){
  size(3000, 1000);
  img = loadImage("FevCat.png");
  image(img, scale*2, 0, scale, scale);
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < y.length; j++) {
      r[i][j] = red(img.get(PApplet.parseInt(x[i]*img.width), PApplet.parseInt(y[j]*img.height)));
      g[i][j] = green(img.get(PApplet.parseInt(x[i]*img.width), PApplet.parseInt(y[j]*img.height)));
      b[i][j] = blue(img.get(PApplet.parseInt(x[i]*img.width), PApplet.parseInt(y[j]*img.height)));
    }
  }
  rnew = bicubic(x, y, r, xnew, ynew);
  gnew = bicubic(x, y, g, xnew, ynew);
  bnew = bicubic(x, y, b, xnew, ynew);
}

public void draw() {
  noStroke();
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < y.length; j++) {
      fill(r[i][j], g[i][j], b[i][j]);
      rect(xnew[i]*scale*mult, ynew[j]*scale*mult, img.width/sampling, img.height/sampling);
    }
  }
  for (int i = 0; i < xnew.length; i++) {
    for (int j = 0; j < ynew.length; j++) {
      fill(rnew[i][j], gnew[i][j], bnew[i][j]);
      rect(scale+xnew[i]*scale, ynew[j]*scale, img.width/sampling/mult, img.height/sampling/mult);
    }
  }
  stroke(0);
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < y.length; j++) {
      fill(r[i][j], g[i][j], b[i][j]);
      //ellipse(scale+x[i]*scale, y[j]*scale, 2, 2);
    }
  }
}