import { bubbleSort, printArray, quickSort, print } from "./sorts";

const size = 20;
let array: number[] = [98, 69, 42, 4, 41, 57, 35, 15, 7, 63, 2, 43, 33, 56, 24, 77, 73, 30, 38, 47];

printArray(array, size);
quickSort(array, 20);
printArray(array, size);


let b = size + 45;

print(b);