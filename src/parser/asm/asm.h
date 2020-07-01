#pragma once
#include <iostream>
#include <string>
#include <chrono>
#include "../../lexer/token/Token.h"
#include "../node/Node.h"
#include "../ast/Ast.h"

#include "asmConstants.h"

namespace stc
{
using std::to_string;
using std::ofstream;


enum class AsmPlaceForWriting
{
    Data,
    BeforeMain,
    FunctionImplementations,
    Main
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



public:
    void generate();


private:
    void blocksToAsm();


    void initLocalVariables();

    void initFunctionArguments();

    void initGlobalFunctions();


    void initStringConstants();
    void initGeneralVariables();


    void initInterfaces();

    void initClassFunctionOrField(Node* currentNode, Class* aClass);

    void initClassFunctionCall(Node* currentNode, Class* aClass);

private:

    void initMemoryManager();
    void freeMemoryManager();

    // AsmGeneralBlocks.cpp
    void setBlockToAsm(Node* currentNode);
    void ifBlockToAsm(Node* currentNode);
    void whileBlockToAsm(Node* currentNode);
    void doWhileBlockToAsm(Node* currentNode);
    void forBlockToAsm(Node* currentNode);
    void functionImplementationToAsm(Node* currentNode);
    void functionCallToAsm(Node* currentNode);
    void returnOperatorToAsm(Node* currentNode);
    void breakOperatorToAsm(Node* currentNode);
    void continueOperatorToAsm(Node* currentNode);


    /**
     * @brief Функция генерирует ассемблерный код для инициализатора вида [...]
     * @param currentNode
     */
    void initializerToAsm(Node* currentNode);
    void initializerElementToAsm(Node* currentNode, size_t initializerSize, size_t& elementIndex);



    void blockToAsmRecursive(Node* currentNode);
    void expressionToAsmRecursive(Node* currentNode);
    void relationExpressionToAsmRecursive(Node* currentNode);
    void functionImplementationRecursive(Node* currentNode);
    void initStringConstantsRecursive(Node* currentNode, size_t& countConstant);

    void initArgumentsOnStackRecursive(Node* currentNode);


    void initGlobalFunctionsRecursive(Node* currentNode);


    void initInterfacesRecursive(Node* currentNode, Class* interface);
    void initInterfaceFunctionRecursive(Node* currentNode, Class* interface);

    void initNumberToString();










    void malloc(const string& value);

    void write(const string& text);

    void setPlaceForWriting(AsmPlaceForWriting place);

    // generic functions
    static string offset(const string& value);

    static string localVar(const string& value);

    static string argumentVar(const string& value);

    void raw(const string& value);



    void stackVariable(const Variable* variable);
    void stackArgument(const Variable* variable);


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
    void logicalOr(const string& value1, const string& value2);
    void logicalAnd(const string& value1, const string& value2);
    void logicalXor(const string& value1, const string& value2);


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

    void procedureProlog(size_t level, size_t sizeLocalVariable);
    void procedureEpilogue();


    // fpu
    void finit();
    void fild(const string& value);
    void fdiv(const string& value1, const string& value2);
    void fist(const string& value);
    void fsqrt();



    void comment(const string& value);
};

}