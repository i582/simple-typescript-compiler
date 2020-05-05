#pragma once

#include <functional>
#include "asm/Asm.h"


namespace stc
{
using std::function;

class Parser
{

private:
    Lexer* m_lexer;
    Ast* m_tree;


public:
    explicit Parser(Lexer* lexer);

public:
    void parse();
    void check();
    void printTree();
    Ast* ast();

private:
    void error(const string& message);


    string eat(TokenType type, bool shift = true);
    bool tryEat(TokenType type);

    string eat(const function<bool(TokenType)>& predicate, bool shift = true);
    bool tryEat(const function<bool(TokenType)>& predicate);

    string eat();
    void skip();

    TokenType eatType();
    TokenType eatType(const function<bool(TokenType)>& predicate);


private:
    Node* primaryExpression();
    Node* parenthesizedExpression();
    Node* postfixExpression();

    Node* argumentExpressionList();

    Node* unaryExpression();
    Node* multiplicativeExpression();
    Node* additiveExpression();
    Node* relationalExpression();
    Node* equalityExpression();
    Node* logicalAndExpression();
    Node* logicalOrExpression();
    Node* assignmentExpression();
    Node* expression();



    Node* statement();
    Node* compoundStatement();
    Node* statementList();
    Node* expressionStatement();
    Node* selectionStatement();
    Node* iterationStatement();

    Node* declarationType();
    Node* declarationStatement();

    Node* initializer();
    Node* initializerList();

    Node* functionArgument();
    Node* functionArgumentList();
    Node* functionStatement();

    Node* operatorStatement();


    Node* declareFunctionStatement();


    Node* importList();
    Node* importStatement();

    Node* exportList();
    Node* exportStatement();
};


}

