function sqrt(value: number): number
{
    return 0;
}

function println(message: string)
{

}
function input(): number
{

    return 0;
}
function to_string(value: number): string
{

    return "";
}



let a: number;
let b: number;
let c: number;
let x: number;



println("Enter a");
a = input();
println("Enter b");
b = input();
println("Enter c");
c = input();

let D: number = b * b - 4*a * c;

if (D >= 0)
{
    x = (-1 * b + sqrt(b * b - 4*a * c)) / (2 * a);
    println("X1"); println(to_string(x));

    x = (-1 * b - sqrt(b * b - 4*a * c)) / (2 * a);
    println("X2"); println(to_string(x));
}
else
{
    println("D < 0. Not root.");
}