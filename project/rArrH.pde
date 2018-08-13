class rArrHS {
  ArrayList<Integer> count;
  ArrayList<Rectangles[]> order;
  Rectangles[] rawr;
  int[] arr;

  rArrHS(Rectangles[] roar) {// Constructor
    setArr();
    rawr = dupe(roar);

    count = new ArrayList<Integer>();
    order = new ArrayList<Rectangles[]>();

    order.add(dupe(rawr));
    count.add(-1);

    heapSortV();
  }

  public void heapSortV() {
    //PART 1: HEAPIFY THE ENTIRE ARRAY
    //we will order it as a max-heap
    //because the partition will shrink from the right, and the right should have the largest element at the end
    int part = 0; //defines the outer upper bound of heap partition (i.e., heap = [0, partition])
    //while the entire thing isn't part of the heap:
    int index  = 0;
    while (part < rawr.length) {
      //index keeps track of where the thing that was most recently added to the heap is
      index = part;
      //until the index'd thing is in the right level of the heap:
      //note: this keeps going until arr[index] is greater because this is a max-heap
      while (rawr[index].getHeight() > rawr[(index-1)/2].getHeight()) {
        //promote the child by swapping with it's parent
        order.add(dupe(rawr));
        count.add(part);
        swap(rawr, index, (index-1)/2);
        index = (index-1)/2;
      }
      part+=1;
    }
    int counter = part;
    part-=1; //partition grew one too much, quick fix
    index = 0;//reuse it cuz why not
    //at this point, the array should be formatted as a max-heap
    //and part will equal the index of the last item, and we have to decrease it until it's back to 0
    while (part > 0) {
      swap(rawr, 0, part);
      part-=1;
      //at this point, the max item is in the right spot
      //now, you just have to reheapify:
      index = 0;
      int maxChild = maxChildPos(rawr, index, part);
      //until you reach a leaf or a point where the maxchild is smaller than the number at index:
      while (maxChild != -1 && rawr[index].getHeight() < rawr[maxChild].getHeight()) {
        //swap with the biggest child unless it's bigger than it (caught by while):
        order.add(dupe(rawr));
        count.add(counter);
        swap(rawr, index, maxChild);
        //update index to be where minChild is
        index=maxChild;
        //update midChild accordingly
        maxChild = maxChildPos(rawr, index, part);
        counter++;
      }
    }
    order.add(dupe(rawr));
    count.add(counter);
  }

  public int maxChildPos(Rectangles[] roar, int pos, int part) {
    //3 cases:
    //1. has less than 2 children in the heap:
    if (((pos*2)+2) > part) {
      //1a. has exactly one child:
      if (((pos*2)+1) <= part) {
        //returns the pos of the only child (ie the leftmost)
        return (pos*2)+1;
        //1b. else, there is no left child, return -1:
      }
      return -1;
    }
    //2. 2 children:
    //if the right child is greater, return the right child
    if (roar[(pos*2)+2].getHeight() > roar[(pos*2)+1].getHeight()) {
      return (pos*2)+2;
    }
    //else, the left child is greater, so return it
    return (pos*2)+1;
  }

  Rectangles[] dupe( Rectangles[] roar ) {
    Rectangles[] ret = new Rectangles[ roar.length];
    for (int x = 0; x < roar.length; x++) {
      ret[x] = roar[x].dupe();
    }
    return ret;
  }




  void drawH(int x) {
    for (int i  = 0; i < order.get(x).length; i++) {
      Rectangles r = order.get(x)[i];
      r.drawRB(i*3, 3, count.get(x) == i);
    }
  }



  void swap( Rectangles[] roar, int a, int b) {
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