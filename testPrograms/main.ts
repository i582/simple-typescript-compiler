/**
 * Hello World!
 */

import {quickSort, printArray} from "./sorts"

//
//
// let arr: number[] = [7, 5, 6, 10];
// let booleanArray: boolean[] = [true, false, true, true, false];
//
// let c = arr[2];
// let val = booleanArray[0];
//
// if (val == false)
// {
//     print(5);
// }
//
// let res: number[] = foo();
//
// print(res[1]);
//
// function foo(): number[]
// {
//     let arr: number[] = [10, 56, 23];
//     return arr;
// }
//
// print(c);

let arr: number[] = [7, 5, 6, 10];


function foo(): number[]
{
    let arr: number[] = [1, 56, 23];
    return arr;
}

let c: number[] = foo();

c[c[0]] = 100;

print(c[1] + c[0]);

quickSort(c, 3);
printArray(c, 3);

print(c[1] + c[0]);


printArray([10, 11, 12, 13, 15], 5);

let arrrw: number[] = array5(c, 3);

arrrw[1] = 5;

printArray(c, 3);
printArray(arrrw, 3);

let stringArray: string[] = ["fsa", "fas"];

println(stringArray[0]);

function array5(arr: number[], size: number): number[]
{
    for (let i = 0; i < size; i += 1)
    {
        arr[i] += 50;
    }

    return arr;
}

// const b1: number;
//
// b1 = 100;
//
// let arr: number[] = 10;
// let arr1: number[] = 10;
// arr = arr1;
//
// let arr2: number[];
//
//
// let b: number = 100;
//
// let c: number = b[5];
//
// c = "fsa";
//
// c += "fa" + b;
//
// c = -"ags";
//
// 5 = c;
//
// while (c == "gagsga")
// {
//
// }