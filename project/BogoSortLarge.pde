class BogoSortLarge {

  int counter; // count iterations
  ArrayList<Integer> arr; // heights

  BogoSortLarge() {
    frameRate(10000);
    counter = 0;
    size(600, 600);
    background(0);
    setArr(); // creates array w random heights
    Rectangles[] temp = new Rectangles[width/100]; // creates Rectangles
    for (int x = 0; x < temp.length; x++) {
      temp[x] = new Rectangles( x*100, height - arr.get(x), 100, arr.get(x), 255 ); // sets heights
    }
    printRect(temp);
  }

  void drawBGL() {
    if (notSorted(arr)) {
      background(0);
      shuffl(arr);
      Rectangles[] temp = new Rectangles[width/6]; // creates Rectangles
      for (int x = 0; x < temp.length; x++) {
        temp[x] = new Rectangles( x*6, height - arr.get(x), 6, arr.get(x), 255 ); // sets heights
      }
      printRect(temp);
    }
  }

  void setArr() { // makes an array with randomized rectangle heights
    arr = new ArrayList<Integer>();
    double scale = height/ 101;
    for (int x = 1; x < 101; x++) {
      arr.add((int) (x*scale));
    }
    int randomIndex;
    for ( int i = arr.size()-1; i > 0; i-- ) {
      //pick an index at random
      randomIndex = (int)( (i+1) * Math.random() );
      //swap the values at position i and randomIndex
      arr.set(i, arr.set(randomIndex, arr.get(i)) );
    }
  }

  boolean notSorted( ArrayList<Integer> data ) 
  {
    //iterate fr first to next-to-last element, comparing to next
    for ( int i = 0; i < data.size()-1; i++ ) {
      //if element at i > element at i+1, not sorted
      if ( data.get(i).compareTo(data.get(i+1) ) > 0 ) 
        return true;
    }
    return false;
  }

  void shuffl( ArrayList al) {
    int randomIndex;
    //setup for traversal fr right to left
    //for ( int i = al.size()-1; i > 0; i-- ) {
    //pick an index at random
    randomIndex = (int)( (99+1) * Math.random() );
    //swap the values at position i and randomIndex
    al.set( 99, al.set( randomIndex, al.get(99) ) );
  }
  //}

  void printRect( Rectangles[] roar ) {
    for (Rectangles r : roar) {
      r.drawR();
    }
  }
}