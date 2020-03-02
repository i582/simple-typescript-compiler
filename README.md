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
* [x] `a++`
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

* [x] The absence of a variable with this name in the current program scope.
* [x] Assignment to constants.
* [x] Uninitialized constants.
* [x] A function call with the wrong type or number of parameters.
* [x] Uninitialized arrays.
* [x] Incorrect assignment to an array.
* [x] Validation of assignments.
* [x] Type checking for operands.

## Code generation

* [x] Assignment expressions.
* [x] Arithmetic expressions.
* [ ] Conditional expressions.
* [ ] `if`
* [ ] `else`
* [ ] `else if`
* [ ] `while`
* [ ] `for`
* [ ] `functions`
* [ ] `std functions`
  * [x] `std input` (only for number for now)
  * [x] `std print`(only for number for now)
  * [ ] `std sqrt`
  * [ ] `std to_string`

### Optimizations

* [ ] Replacing an arithmetic action with constants with a constant with the result of this action.