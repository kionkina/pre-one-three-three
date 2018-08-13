class theSort {
  
 int[] arr;
 ArrayList<int[]> order;
boolean nyoom;
   // ArrayList<Integer> partz;
    ArrayList<Integer> sorted;


  theSort(int[] al) {
    arr = al;
    order = new ArrayList<int[]>();
    nyoom = false;
   // partz = new ArrayList<Integer>();
   sorted = new ArrayList<Integer>();
   nyoom = false;
  }

  public void heapSortV() {

    //PART 1: HEAPIFY THE ENTIRE ARRAY
    //we will order it as a max-heap
    //because the partition will shrink from the right, and the right should have the largest element at the end
    int part = 0; //defines the outer upper bound of heap partition (i.e., heap = [0, partition])
    //while the entire thing isn't part of the heap:
    int index  = 0;
    while (part < arr.length) {
 
      //index keeps track of where the thing that was most recently added to the heap is
      index = part;
      //until the index'd thing is in the right level of the heap:
      //note: this keeps going until arr[index] is greater because this is a max-heap
      while (arr[index] > arr[(index-1)/2]) {
           nyoom = false;
        //promote the child by swapping with it's parent
        order.add(dupe(arr));

        sorted.add(part);
        swap(arr, index, (index-1)/2);
        index = (index-1)/2;
      }
      part+=1;
    }
  
    part-=1; //partition grew one too much, quick fix
    index = 0;//reuse it cuz why not
    //at this point, the array should be formatted as a max-heap
    //and part will equal the index of the last item, and we have to decrease it until it's back to 0
    while (part > 0) {
      nyoom = true;
      swap(arr, 0, part);
      part-=1;
      //at this point, the max item is in the right spot
      //now, you just have to reheapify:
      index = 0;
      int maxChild = maxChildPos(arr, index, part);
      //until you reach a leaf or a point where the maxchild is smaller than the number at index:
      while (maxChild != -1 && arr[index] < arr[maxChild]) {
        //swap with the biggest child unless it's bigger than it (caught by while):
        order.add(dupe(arr));
        sorted.add(part);
        swap(arr, index, maxChild);
        
        //update index to be where minChild is
        index=maxChild;
        //update midChild accordingly
        maxChild = maxChildPos(arr, index, part);
      }
   
    order.add(dupe(arr));
    sorted.add(part);

    }
  }






  public int maxChildPos(int[] roar, int pos, int part) {
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
    if (roar[(pos*2)+2] > roar[(pos*2)+1]) {
      return (pos*2)+2;
    }
    //else, the left child is greater, so return it
    return (pos*2)+1;
  }

  int[] dupe( int[] roar ) {
    int[] ret = new int[ roar.length];
    for (int x = 0; x < roar.length; x++) {
      ret[x] = roar[x];
    }
    return ret;
  }

  void swap( int[] roar, int a, int b) {
    int temp = roar[a];
    roar[a] = roar[b];
    roar[b] = temp;
  }
} 