function print(n: number): void;

const size: number = 3;

let base_minor: number;
let answer_matrix: number[] = new Array(3);
let matrix: number[] = [2,  4,  3,
    5,  6,  2,
    3,  12, 24];
let help_matrix: number[] = [1,
    4,
    7];

for (let i: number = 0; i < 9; i += 1)
{
    print(matrix[i]);
}

for (let i: number = 0; i < size; i += 1)
{
    base_minor += solve_minor_3x3(matrix, 0, i);
}

for (let i: number = 0; i < size; i += 1)
{
    answer_matrix[i] += find_determinant(matrix, help_matrix, base_minor, i);
}

for (let i: number = 0; i < 3; i += 1)
{
    print(answer_matrix[i]);
}

function solve_minor_3x3(matrix: number[], column: number, row: number):number
{
    let temp: number = 0;
    let temp_matrix: number[] = new Array(4);

    let itemp: number = 0;
    let jtemp: number = 0;

    for (let i: number = 0; i < size; i += 1)
    {
        if (i != column)
        {
            for (let j: number = 0; j < size; j += 1)
            {
                if (j != row)
                {
                    temp_matrix[itemp * 2 + jtemp] = matrix[i * 3 + j];
                    jtemp += 1;
                }
            }
            jtemp = 0;
            itemp += 1;
        }
    }

    for (let i: number = 0; i < size - 1; i += 1)
    {
        temp += solve_minor_2x2(temp_matrix);
    }

    if ((column + row) / 2 != 0)
    {
        temp *= -1;
    }

    return temp * matrix[column * size + row];
}

function solve_minor_2x2(matrix: number[]) :number
{
    return matrix[0] * matrix[3] - matrix[1] * matrix[2];
}

function find_determinant(matrix: number[], help_matrix: number[], base_minor: number, column: number):number
{
    let help_minor: number;
    let temp_matrix: number[] = new Array(9);

    for (let i: number = 0; i < size; i += 1)
    {
        for (let j: number = 0; j < size; j += 1)
        {
            temp_matrix[i * size + j] = matrix[i * size + j];
        }
    }

    for (let i: number = 0; i < size; i += 1)
    {
        help_minor += solve_minor_3x3(temp_matrix, 0, i);
    }

    return help_minor / base_minor;
}

export {find_determinant};