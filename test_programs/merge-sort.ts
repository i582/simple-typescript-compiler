function print(n: number): void;
function println(n: string): void;
function input(): number;
function sqrt(a: number): number;


let count_call: number = 0;

function merge(array_m: number[], first_m: number, last_m: number): void
{
    let middle: number;
    let start: number;
    let final: number;

    let mas: number[] = new Array(100);

    print(first_m);
    print(last_m);
    println("first_m last_m");

    middle = (first_m+last_m)/2;



    start = first_m;
    final = middle + 1;

    for(let j: number = first_m; j <= last_m; j += 1)
    {
        if ((start <= middle) && ((final > last_m) || (array_m[start] < array_m[final])))
        {
            mas[j] = array_m[start];
            start++;
        }
        else
        {
            mas[j] = array_m[final];
            final++;
        }
    }


    for (let j: number = first_m; j <= last_m; j += 1)
    {
        array_m[j] = mas[j];
    }
}

function merge_sort(array: number[], first: number, last: number): void
{
    count_call += 1;

    print(count_call);
    println("call");

    print(first);
    print(last);
    println("first last");

    if (first < last)
    {
        let middle: number = (first+last) / 2;
        print(middle);
        println("middle");

        merge_sort(array, first, middle);
        merge_sort(array, middle + 1, last);
        merge(array, first, last);
    }
}

let arr: number[] = [10, 4, 2, 14, 67, 2, 11, 33, 1, 15];

for (let i: number = 0; i < 10; i += 1)
{
    print(arr[i]);
}
println(" ");

merge_sort(arr, 0, 9);

for (let k: number = 0; k < 10; k += 1)
{
    print(arr[k]);
}
println(" ");

print(count_call);