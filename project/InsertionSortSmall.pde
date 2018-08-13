class InsertionSortSmall {
  //======================================SMALL INSERTION SORT==========================================
  // Welcome! In here, you will find a small scale insertion sort visualization. 
  // -- A red partition is used in between the indecies to separate the sorted portion of the array from
  // the unsorted part.
  // --The indecies being swapped are colored purple. 

  //------------------------------------ORIGINAL SORT CODE----------------------------------------------
  /*void sort() {
   for ( int partition = 1; partition < arr.length; partition++ ) {
   for ( int i = partition; i > 0; i-- ) {
   
   if ( arr[i] <  arr[i-1] ) {
   fill(225);
   System.out.println( "swap indices "+(i-1)+" & "+i+"...");
   
   int temp = arr[i];
   arr[i] = arr[i-1];
   arr[i-1] = temp;
   } else 
   break;} }}*/
  //----------------------------------------------------------------------------------------------------

  int[] arr; //the array 
  float boxWidth;
  float boxHeight;
  int firstBox;
  int secondBox;
  int arrSize;
  int partition;
  int i; //current index 
  boolean swapping;

  InsertionSortSmall() {
    firstBox = 0;
    secondBox = 0;
    partition = 1;
    i = partition;
    swapping = false;
    frameRate(1);
    background(0);
    size(600, 600);
    arrSize = (int) ((Math.random() * 5) + 7);
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
  }


  void drawIS() {

    stroke(165, 30, 225);
    strokeWeight(5);
    rect(25, 10, 150, 40);  
    textSize(20);
    fill(255);
    text("Partition: " + Integer.toString(partition), 45, 37); 

    System.out.println("partition = " + partition );



    //-------------------------parition maintenance-------------------------------------------------------------
    noStroke();
    fill(225, 51, 51);
    rect(25 +boxWidth+(boxWidth + 3)*(partition), width/2 - boxHeight*2, 3, boxHeight*4);
    fill(0);
    rect(25 +boxWidth+((boxWidth + 3)*(partition - 1 )), width/2 - boxHeight*2, 3, boxHeight*4);
    //-----------------------------------------------------------------------------------------------------------




    //---------------------------sorting--------------------------------------------------------------------------

    if (partition < arrSize) {
      if (i > 0) {
        // !swapping makes sure the code isn't re-running the same thing over and over again
        if (arr[i] < arr[i - 1] && !swapping) {
          System.out.println("swapping" + Integer.toString(i-1) + "and" + i); // I love s.o.pln 
          int temp = arr[i];
          arr[i] = arr[i-1];
          arr[i-1] = temp;
          firstBox = i - 1;
          secondBox = i;
          swapping = true;
        }
        //basically processing version of a for loop 
        if (i-1 <= 0) {
          // partition++ part of the outer loop
          partition += 1;
          i = partition;
        } else {
          i -= 1; // i-- part of the inner loop
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
      fill(225, 1, 225);
      rect(25 + boxWidth*secondBox + secondBox*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      //text
      fill(0);
      text(Integer.toString(arr[secondBox]), 25 + boxWidth*secondBox + secondBox*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      swapping = false;
    } // ends swapping
    //------------------------------------------------------------------------------------------------------ 

    //This excerpt colors the enitre array a darker blue to indicate that it is sorted
    if (partition > arrSize - 1) {
      for (int i = 0; i < arrSize; i++) {
        fill(171, 139, 252);
        rect(25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
        fill(0);
        text(Integer.toString(arr[i]), 25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      } // ends loop
    }
  } // end of draw()
}