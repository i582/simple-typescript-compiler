import {println, print, input} from "./lib/io";
import {concat, slice, strlen, at, find, toString, toNumber} from "./lib/string";


let strArray: string[] = ["Hello ", "World!"];

let str1 = "Hello ";
let str2 = "World!";

let str3 = concat(str1, "World! dsggsd");

let str4 = at(str3, 8);

// str3 = slice(str3, 2, 11);
// println(str3);
//
// print(strlen(str3));
//
// println(str4);

let b = strlen(str3);
print(b);
for (let i = 0; i < b; i += 1)
{
    println(concat(at(str3, i), "\n"));
}

let hasWorld = find(str3, "World") != -1;

if (hasWorld)
{
    println("Has World!");
}
else
{
    println("Hasn't World!");
}




let numberFromString = toNumber("-100352");

print(numberFromString);

println(concat(concat("Hello I'm ", toString(19, 10)), " years old!"));
