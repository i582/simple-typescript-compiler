#pragma once

#include <functional>
#include "asm/asm.h"
#include "ast/Ast.h"
#include "../log/Log.h"
#include "class/Class.h"

#include "../report/reports.h"

namespace stc
{
using std::function;
using std::to_string;

class Parser
{

private:
    Lexer2* m_lexer;
    Ast* m_tree;


public:
    explicit Parser(Lexer2* lexer);

public:
    void parse();
    void check();
    void printTree();
    _NODISCARD Ast* ast();

private:
    void report(Node* node, ReportLevel level, const string& name, const string& message);



    Token eat(TokenType type, bool shift = true);
    bool tryEat(TokenType type);

    Token eat(const function<bool(TokenType)>& predicate, bool shift = true);
    bool tryEat(const function<bool(TokenType)>& predicate);

    Token eat();
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
            {
                auto token = eat();
                auto tempNode = Node(NodeType::CONSTANT_DECLARATION);
                tempNode.position(token.position());

                report(&tempNode, ReportLevel::FatalError, "errorVisibilityModifier", "Visibility modifier must precede 'static' modifier");
            }


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
            auto visibilityModifierString = eat().lexeme();
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




    Node* interfaceStatement()
    {
        eat(TokenType::INTERFACE);

        const auto interfaceName = eat(TokenType::IDENTIFIER);

        const auto bodyNode = interfaceCompoundStatement();

        return new Node(NodeType::INTERFACE_IMPLEMENTATION, interfaceName, bodyNode);
    }

    Node* interfaceCompoundStatement()
    {
        eat(TokenType::LBRA);

        auto tempNode = (Node*)nullptr;

        while (!tryEat(TokenType::RBRA))
        {
            const auto interfaceBodyStatementNode = interfaceBodyStatement();
            tempNode = new Node(NodeType::STATEMENT_LIST, "", tempNode, interfaceBodyStatementNode);
        }
        skip();

        return new Node(NodeType::STATEMENT, 0, tempNode);
    }

    Node* interfaceBodyStatement()
    {
        const auto identifier = eat(TokenType::IDENTIFIER);


        if (tryEat(TokenType::COLON))
        {
            unEat();

            return interfaceBodyFieldDeclarationStatement();
        }
        else if (tryEat(TokenType::LPAR))
        {
            unEat();

            return interfaceBodyFunctionDeclarationStatement();
        }

        return nullptr;
    }

    Node* interfaceBodyFieldDeclarationStatement()
    {
        const auto fieldName = eat(TokenType::IDENTIFIER);

        const auto declarationTypeNode = declarationType();

        eat(TokenType::SEMICOLON);

        return new Node(NodeType::INTERFACE_FIELD_DEFINITION, fieldName, declarationTypeNode);
    }

    Node* interfaceBodyFunctionDeclarationStatement()
    {
        const auto functionName = eat(TokenType::IDENTIFIER);
        const auto functionArgumentsNode = functionArgumentList();

        auto returnTypeNode = new Node(NodeType::DECLARATION_TYPE, Type("void"));

        if (tryEat(TokenType::COLON))
        {
            returnTypeNode = declarationType();
        }
        eat(TokenType::SEMICOLON);


        return new Node(NodeType::INTERFACE_FUNCTION_DEFINITION, functionName, returnTypeNode, functionArgumentsNode);
    }

};


}

