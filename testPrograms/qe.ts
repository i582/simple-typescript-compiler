import { print, println, input } from "./lib/io";
import { sqrt } from "./lib/math";

/**
 * Function print string and number
 * @param str The string to print.
 * @param num The number to print.
 */
function print_n(str: string, num: number)
{
    println(str);
    print(num);
}


println("Enter a: ");
let a: number = input();
println("Enter b: ");
let b: number = input();
println("Enter c: ");
let c: number = input();
println("\n");


let x: number = 0;
let D: number = b * b - 4*a * c;

if (D >= 0)
{
    println("Answer: ");

    x = (-1 * b + sqrt(D)) / (2 * a);
    print_n("x1 = ", x);


    x = (-1 * b - sqrt(D)) / (2 * a);
    print_n("x2 = ", x);


    print_n("D = ", D);
    println("\n");
}
else
{
    println("D < 0. Not root. ");
    print_n("D = ", D);
}