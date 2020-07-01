/**
 * Function print number to console.
 * @param n The number to print.
 */
declare function print(n: number): void;

/**
 * Function print constant string to console.
 * @param n The string to print.
 */
declare function println(n: string): void;

/**
 * Function for reading a number from user input.
 */
declare function input(): number;


/**
 * Function print array to console.
 * @param array 
 * @param size 
 */
function print_a(array: number[], size: number)
{
    if (size < 0)
    {
        println("Size < 0!");
        return;
    }

    for (let i = 0; i < size; i += 1)
    {
        print(array[i]);
    }
}

export { print, println, input, print_a };