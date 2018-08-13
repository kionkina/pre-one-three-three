class InsertionSortLarge {
  int counter; // count iterations
  rArrIS rects;
  int[] arr; // heights

  InsertionSortLarge() {
    frameRate(500);
    counter = 0;
    size(600, 600);
    background(0);
    setArr(); // creates array w random heights
    Rectangles[] temp = new Rectangles[width/3]; // creates Rectangles
    for (int x = 0; x < temp.length; x++) {
      temp[x] = new Rectangles( x*3, height - arr[x], 3, arr[x], 255 ); // sets heights
    }
    rects = new rArrIS( temp ); //sorts
  }

  void drawIL() {
    if (counter == rects.order.size() ) { // if on last "frame"
      background(0);
      rects.drawIL(counter-1);//prints out sorted array
    } else {// if not on last "frame"
      background(0);
      rects.drawIL(counter); //iterates through "frames" one by one
      counter++;// next frame
    }
  }

  void setArr() { // makes an array with randomized rectangle heights
    arr = new int[width];
    double scale = height/ width;
    for (int x = 0; x < arr.length; x++) {
      arr[x] = (int) (x*scale);
    }
    int randomIndex;
    for ( int i = arr.length-1; i > 0; i-- ) {
      //pick an index at random
      randomIndex = (int)( (i+1) * Math.random() );
      //swap the values at position i and randomIndex
      int temp = arr[i];
      arr[i] = arr[randomIndex];
      arr[randomIndex] = temp;
    }
  }
}