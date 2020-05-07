import {println, print} from "./lib/io";
import {concat, slice, strlen, at} from "./lib/string";

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
