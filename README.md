# pre-one-three-three

## Project
### Sorta Awesome by David Frid, Karina Ionkina, Mark Shafran
Our project is a visualizer for multiple sorting algorithms we studied this semester. The user is able to choose the sort that he or she wishes to see visualized. They user is then presented with the option of seeing a small scale array get sorted using the algorithm (visualized using boxes with values in the place of an array, and done very slowly) or a large scale array get sorted (visualized using 300 rectangles get sorted using the algorithm based on their height). If the user wishes to return to the title screen, he or she must press 'M.' If the user wishes to reset the sort he or she is watching, they must press 'R.'
#### Large Scale
The large scale sorts are done quite simply. Before the program is run, an ArrayList of Arrays of Rectangles called order is created, along with an array of objects called Rectangles, each of which has a height representing its value. The Rectangles in the array are randomized by height. The array of Rectangles is then sorted using the algorithm one step at a time, and each step is saved in order. When the program is run, each array of order is printed out one at a time, showing the progression from unsorted to sorted.
#### Small Scale
For the small scale visualization, an array is displayed with each index represented by a white rectangle and the corresponding integer over it. The array is then sorted using the selected sorting algorithm. For selection sort and insertion sort, a red partition is displayed to separate the sorted part of the array from the unsorted part. In Selection Sort, a blue color is representative of maxPos. In Insertion Sort, the indices being swapped are colored purple. The entire array is colored blue when the array is sorted.


## Project Dependencies
You will need to have Processing installed  
You can do so here: https://processing.org/download/

## Project Launch Instructions
```
$ cd project
$ processing SA.pde
```
