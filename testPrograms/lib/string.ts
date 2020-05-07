/**
 * The function returns a character by index. In case of an invalid index,
 * an empty string is returned.
 * @param str
 * @param index
 */
declare function at(str: string, index: number): string;

/**
 * The function returns the size of the string.
 * @param str String
 */
declare function strlen(str: string): number;

/**
 * The function concatenates two lines and returns the result of the concatenation.
 * @param str1 First string
 * @param str2 Second string
 */
declare function concat(str1: string, str2: string): string;

/**
 * The function returns a substring from the start index to the end, inclusive.
 * In case of incorrectly specified indexes, the function will return an empty string.
 * @param str String to slice
 * @param start Start index
 * @param end End index
 */
declare function slice(str: string, start: number, end: number): string;


export { concat, slice, strlen, at};