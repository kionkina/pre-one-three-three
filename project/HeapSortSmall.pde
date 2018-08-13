class HeapSortSmall {

  int[] arr;
  int arrSize;
  int boxWidth;
  int boxHeight;
  int rootY;
  int rootX;
  float levelX;
  float levelY;
  boolean filling;
  int i;
  boolean odd;
  theSort arr1;
  int counter = 0;


  HeapSortSmall() {

    System.out.println("i " + i);
    frameRate(2);
    noStroke();
    background(0);
    size(600, 600);
    arrSize = (int) ((Math.random() * 10) + 5 );
    //nodes = new int[arrSize][2];
    boxWidth = (width - ((2*arrSize) + 100)) / arrSize;
    boxHeight = height/15;
    System.out.println("array size = " + arrSize);
    // ---------------- arr is populated -------------------------
    arr = new int[arrSize];
    while (i != arrSize) {
      int toAdd = (int)(Math.random() * width);
      arr[i] = toAdd;
      System.out.println("adding " + toAdd);

      fill(225);
      rect(50 + boxWidth*i + i*3, height/10 - boxHeight/2, boxWidth, boxHeight);
      fill(0);
      textSize(15);
      text(Integer.toString(toAdd), 50 + boxWidth*i + i*3, height/10 - boxHeight/2, boxWidth, boxHeight);
      i += 1;
      System.out.println(i);
    }

    arr1= new theSort(arr);
    arr1.heapSortV();

    if (i == arrSize) {
      rootY= height/10 - boxHeight/2 + 80;
      rootX = width/2;
      levelX = rootX;
      levelY = rootY;
      node(rootX + 20, rootY, arr[0], 0, false);
      for (int p = 1; p < arr.length; p++) {
        if (p% 2 != 0) {
          odd = true;
        } else { 
          odd = false;
        }
        float level = log(p, 2) + 1;
        System.out.println(p + " " + log(p, 2));
        int loganswer = (int)Math.pow(2, level) - 1;
        if (loganswer == p) {
          System.out.println(" 2^ " + level + " - 1" + "==" + loganswer);
          System.out.println("index " + p + " new level.");
          System.out.println ("level =" + level);
          levelY = rootY + 70*level;
          levelX = rootX - 80*level;
        } else {
          if ( p == Math.pow(2, level -1) + 1) {
            levelX += 250/level;
          } else {
            levelX += 400/level + 10;
          }
        }
       // node(levelX, levelY, arr[p], level, odd);
      }
    }
  }

  int log(int x, int base)
  { 
    return (int) (Math.log(x) / Math.log(base));
  }

  //-------------------------- HEAPSORT CODE--------------------------------------------------


  void drawHSS() {
    if (counter < arr1.order.size()) {
      display( arr1.order.get(counter));
      counter++;
    }
  }

  void display(int[] arr) {
    //---------------------------------------display---------------------
    background(0);
    noStroke();
    for (int i = 0; i < arr.length; i++) {
      fill(225);
      rect(50 + boxWidth*i + i*3, height/10 - boxHeight/2, boxWidth, boxHeight);
      fill(0);
      textSize(15);
      text(Integer.toString(arr[i]), 50 + boxWidth*i + i*3, height/10 - boxHeight/2, boxWidth, boxHeight);
    }


    node(rootX + 20, rootY, arr[0], 0, false);
    for (int p = 1; p < arr1.arr.length &&  arr1.nyoom  && p < (arr1.sorted.get(counter)); p++) {

      if (p% 2 != 0) {
        odd = true;
      } else { 
        odd = false;
      }
      float level = log(p, 2) + 1;

      int loganswer = (int)Math.pow(2, level) - 1;
      if (loganswer == p) {

        levelY = rootY + 70*level;
        levelX = rootX - 80*level;
      } else {
        // if (p == 2){
        // levelX += 160;
        //}
        if ( p == Math.pow(2, level -1) + 1) {
          levelX += 250/level;
        } else {
          levelX += 400/level + 10;
        }
      }
      node(levelX, levelY, arr[p], level, odd);
    }
  }
}