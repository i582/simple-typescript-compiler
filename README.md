# 	Simple compailer from TypeScript to Assembler

![](https://img.shields.io/badge/language-c%2B%2B-brightgreen)

![](docs/ts.png)

## Description

Term paper of the 3rd semester. Simple translator from TypeScript to ASM. TypeScript has been changed and now this language is fully statically typed. With support for a minimum number of parts of the language. 

## Lexer

* [x] `Integer numbers`
    * [ ] `binary`
    * [ ] `hexadecimal`
    * [ ] `_ separator`
* [x] `Double numbers`
    * [ ] `exponential form`
* [x] `String const`

* [x] Validation of identifiers.

## Syntax parser

### Operators

* [x] `+`
* [x] `-`
* [x] `/`
* [x] `*`
* [x] `**`
* [x] `() <- Expressions in brackets`
* [x] `++a` 
* [x] `--a`
* [x] `a++` 
* [x] `a--`
* [x] `+a` 
* [x] `-a`
* [x] `!a`
* [x] `+=`
* [x] `-=`
* [x] `/=`
* [x] `*=`
* [x] `&&` 
* [x] `||`
* [x] `<` 
* [x] `>`
* [x] `>=` 
* [x] `<=`
* [x] `==` 
* [x] `!=`
* [x] `[]`
* [x] `? : `
* [x] `new` (only for arrays)

### Blocks

* [x] `if`
* [x] `else`
* [x] `else if`
* [x] `for`
    * [x] `break`
    * [x] `continue`
* [x] `while`
    * [x] `break`
    * [x] `continue`
* [x] `do while` 
    * [x] `break`
    * [x] `continue`

* [x] `functions`    
    * [x] `return`


### Types

* [x] `number`
* [x] `boolean`
* [x] `string`
* [x] `void`
* [x] `number[]`
* [x] `boolean[]`
* [x] `string[]`

### Other

* [x] Initialization lists for arrays.

## Semantic analysis

#### Variables

* [x] The absence of a variable with this name in the current program scope.

#### Constants

* [x] Assignment to constants.
* [x] Uninitialized constants.

#### Functions

* [x] A function call with the wrong type or number of parameters.

#### Array

* [x] Uninitialized arrays.
* [x] Incorrect assignment to an array.
* [x] Checking the types of initialization list for an array.

#### Other

* [x] Validation of assignments.
* [x] Type checking for operands.

## Code generation

* [x] Assignment expressions.
* [x] Arithmetic expressions.
  * [x] `+`
  * [x] `-`
  * [x] `/`
  * [x] `*`
  * [ ] `**`
  * [x] `++a` 
  * [x] `--a`
  * [ ] `a++` 
  * [ ] `a--`
  * [x] `-a`
  * [x] `!a`
  * [x] `+=`
  * [x] `-=`
  * [ ] `/=`
  * [x] `*=`
  * [x] `[]`
  * [x] `? : `
  * [x] `new` (only for arrays)
* [ ] Conditional expressions.
  * [x] `&&` 
  * [x] `||`
  * [x] `<` 
  * [x] `>`
  * [x] `>=` 
  * [x] `<=`
  * [x] `==` 
  * [x] `!=`
  * [ ] `!`
* [x] `if`
* [x] `else`
* [x] `else if`
* [x] `while`
  * [x] `break`
  * [x] `continue`
* [x] `for`
  * [x] `break`
  * [x] `continue`
* [ ] `functions`
  * [x] `arguments`
    * [x] `number`
    * [x] `boolean`
    * [x] `string`
    * [x] `arrays`
  * [ ] `return`
    * [x] `number`
    * [x] `boolean`
    * [ ] `string`
    * [ ] `arrays`
* [x] `std functions`
  * [x] `std input` (only for number)
  * [x] `std print`(only for number)
  * [x] `std sqrt`
  * [x] `std println`(only for const string)
* [x] `arrays`
  * [x] `number`
  * [x] `boolean`
  * [x] `string`
  * [x] `new initializing`
  * [x] `initializer list`
* [ ] Access to an array element
  * [x] `number`
  * [x] `boolean`
  * [ ] `string`
* [x] Assigning an array element.

### Optimizations

* [ ] Replacing an arithmetic action with constants with a constant with the result of this action.





## Testing

* [x] Assigment 
  * [x] to variable
  * [x] to array element
    * [x] number
    * [x] boolean
* [x] Arithmetic 
  * [x] `+`
  * [x] `-`
  * [x] `/`
  * [x] `*`
  * [x] `++a` 
  * [x] `--a`
  * [x] `-a`
  * [x] `+=`
  * [x] `-=`
  * [x] `/=`
  * [x] `*=`
  * [ ] `? : `
* [x] Conditional
  * [x] ==
  * [x] !=
  * [x] <
  * [x] \>
  * [x] <=
  * [x] \>=
  * [x] !
* [x] if
* [x] else
* [x] while
  * [x] break
  * [x] continue
* [x] for
  * [x] break
  * [x] continue
* [x] functions
  * [x] arguments
    * [x] number
    * [x] boolean
    * [ ] string
    * [x] number[]
    * [x] boolean[]
  * [x] return
    * [x] number
    * [x] boolean
    * [ ] number[]
    * [ ] boolean[]
* [x] arrays
  * [x] number
  * [x] boolean
  * [x] init with initializer list
  * [x] init with new Array() construction
  * [x] access by index
    * [x] number
    * [x] boolean
* [x] std functions
  * [x] print — only for number
  * [x] println — only for constant string
  * [x] input — only for number
  * [x] sqrt



## Testing blocks

* [ ] ```typescript
  for (let i: number; i < 10; ++i)
  {
  	print(i);
  }
  
// 0 1 2 3 4 5 6 7 8 9
  ```
  
* [x] ```typescript
  let i: number = 100;
  while (i > 0)
  {
  	i -= 10;
      print(i);
  }
  
  // 90 80 70 60 50 40 30 20 10 0
  ```

* [x] ```typescript
  let a: number = 50;
  let b: boolean = a < 10;
  if (b && a > 10)
  {
      println("Yes");
  }
  else
  {
     println("No");
  }
  
  // No
  ```

* [ ] ```typescript
  let arr: number[] = [100, 200, 300];
  
  print(array[0]);
  
  arr[0] += array[1] + array[2];
  print(array[0]);
  
  // 100 600
  ```

* [ ] ```typescript
  function foo(array: number[], size: number): void
  {
      for (let i: number; i < size; ++i)
  	{
  		print(array[i]);
  	}
  }
  
  let a: number[] = [100, 200, 300];
  
  foo(a, 3);
  
  // 100, 200, 300
  ```

* [ ] ```typescript
  function foo(a: number, b: number): number
  {
      return a + b;
  }
  
  print(foo(100, 200));
  
  // 300
  ```

* [x] ```typescript
  let a: number = input();
  
  print(sqrt(a));
  
  // 25
  // 5
  ```

* [ ] ```typescript
  let b: number[] = [100, 200];
  
  
  let a: number = b[0];
  
  print(++a);
  
  ++a;
  
  b[0] = a;
  
  // this is error 
  ```

* [ ] 



