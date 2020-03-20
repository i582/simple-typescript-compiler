function print(n: number): void;
function println(n: string): void;
function input(): number;
function sqrt(a: number): number;


function swap(items_for_swap: number[], firstIndex: number, secondIndex: number): void
{

    print(items_for_swap[firstIndex]);
    print(items_for_swap[secondIndex]);
    println("swap");

    const temp: number = items_for_swap[firstIndex];
    items_for_swap[firstIndex] = items_for_swap[secondIndex];
    items_for_swap[secondIndex] = temp;
}

function partition(items_for_partition: number[], left: number, right: number): number
{
    let index_partition: number =  (right + left) / 2;
    print(index_partition);
    println("index_partition");

    let pivot: number   = items_for_partition[index_partition];
    let i: number       = left;
    let j: number       = right;

    while (i <= j)
    {
        while (items_for_partition[i] < pivot)
        {
            i += 1;
        }
        while (items_for_partition[j] > pivot)
        {
            j -= 1;
        }

        if (i <= j)
        {
            swap(items_for_partition, i, j);
            i += 1;
            j -= 1;
        }
    }

    return i;
}

function quickSort(items: number[], left: number, right: number): void
{
    let index: number = partition(items, left, right);

    if (left < index - 1)
    {
        quickSort(items, left, index - 1);
    }
    if (index < right)
    {
        quickSort(items, index, right);
    }
}

function qs(s_arr: number[], first: number, last: number): void
{
    if (first < last)
    {
        let left: number = first;
        let right: number = last;
        let middle: number = s_arr[(left + right) / 2];


        do
        {
            while (s_arr[left] < middle)
            {
                left += 1;

                print(s_arr[left]);
                println("s_arr[left]");
            }
            while (s_arr[right] > middle)
            {
                right -= 1;

                print(s_arr[right]);
                println("s_arr[right]");
            }
            if (left <= right)
            {
                let tmp: number = s_arr[left];
                s_arr[left] = s_arr[right];
                s_arr[right] = tmp;
                left += 1;
                right -= 1;
            }

        } while (left <= right);

        qs(s_arr, first, right);
        qs(s_arr, left, last);
    }
}


let arr: number[] = [10, 4, 2, 14, 67, 2, 11, 33, 1, 15];

for (let i: number = 0; i < 10; i += 1)
{
    print(arr[i]);
}
println(" ");

qs(arr, 0, 9);

for (let k: number = 0; k < 10; k += 1)
{
    print(arr[k]);
}
println(" ");

