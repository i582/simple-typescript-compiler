import { bubbleSort, printArray, quickSort, print, println } from "./sorts";

const size = 20;
let array: number[] = [98, 69, 0, 4, 41, 57, 35, 15, 7, 63, 2, 43, 33, 56, 24, 77, 73, 30, 38, 47];

printArray(array, size);
quickSort(array, size);
printArray(array, size);


