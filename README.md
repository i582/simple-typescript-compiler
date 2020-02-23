# Simple compailer from TypeScript to Assembler 

![](https://img.shields.io/badge/language-c%2B%2B-brightgreen)

![](docs/ts.png)

## Description

Term paper of the 3rd semester. Simple translator from TypeScript to ASM. TypeScript has been changed and now this language is fully statically typed. With support for a minimum number of parts of the language. 

## Syntax parser

### Operators

* [x] `+`
* [x] `-`
* [x] `/`
* [x] `*`
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
* [x] `void`
* [x] `number[]`

### Other

* [x] Initialization lists for arrays.
* [x] Validation of identifiers.

## Semantic analysis

* [x] The absence of a variable with this name in the current program scope.
* [ ] The absence of functions with this name and semantics in the current place of the program.
* [x] Assignment to constants.
* [x] Uninitialized constants.
* [ ] A function call with the wrong type or number of parameters.
* [x] Uninitialized arrays.
* [x] Incorrect assignment to an array.
* [ ] Assignment to one type of another.

## Code generation

* [ ] Assignment expressions.
* [ ] Arithmetic expressions.
* [ ] Conditional expressions.
* [ ] `if`
* [ ] `else`
* [ ] `else if`
* [ ] `while`
* [ ] `for`
* [ ] functions.

### Optimizations

* [ ] Replacing an arithmetic action with constants with a constant with the result of this action.