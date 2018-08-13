int rect1X, rect1Y;      // Position of square button
int rect2X, rect2Y; 
int rect3X, rect3Y;
int rect4X, rect4Y;
int rect5X, rect5Y;
int rect6X, rect6Y;
int recW = 300;
int recH = 100;
color rectColor, rect2Color, rect3Color;
color fillcolor;
boolean Over1 = false;
boolean Over2 = false;
boolean Over3 = false;
boolean Over4 = false;
boolean Over5 = false;
boolean Over6 = false;
boolean Over7 = false;
boolean Over8 = false;
int state; // determines which sort will be demonstrated
boolean setup;
BubbleSortLarge bubL;
SelectionSortLarge selL;
InsertionSortLarge insL;
InsertionSortSmall insS;
SelectionSortSmall selS;
BubbleSortSmall bubS;
BogoSortLarge bogL;
HeapSortLarge heaL;
HeapSortSmall heaS;
BogoSortSmall bogS;

void setup() {
  frameRate(60);
  background(color(0));
  textSize(20);
  textSize(40);
  fill(225);
  text("Sorta Awesome Visualizer", 47, 80); 
  textSize(32);
  fill(0, 50, 153);
  size(600, 600);
  rectColor =   color(171, 139, 252);
  rect2Color =  color(127, 255, 212);
  rect3Color = color(225, 139, 225);
  fillcolor = color(255);
  setup = true;

  //locates 
  rect1X = (width - recW)/2;
  rect1Y = (height - recH*4 + 20*2) / 2  ;
  rect2X = rect1X;
  rect2Y = rect1Y + recH +  20;
  rect3X = rect2X;
  rect3Y = rect2Y + recH + 20;
  rect4X = (width - recW)/2;
  rect4Y = (height - (2*recH + recH/2))/2;
  rect5X = rect4X;
  rect5Y =  (height - (2*recH + recH/2))/2 + 2*recH/2 + recH/2;
  rect6X = rect5X;
  rect6Y = rect5Y + 160;
  System.out.println(rect1Y);
}


void draw() {

  //
  if (state == 0) {
    update();
    if (Over1) {
      fill(168, 100, 252);
    } else {
      fill(rectColor);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect1X, rect1Y, recW, recH);
    noStroke();
    if (Over2) {
      fill(0, 255, 200);
    } else {
      fill(rect2Color);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect2X, rect2Y, recW, recH);
    noStroke();
    if (Over3) {
      fill(225, 100, 225);
    } else {
      fill(rect3Color);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect3X, rect3Y, recW, recH);
    noStroke();
    if (Over6) {
      fill(0, 200, 204);
    } else {
      fill(128, 200, 200);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect6X, rect6Y, recW, 40);
    noStroke();


    makeText("Bubble Sort", rect1X + recW/4 - 20, rect1Y + recH/2 + 10, 0);
    makeText("Selection Sort", rect2X + recW/4 - 20, rect2Y + recH/2 + 10, 0);
    makeText("Insertion Sort", rect3X + recW/4 - 20, rect3Y + recH/2 + 10, 0);
    makeText("Tired of O(n^2)?", rect6X + recW/4 - 45, rect6Y + 20 + 10, 0);
  }


  if (state == 1 || state == 4 || state == 7 || state == 11 || state == 14) {
    update();
    background(0);

    if (Over4) {
      fill(168, 100, 252);
    } else {

      fill(rectColor);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect4X, rect4Y, recW, recH);
    noStroke();

    if (Over5) {
      fill(0, 255, 200);
    } else {
      fill(rect2Color);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect5X, rect5Y, recW, recH); 
    noStroke();

    makeText("Small Scale", rect4X + recW/4 - 10, rect4Y + recH/2 + 5, 0);
    makeText("Large Scale", rect5X + recW/4 - 10, rect5Y + recH/2 + 5, 0);
  }

  if (state == 2) {
    if (setup) {
      bubS = new BubbleSortSmall();
      setup = false;
    } else {
      bubS.drawBS();
    }
  }

  if (state == 3) {
    if (setup) {
      bubL = new BubbleSortLarge();
      setup = false;
    } else {
      bubL.drawBL();
    }
  }

  if (state==5) {
    if (setup) {
      selS = new SelectionSortSmall();
      setup = false;
    } else {
      selS.drawSS();
    }
  }

  if (state==6) {
    if (setup) {
      selL = new SelectionSortLarge();
      setup = false;
    } else {
      selL.drawSL();
    }
  }

  if (state==8) {
    if (setup) {
      insS = new InsertionSortSmall();
      setup = false;
    } else {
      insS.drawIS();
    }
  }

  if (state==9) {
    if (setup) {
      insL = new InsertionSortLarge();
      setup = false;
    } else {
      insL.drawIL();
    }
  }

  if (state == 10) {
    update();
    background(0);

    if (Over7) {
      fill(168, 100, 252);
    } else {

      fill(rectColor);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect4X, rect4Y, recW, recH);
    noStroke();

    if (Over8) {
      fill(0, 255, 200);
    } else {
      fill(rect2Color);
    }
    strokeWeight(2);
    stroke(255);
    rect(rect5X, rect5Y, recW, recH);
    noStroke();

    makeText("BogoSort", rect4X + recW/4, rect4Y + recH/2, 0);
    makeText("HeapSort", rect5X + recW/4, rect5Y + recH/2, 0);
  }

  if (state == 12) {
    if (setup) {
      bogS = new BogoSortSmall();
      setup = false;
    } else {
      bogS.drawBGS();
    }
  }

  if (state == 13) {
    if (setup) {
      bogL = new BogoSortLarge();
      setup = false;
    } else {
      bogL.drawBGL();
    }
  }

  if (state ==15) {
    if (setup) {
      heaS = new HeapSortSmall();
      setup = false;
    } else {
      heaS.drawHSS();
    }
  }

  if (state == 16) {
    if (setup) {
      heaL = new HeapSortLarge();
      setup = false;
    } else {
      heaL.drawHS();
    }
  }


  //stroke(0);
}

void makeText(String s, int x, int y, int col) {
  fill(color(col));
  text(s, x, y);
}

void update() {
  if (state == 0) {
    if ( OverRect(rect1X, rect1Y) ) {
      Over1 = true;
      Over2 = false;
      Over3 = false;
      Over6 = false;
    } else if ( OverRect(rect2X, rect2Y) ) {
      Over2 = true;
      Over1 = false;
      Over3 = false;
      Over6 = false;
    } else if ( OverRect(rect3X, rect3Y) ) {
      Over3 = true;
      Over2 = false;
      Over1 = false;
      Over6 = false;
    } else if (OverRect(rect6X, rect6Y)) {
      Over3 = false;
      Over2 = false;
      Over1 = false;
      Over6 = true;
    } else {
      Over1 = false;
      Over2 = false;
      Over3 = false;
    }
  }
  if (state != 0) {
    if (state == 10) {
      if (OverRect(rect4X, rect4Y)) {
        Over7 = true;
        Over8 = false;
      } else if (OverRect(rect5X, rect5Y)) {
        Over7 = false;
        Over8 = true;
      } else {
        Over7 = false;
        Over8 = false;
      }
    }
    if (OverRect(rect4X, rect4Y)) {
      Over4 = true;
      Over5 = false;
    } else if (OverRect(rect5X, rect5Y)) {
      Over4 = false;
      Over5 = true;
    } else {
      Over4 = false;
      Over5 = false;
    }
  }
}

void mouseClicked() {
  if (state == 0) {
    if (Over1) {
      state = 1;
    }
    if (Over2) {
      state = 4;
    }
    if (Over3) {
      state = 7;
    }
    if (Over6) {
      state = 10;
    }
  } else if (state == 1 || state == 4 || state==7 || state == 11 || state == 14) {
    if (Over4) {
      state += 1;
    }

    if (Over5) {
      state += 2;
    }
  } else if (state ==10) {
    if (Over7) {
      state = 11;
    }
    if (Over8) {
      state = 14;
    }
  }
}
//returns true if the mouse is on the respective rectangle
boolean OverRect(int x, int y) {
  return mouseX >= x && mouseX <= x+recW &&
    mouseY  >= y && mouseY <= y +  recH;
}

void keyPressed() { //reset button
  if (keyCode == 'R' || keyCode == 'r') { // if R is pressed
    setup = true;// resets
  }
  if (keyCode == 'M' || keyCode == 'm') {
    state = 0;
    setup();
  }
}