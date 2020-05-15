#pragma once
#include <iostream>
#include <string>
#include <chrono>
#include "../../lexer/token/Token.h"
#include "../node/Node.h"
#include "../ast/Ast.h"

#include "asm_constants.h"

namespace stc
{
using std::to_string;
using std::ofstream;


enum class asm_place_for_writing
{
    DATA,
    BEFORE_MAIN,
    FUNCTION_IMPLEMENTATIONS,
    MAIN
};


class Asm
{
private:
    ofstream m_file;
    Ast* m_ast;

    // blocks
    string m_data;
    string m_beforeMain;
    string m_functionImplementations;
    string m_main;

    string* m_currentPlaceForWriting;


private:
    size_t m_byteOnStack;

public:
    explicit Asm(const string& outputFilePath, Ast* tree);
    ~Asm();


public:
    void generate();


private:
    void blocksToAsm();


    void initLocalVariables();
    void initFunctionArguments();

    void initGlobalFunctions();
    void initGlobalFunction(const string& name);

    void initStringConstants();

    // global functions
    void init_input_function();
    void init_print_function();
    void init_println_function();
    void init_sqrt_function();




    void initOperandsForDivision();


private:
    void blockToAsmRecursive(Node* currentNode);
    void expressionToAsmRecursive(Node* currentNode);
    void relationExpressionToAsmRecursive(Node* currentNode);
    void functionImplementationRecursive(Node* currentNode);
    void initStringConstantsRecursive(Node* currentNode, size_t& countConstant);

    void initArgumentsOnStackRecursive(Node* currentNode);
    void initGlobalFunctionsRecursive(Node* currentNode);



    void write(const string& text);

    void setPlaceForWriting(asm_place_for_writing place);

    // generic functions
    static string offset(const string& value);

    static string local_var(const string& value);

    static string argument_var(const string& value);

    void raw(const string& value);



    void stack_variable(const Variable* variable);
    void stack_argument(const Variable* variable);

    // stack
    void push(const string& value);
    void pop(const string& value);


    // arithmetic operations
    void add(const string& value1, const string& value2);
    void sub(const string& value1, const string& value2);
    void imul(const string& value1, const string& value2);


    // general
    void mov(const string& value1, const string& value2);


    // logical
    void logical_or(const string& value1, const string& value2);
    void logical_and(const string& value1, const string& value2);
    void logical_xor(const string& value1, const string& value2);


    // comparisons
    void cmp(const string& value1, const string& value2);

    void jmp(const string& value);
    void je(const string& value);
    void jne(const string& value);
    void jl(const string& value);
    void jle(const string& value);
    void jg(const string& value);
    void jge(const string& value);

    void label(const string& value);


    // functions
    void call(const string& value);
    void ret(const string& value = "");

    void proc(const string& value);
    void endp(const string& value);

    void procedure_prolog(size_t level, size_t size_local_variable);
    void procedure_epilogue();


    // fpu
    void finit();
    void fild(const string& value);
    void fdiv(const string& value1, const string& value2);
    void fist(const string& value);
    void fsqrt();



    void comment(const string& value);
};

}