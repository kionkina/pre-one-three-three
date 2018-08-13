class BogoSortSmall {

  //======================================SMALL BOGO SORT==========================================
  // Welcome! In here, you will find a small scale bogo sort visualization. 
  //------------------------------------ORIGINAL SORT CODE----------------------------------------------
  /*

   private boolean isSorted(int[] i) {
   for(int x = 0; x < i.length - 1; ++x) {
   if(i[x] > i[x+1]) {
   return false;
   }
   }
   return true;
   }
   
   
   public RandomSort(int[] i) {
   int counter = 0;
   System.out.println("I'll sort " + i.length + " elements...");
   while(!isSorted(i)) {
   shuffle(i);
   counter++;
   }
   System.out.println("Solution found! (shuffled " + counter + " times)");
   print(i);
   }
   
   private void shuffle(int[] i) {
   for(int x = 0; x < i.length; ++x) {
   int index1 = (int) (Math.random() * i.length),
   index2 = (int) (Math.random() * i.length);
   int a = i[index1];
   i[index1] = i[index2];
   i[index2] = a;
   }
   }
   
   */
  //----------------------------------------------------------------------------------------------------

  int[] arr; //the array 
  float boxWidth;
  float boxHeight;
  int firstBox;
  int secondBox;
  int arrSize;
  int i; //current index 
  boolean swapping;

  BogoSortSmall() {

    noStroke();
    firstBox = 0; 
    secondBox = 0;
    swapping = false;
    frameRate(1000000);
    background(0);
    fill(225);
    textSize(25);
    text("FrameRate : 1,000,000", 25, 40);
    size(600, 600);
    arrSize = (int) ((Math.random() * 5) + 6);
    boxWidth = (width - (50 + 2*arrSize)) / arrSize;
    boxHeight = height/10;
    System.out.println("array size = " + arrSize);
    // ---------------- arr is populated -------------------------

    arr = new int[arrSize];
    for (int i =0; i < arrSize; i++) {
      int toAdd = (int)(Math.random() * width);
      arr[i] = toAdd;
      fill(225);
      rect(25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      fill(0);
      textSize(15);
      text(Integer.toString(toAdd), 25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
    }
    i = 0;
  }


  private boolean sorted(int[] arr) {
    for (int i = 0; i < arrSize - 1; i++) {
      if (arr[i] > arr[i+1]) {
        return false;
      }
    }
    return true;
  }



  void drawBGS() {

    //---------------------------sorting--------------------------------------------------------------------------

    if (!(sorted(arr))) {
      if (i < arrSize) {
        if (i < arrSize && !swapping) {
          int index1 = (int) (Math.random() * arrSize);
          int index2 = (int) (Math.random() * arrSize);
          firstBox = index1;
          secondBox = index2;
          int a = arr[index1];
          arr[index1] = arr[index2];
          arr[index2] = a;
          swapping = true;
        }
      }
    }



    //-----------------------------------------SWAP----------------------------------------------------------
    // when two values are being swapped, they are colored violet 
    if (swapping) {
      fill(225, 139, 225);
      rect(25 + boxWidth*firstBox + firstBox*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      fill(0);
      //text 
      text(Integer.toString(arr[firstBox]), 25 + boxWidth*firstBox + firstBox*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      fill(225, 139, 225);
      rect(25 + boxWidth*secondBox + secondBox*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      //text
      fill(0);
      text(Integer.toString(arr[secondBox]), 25 + boxWidth*secondBox + secondBox*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      swapping = false;
    } // ends swapping
    //------------------------------------------------------------------------------------------------------ 

    //This excerpt colors the  array a different color to indicate that it is sorted

    if (sorted(arr)) {

      for (int i = 0; i < arrSize; i++) {
        fill(171, 139, 252);
        rect(25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
        fill(0);
        text(Integer.toString(arr[i]), 25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      } // ends loop
    } else {

      for (int i = 0; i < arrSize; i++) {

        if ( i == firstBox ) {
          fill(255, 51, 51);
        } else if ( i == secondBox) {
          fill(153, 153, 255);
        } else {
          fill(225);
        }
        rect(25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
        fill(0);
        text(Integer.toString(arr[i]), 25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      } // ends loop
    }
  } // end of draw()
}