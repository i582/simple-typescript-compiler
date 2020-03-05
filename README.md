# Simple compailer from TypeScript to Assembler

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
  * [ ] `++a` 
  * [ ] `--a`
  * [ ] `a++` 
  * [ ] `a--`
  * [ ] `+a` 
  * [ ] `-a`
  * [ ] `!a`
  * [x] `+=`
  * [x] `-=`
  * [ ] `/=`
  * [x] `*=`
  * [x] `[]`
  * [x] `? : `
  * [x] `new` (only for arrays)
* [ ] Conditional expressions.
  * [ ] `&&` 
  * [ ] `||`
  * [x] `<` 
  * [x] `>`
  * [x] `>=` 
  * [x] `<=`
  * [x] `==` 
  * [x] `!=`
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
  * [ ] `return`
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