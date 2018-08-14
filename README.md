# pre-one-three-three

## Project
This project is a visualizer for multiple sorting algorithms we studied during our semester of APCS. 
#### Large Scale
Before the program is run, an ArrayList of Arrays of Rectangles is created, along with an array of objects called Rectangles, each of which has a height representing its value. The Rectangles in the array are randomized by height. The array of Rectangles is then sorted using the algorithm one step at a time, and each step is saved in order. When the program is run, each array of order is printed out one at a time, showing the progression from unsorted to sorted.
#### Small Scale
For the small scale visualization, an array is displayed with each index represented by a white rectangle and the corresponding integer over it. The array is then sorted using the selected sorting algorithm. For Selection Sort and Insertion Sort, a partition is displayed to separate the sorted part of the array from the unsorted part. In Selection Sort, a blue color is representative of maxPos.  
You can find the original project here: https://github.com/kionkina/SortaAwesome

## Project Dependencies
You will need to have Processing installed  
You can do so here: https://processing.org/download/

## Project Launch Instructions
```
$ cd project
$ processing SA.pde
```

## CPP
```
$ g++ hello.cpp
$ ./a.out
```
