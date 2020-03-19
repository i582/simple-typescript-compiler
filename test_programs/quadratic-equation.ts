function input(): number;
function print(n: number): void;
function println(n: string): void;
function sqrt(n: number): number;



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
    x = (-1 * b + sqrt(D)) / (2 * a);
    println("x1:");
    print(x);
    println(" ");

    x = (-1 * b - sqrt(D)) / (2 * a);
    println("x2:");
    print(x);
}
else
{
    println("D < 0. Not root.");
}