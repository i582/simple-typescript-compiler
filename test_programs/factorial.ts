function print(n: number): void;
function println(n: string): void;
function input(): number;
function sqrt(a: number): number;


function factorial(a: number): number
{
    if (a < 2)
    {
        return 1;
    }

    return a * factorial(a - 1);
}

print(factorial(8));