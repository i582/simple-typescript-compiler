function print(n: number): void;
function println(n: string): void;

const size: number = 5;
const began: number = 3;
const max: number = 10000;


let matrix: number[] = [0, 10000, 2, 123, 124,
    10000, 0, 34, 44, 56,
    2, 34, 0, 89, 10000,
    123, 444, 56, 0, 10000,
    24, 10000, 10000, 10000, 0];



find_path(matrix, began - 1);


function find_path(matrix_n: number[], begin: number): void
{
    let is_node: boolean[] = new Array(5);
    let min_path: number[] = new Array(5);
    let index: number = max;
    let min: number = max;

    for (let i: number = 0; i < size; ++i)
    {
        min_path[i] = matrix_n[begin * size + i];
        print(min_path[i]);
        println(" ");
    }

    min_path[begin] = 0;

    while (true)
    {
        min = max;
        index = max;

        for (let j: number = 0; j < size; ++j)
        {
            if (is_node[j] == false && (min_path[j] < min))
            {
                min = min_path[j];
                index = j;
            }
        }

        if (index != max)
        {
            for (let j: number = 0; j < size; ++j)
            {
                if ((min_path[index]+matrix_n[index*size+j]) < min_path[j])
                {
                    min_path[j] = min_path[index] + matrix_n[index*size+j];
                }
            }
            is_node[index] = true;
        }
        if (index >= max)
        {
            break;
        }
    }

    println("Shortest path from ");
    print(begin + 1);

    for (let i: number = 0; i < size; ++i)
    {
        print(min_path[i]);
    }
}