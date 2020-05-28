import {concat, strlen, toNumber, slice, toString} from "./lib/string";
import { print, println } from "./lib/io";

let age = 5 + 7;

let string1 = "Hello";

print(100);

let str = "101";

print(toNumber(str));

println(concat(toString(strlen(slice(string1, 0, 4)), 10), "\n"));



println(concat(string1, "\n"));

print(age);


println("\n");
println(string1);
println(" has length equal ");
print(strlen(string1));



// let age = 75;

// print(age);

// let str: string = "Hello";

// println("\n");
// println(str);
// println(" has length equal ");
// print(strlen(str));

// println("\n");




// println(slice(concat("Hello ", "World!"), 3, 10));

