import { bubbleSort, printArray, quickSort, print } from "./sorts";
import { factorial } from "./factorial";
import { sqrt } from "./lib/math";

const size = 20;
let array: number[] = [98, 69, 0, 4, 41, 57, 35, 15, 7, 63, 2, 43, 33, 56, 24, 77, 73, 30, 38, 47];

printArray(array, size);
quickSort(array, 20);
printArray(array, size);


let b = size + 45;



let c = size < 100 && b > 42;

print(factorial(5));


print(sqrt(25));