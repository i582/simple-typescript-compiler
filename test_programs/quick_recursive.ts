function print(n: number): void;
function println(n: string): void;
function input(): number;
function sqrt(a: number): number;


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
            }
            while (s_arr[right] > middle)
            {
                right -= 1;
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

