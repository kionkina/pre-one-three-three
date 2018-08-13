class BubbleSortSmall {
  //======================================SMALL BUBBLE SORT==========================================
  // Welcome! In here, you will find a small scale bubble sort visualization. 

  //------------------------------------ORIGINAL SORT CODE----------------------------------------------
  /*public void BubbleSortV() {
   for ( int pass = 1; pass < arr.length; pass++ ) {
   //System.out.println( "commencing pass #" + pass + "..." );
   
   //iterate thru first to next-to-last element, comparing to next
   for ( int i = 0; i < arr.length-1; i++ ) {
   
   //if element at i > element at i+1, swap
   if ( arr[i] > arr[i+1] ) {
   int temp = arr[i];
   arr[i] = arr[i+1];
   arr[i+1] = temp;
   }
   //System.out.println(data); //diag: show current state of list
   }
   }
   }}*/
  //----------------------------------------------------------------------------------------------------

  int[] arr; //the array 
  float boxWidth;
  float boxHeight;
  int firstBox;
  int secondBox;
  int arrSize;
  int pass;
  int i; //current index 
  boolean swapping;

  BubbleSortSmall() {
    firstBox = 0; 
    secondBox = 0;
    swapping = false;
    frameRate(4);
    background(0);
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
    pass = 1;
  }


  void drawBS() {

    /* stroke(165, 30, 225);
     strokeWeight(5);
     rect(25, 10, 150, 40);  
     textSize(20);
     fill(255);*/

    //---------------------------sorting--------------------------------------------------------------------------

    if (pass < arrSize) {
      if (i < arrSize - 1) {
        if ( arr[i] > arr[i+1] && !swapping ) {
          int temp = arr[i];
          arr[i] = arr[i+1];
          arr[i+1] = temp;
          firstBox = i;
          secondBox = i + 1;
          swapping = true;
        }
        if (i == arrSize - 2) {
          pass++;
          i = 0;
        } else {
          i++;
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

    //This excerpt colors the enitre array a darker blue to indicate that it is sorted

    for (int i = 0; i < arrSize; i++) {
      if ( pass >= arrSize) {
        fill(138, 225, 115);
      } else if ( i == firstBox) {
        fill(171, 139, 252);
      } 
      else if  (i == secondBox){
        fill(118,255,172);
      }
      else {
        fill(225);
      }
      rect(25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
      fill(0);
      text(Integer.toString(arr[i]), 25 + boxWidth*i + i*3, height/2 - boxHeight/2, boxWidth, boxHeight);
    } // ends loop
  } // end of draw()
}