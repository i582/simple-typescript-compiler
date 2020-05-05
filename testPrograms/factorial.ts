import { print, println, input } from "./lib/io";

/**
 * Function calculating factorial.
 * @param a Number for calculating factorial.
 */
function factorial(a: number): number
{
    if (a < 2)
        return 1;

    return a * factorial(a - 1);
}

let num: number;

do
{
    println("Enter number: ");
    num = input();

    if (num > 10)
    {
        println("Enter number less 11!\n");
    }
    else
    {
        println("Result: ");
        print(factorial(num));
        break;
    }
} while (num > 10);


export {factorial};