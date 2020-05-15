#pragma once

#include <functional>
#include "asm/Asm.h"
#include "ast/Ast.h"
#include "../log/Log.h"
#include "class/Class.h"


namespace stc
{
using std::function;
using std::to_string;

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
    void unEat();

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


    Node* functionCall()
    {
        auto functionName = eat(TokenType::IDENTIFIER);

        eat(TokenType::LPAR);

        auto argumentExpressionListNode = argumentExpressionList();

        eat(TokenType::RPAR);

        return new Node(NodeType::FUNCTION_CALL, functionName, argumentExpressionListNode);
    }


    Node* classStatement()
    {
        eat(TokenType::CLASS);

        auto className = eat(TokenType::IDENTIFIER);

        auto bodyNode = classCompoundStatement();

        return new Node(NodeType::CLASS_IMPLEMENTATION, className, bodyNode);
    }

    Node* classCompoundStatement()
    {
        eat(TokenType::LBRA);

        Node* tempNode = nullptr;

        while (!tryEat(TokenType::RBRA))
        {
            auto classBodyStatementNode = classBodyStatement();
            tempNode = new Node(NodeType::STATEMENT_LIST, "", tempNode, classBodyStatementNode);
        }
        skip();

        tempNode = new Node(NodeType::STATEMENT, 0, tempNode);

        return tempNode;
    }

    Node* classBodyStatement()
    {
        if (tryEat(TokenType::CONSTRUCTOR))
        {
            auto constructorStatementNode = functionStatement();
            auto visibilityModifierNode = new Node(NodeType::CLASS_FIELD_VISIBILITY, ClassVisibilityModifier::PUBLIC);

            return new Node(NodeType::CLASS_IMPLEMENTATION_FUNCTION, 0, constructorStatementNode, visibilityModifierNode);
        }
        else
        {
            Node* blockNode = nullptr;

            auto hasStaticModifier = tryEat(TokenType::STATIC);

            if (hasStaticModifier)
                skip();

            auto hasVisibilityModifier = tryEat([](TokenType type){ return Token::isVisibilityModifier(type); });

            if (hasVisibilityModifier)
                skip();


            if (hasStaticModifier && hasVisibilityModifier)
                error("Visibility modifier must precede 'static' modifier");


            if (!hasStaticModifier && hasVisibilityModifier)
            {
                hasStaticModifier = tryEat(TokenType::STATIC);

                if (hasStaticModifier)
                    skip();
            }


            auto identifier = eat(TokenType::IDENTIFIER);


            if (tryEat(TokenType::COLON))
            {
                unEat();
                if (hasVisibilityModifier)
                    unEat();
                if (hasStaticModifier)
                    unEat();

                return classBodyFieldDeclarationStatement();
            }
            else if (tryEat(TokenType::LPAR))
            {
                unEat();
                if (hasVisibilityModifier)
                    unEat();
                if (hasStaticModifier)
                    unEat();

                return classBodyFunctionDeclarationStatement();
            }

            return blockNode;
        }
    }

    Node* classBodyStaticModifierStatement()
    {
        if (tryEat(TokenType::STATIC))
        {
            skip();
            return new Node(NodeType::CLASS_FIELD_STATIC);
        }

        return nullptr;
    }

    Node* classBodyFieldVisibilityModifierStatement()
    {
        auto visibilityModifier = ClassVisibilityModifier::PUBLIC;

        if (tryEat([](TokenType type){ return Token::isVisibilityModifier(type); }))
        {
            auto visibilityModifierString = eat();
            skip();
            visibilityModifier = Class::modifierFromString(visibilityModifierString);
        }

        return new Node(NodeType::CLASS_FIELD_VISIBILITY, visibilityModifier);
    }

    Node* classBodyFieldDeclarationStatement()
    {
        auto visibilityModifierNode = classBodyFieldVisibilityModifierStatement();
        auto staticModifierNode = classBodyStaticModifierStatement();


        auto fieldName = eat(TokenType::IDENTIFIER);

        auto declarationTypeNode = declarationType();

        eat(TokenType::SEMICOLON);

        return new Node(NodeType::CLASS_IMPLEMENTATION_FIELD, fieldName, declarationTypeNode, visibilityModifierNode, staticModifierNode);
    }

    Node* classBodyFunctionDeclarationStatement()
    {
        auto visibilityModifierNode = classBodyFieldVisibilityModifierStatement();
        auto staticModifierNode = classBodyStaticModifierStatement();

        auto functionDeclarationNode = functionStatement();

        return new Node(NodeType::CLASS_IMPLEMENTATION_FUNCTION, 0, functionDeclarationNode, visibilityModifierNode, staticModifierNode);
    }


};


}

