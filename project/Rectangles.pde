class Rectangles {
  float x;//x value
  float y;// y value
  float w;// width
  float h;// height
  color c;// color

  Rectangles( float ex, float why, float with, float hight, color culur) {//constructor
    x = ex;
    y = why;
    w = with;
    h = hight;
    c = culur;
  }

  void drawRB(int ex, int with, boolean chosen) { // draws the rectangle using dimensions given
    if (chosen) {
      fill(138, 225, 0);
    } else {
      fill(171, 139, 252);
    }
    strokeWeight(1);
    stroke(c);
    rect(ex, y, with, h);
    noStroke();
  }

  void drawRS(int ex, int with, boolean chosen) { // draws the rectangle using dimensions given
    if (chosen) {
      fill(138, 225, 0);
    } else {
      fill(127, 255, 212);
    }
    strokeWeight(1);
    stroke(c);
    rect(ex, y, with, h);
    noStroke();
  }

  void drawRI(int ex, int with, boolean chosen) { // draws the rectangle using dimensions given
    if (chosen) {
      fill(171, 139, 252);
    } else {
      fill(225, 139, 225);
    }
    strokeWeight(1);
    stroke(c);
    rect(ex, y, with, h);
    noStroke();
  }

  void drawR() {
    fill(171, 139, 252);
    strokeWeight(1);
    stroke(c);
    rect(x, y, w, h);
    noStroke();
  }

  float getHeight() {//accessor
    return h;
  }

  void setHeight(float high) {//mutator
    h = high;
  }

  Rectangles dupe() {// duplicates the rectangle
    return new Rectangles(x, y, w, h, c);
  }
}