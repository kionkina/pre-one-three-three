class rArrIS {
  ArrayList<Integer> count; // counter array
  ArrayList<Rectangles[]> order; // array of frames
  Rectangles[] rawr; // frame
  int[] arr;// heights

  rArrIS(Rectangles[] roar) {// Constructor
    setArr();
    rawr = dupe(roar);

    count = new ArrayList<Integer>();// initializes the array
    order = new ArrayList<Rectangles[]>();// initializes the array

    order.add(dupe(rawr));//start frame
    count.add(-1);

    InsertionSortV();//sorts rawr
  }

  Rectangles[] dupe( Rectangles[] roar ) {//makes a copy of the "frame"
    Rectangles[] ret = new Rectangles[ roar.length];
    for (int x = 0; x < roar.length; x++) {
      ret[x] = roar[x].dupe();
    }
    return ret;
  }

  void InsertionSortV() {//Insertion Sort
    for (int x = 1; x < rawr.length; x++) {
      int y = x;
      Rectangles r = rawr[x];
      for (y = x; y > 0 && (rawr[y-1].getHeight() > r.getHeight()); y--) {
        rawr[y] = rawr[y-1];
        order.add(dupe(rawr)); // adds frame after one swap
        count.add(y);
      }
      rawr[y] = r;
      order.add(dupe(rawr));//adds frame after second swap
      count.add(y);
    }

    Rectangles[] temp = order.remove( order.size() - 1);
    order.add(dupe(temp));
    order.add(dupe(temp));
    count.add(-1);
  }

  void drawIL(int x) {// draws frame
    for (int i  = 0; i < order.get(x).length; i++) {
      Rectangles r = order.get(x)[i];
      r.drawRI(i*3, 3, count.get(x) == i);
    }
  }



  void swap( Rectangles[] roar, int a, int b) {//swaps rectangles at a and b in roar
    Rectangles temp = roar[a];
    roar[a] = roar[b];
    roar[b] = temp;
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