class HeapSortLarge {

  int counter;
  rArrHS rects;
  int[] arr;

  HeapSortLarge() {
    frameRate(60);
    counter = 0;
    size(600, 600);
    background(0);
    setArr();
    Rectangles[] temp = new Rectangles[width/3];
    for (int x = 0; x < temp.length; x++) {
      temp[x] = new Rectangles( x*3, height - arr[x], 3, arr[x], 255 );
    }
    rects = new rArrHS( temp ); //
  }

  void drawHS() {
    if (counter == rects.order.size() ) {
      background(0);
      rects.drawH(counter-1);
    } else {
      background(0);
      rects.drawH(counter);
      counter++;
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