import { print, println, input, print_a } from "./lib/io";


function quickSort(array: number[], size: number)
{
    quickSortHide(array, 0, size - 1);
}

function quickSortHide(array: number[], first: number, last: number)
{
    if (first < last)
    {
        let left = first;
        let right = last;
        let middle = array[(left + right) / 2];


        do
        {
            while (array[left] < middle)
                left += 1;
            while (array[right] > middle)
                right -= 1;


            if (left <= right)
            {
                let tmp = array[left];
                array[left] = array[right];
                array[right] = tmp;

                left += 1;
                right -= 1;
            }

        } while (left <= right);

        quickSortHide(array, first, right);
        quickSortHide(array, left, last);
    }
}


function bubbleSort(array: number[], size: number)
{
    for (let i = 1; i < size; i += 1)
    {
        for (let j = 0; j < size - i; j += 1)
        {
            if (array[j] > array[j + 1])
            {
                let temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}



export { quickSort, bubbleSort };
