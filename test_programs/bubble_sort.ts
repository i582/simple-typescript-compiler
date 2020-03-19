function print(n: number): void;
function println(n: string): void;
function input(): number;
function sqrt(a: number): number;

function bubble_sort(array: number[], size: number): void
{
    let temp: number;

    for (let i: number = 1; i < size; i += 1)
    {
        for (let j: number = 0; j < size - i; j += 1)
        {
            if (array[j] > array[j + 1])
            {
                temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}

let arr: number[] = [1, 5, 2, 6, 7, 0];

for (let i: number = 0; i < 6; i += 1)
{
    print(arr[i]);
}
println(" ");

bubble_sort(arr, 6);

for (let k: number = 0; k < 6; k += 1)
{
    print(arr[k]);
}
println(" ");

