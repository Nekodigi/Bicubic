float red = 15;//reduce pixels for test
float res = 3;//multi resolution by bicubic
float[] xnew;
float[] ynew;
color[][] colnew;
PImage img;
BicubicImage bicubic;

public void setup(){
  size(2000, 1000);
  img = loadImage("FevCat.png");
  noSmooth();
  img.resize(int(img.width/red), int(img.height/red));//reduce pixels for test
  xnew = linspace(0, img.width, int(img.width*res));
  ynew = linspace(0, img.height, int(img.height*res));
  colnew = new color[xnew.length][ynew.length];
  
  bicubic = new BicubicImage(img);
  colnew = bicubic.solveColor(xnew, ynew);
}

public void draw() {
  image(img, 0, 0, width/2, height);
  noStroke();
  for (int i = 0; i < xnew.length; i++) {
    for (int j = 0; j < ynew.length; j++) {
      fill(colnew[i][j]);//                                                                  +1 for hide position gap(not because of bicubic) 
      rect(width/2+map(xnew[i], 0, img.width, 0, width/2), map(ynew[j], 0, img.height, 0, height), red/res+1, red/res+1);
    }
  }
}
