#pragma once
#define NO_DEBUG_INFO

#include <functional>
#include "asm/asm.h"
#include "class/class.h"


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
        ~Parser();

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

        void unEat();

    private: // grammar functions
        Node* primary_expression();
        Node* parenthesized_expression();
        Node* postfix_expression();

        Node* argument_expression_list();

        Node* unary_expression();
        Node* multiplicative_expression();
        Node* additive_expression();
        Node* relational_expression();
        Node* equality_expression();
        Node* logical_and_expression();
        Node* logical_or_expression();
        Node* conditional_expression();
        Node* assignment_expression();
        Node* expression();
        Node* constant_expression();


        Node* statement();
        Node* compound_statement();
        Node* statement_list();
        Node* expression_statement();
        Node* selection_statement();
        Node* iteration_statement();

        Node* declaration_type();
        Node* declaration_statement();

        Node* initializer();
        Node* initializer_list();

        Node* function_argument();
        Node* function_argument_list();
        Node* function_statement();

        Node* operator_statement();


        Node* primaryExpression()
        {
            if (tryEat(TokenType::NUMBER_CONST))
            {
                auto value = eat(TokenType::NUMBER_CONST);
                auto number = stold(value);

                return new Node(NodeType::NUMBER_CONST, number);
            }
            else if (tryEat(TokenType::STRING_CONST))
            {
                auto value = eat(TokenType::STRING_CONST);

                return new Node(NodeType::STRING_CONST, value);
            }
            else if (tryEat(TokenType::TRUE))
            {
                eat(TokenType::TRUE);

                return new Node(NodeType::BOOLEAN_CONST, 1);
            }
            else if (tryEat(TokenType::FALSE))
            {
                eat(TokenType::FALSE);

                return new Node(NodeType::BOOLEAN_CONST, 0);
            }
            else if (tryEat(TokenType::IDENTIFIER))
            {
                auto name = eat(TokenType::IDENTIFIER);

                return new Node(NodeType::USING_VARIABLE, name);
            }
            else if (tryEat(TokenType::LPAR))
            {
                return parenthesized_expression();
            }
            else if (tryEat(TokenType::LSQR))
            {
                return initializer();
            }
            else if (tryEat(TokenType::LET) || tryEat(TokenType::CONST))
            {
                return declaration_statement();
            }
            else if (tryEat(TokenType::NEW))
            {
                return operator_statement();
            }
            else if (tryEat(TokenType::THIS))
            {
                eat(TokenType::THIS);
                return new Node(NodeType::CLASS_THIS);
            }

            return nullptr;
        }

        Node* postfixExpression()
        {
            auto tempNode = primaryExpression();

            if (tryEat(TokenType::LSQR))
            {
                eat(TokenType::LSQR);

                auto tempExpression = expression();

                eat(TokenType::RSQR);

                return new Node(NodeType::INDEX_CAPTURE, 0, tempNode, tempExpression);
            }
            else if (tryEat(TokenType::LPAR))
            {
                eat(TokenType::LPAR);

                auto functionName = any_cast<string>(tempNode->value);
                auto argumentExpressionList = argument_expression_list();

                eat(TokenType::RPAR);

                return new Node(NodeType::FUNCTION_CALL, functionName, argumentExpressionList);
            }
            else if (tryEat(TokenType::POINT))
            {
                eat(TokenType::POINT);
                auto postfixExpressionNode = postfixExpression();

                return new Node(NodeType::CLASS_ACCESS_TO_FIELD, 0, tempNode, postfixExpressionNode);
            }

            return tempNode;
        }

        Node* declarationTypeStatement()
        {
            auto fieldTypeString = eat([](TokenType type){ return Token::is_this_type_is_type_of_variable(type); });
            auto isArray = false;

            if (tryEat(TokenType::LSQR))
            {
                eat(TokenType::LSQR);

                isArray = true;

                eat(TokenType::RSQR);
            }

            Type declarationType(fieldTypeString, isArray);

            return new Node(NodeType::DECLARATION_TYPE, declarationType);
        }

        Node* compoundStatement()
        {
            m_lexer->nextToken();

            Node* tempNode = statement_list();

            return tempNode;
        }



        Node* functionDeclarationStatement()
        {
            auto functionName = tryEat(TokenType::IDENTIFIER) ?
                                            eat(TokenType::IDENTIFIER) :
                                                tryEat(TokenType::CONSTRUCTOR) ?
                                                    eat(TokenType::CONSTRUCTOR) :
                                                        eat(TokenType::IDENTIFIER);

            auto functionArgumentsNode = functionDeclarationArgumentsStatement();

            auto returnTypeNode = new Node(NodeType::DECLARATION_TYPE, Type(FundamentalType::VOID));

            if (tryEat(TokenType::COLON))
            {
                eat(TokenType::COLON);
                returnTypeNode = declarationTypeStatement();
            }

            auto functionBody = compoundStatement();

            auto functionNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_NEW, functionName, functionArgumentsNode, returnTypeNode, functionBody);

            return new Node(NodeType::STATEMENT, 0, functionNode);
        }

        Node* functionDeclarationArgumentStatement()
        {
            auto argumentName = eat(TokenType::IDENTIFIER);
            eat(TokenType::COLON);

            auto declarationTypeNode = declarationTypeStatement();

            return new Node(NodeType::FUNCTION_IMPLEMENTATION_NEW_ARG, argumentName, declarationTypeNode);
        }

        Node* functionDeclarationArgumentsStatement()
        {
            Node* tempNode = nullptr;

            eat(TokenType::LPAR);

            while (!tryEat(TokenType::RPAR))
            {
                auto functionArgumentNode = functionDeclarationArgumentStatement();

                tempNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_NEW_ARGS, "", tempNode, functionArgumentNode);

                if (tryEat(TokenType::COMMA))
                    m_lexer->nextToken();
            }

            eat(TokenType::RPAR);

            return tempNode;
        }



        Node* classStatement()
        {
            eat(TokenType::CLASS);

            auto className = eat(TokenType::IDENTIFIER);

            auto bodyNode = classCompoundStatement();

            return new Node(NodeType::CLASS, className, bodyNode);
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
            m_lexer->nextToken();


            return tempNode;
        }

        Node* classBodyStatement()
        {
            if (tryEat(TokenType::CONSTRUCTOR))
            {
                auto constructorStatementNode = functionDeclarationStatement();

                return new Node(NodeType::CLASS_FUNCTION, 0, constructorStatementNode);
            }
            else
            {
                Node* blockNode = nullptr;

                auto hasVisibilityModifier = tryEat([](TokenType type){ return Token::isVisibilityModifier(type); });

                if (hasVisibilityModifier)
                    eat([](TokenType type){ return Token::isVisibilityModifier(type); });

                auto identifier = eat(TokenType::IDENTIFIER);


                if (tryEat(TokenType::COLON))
                {
                    unEat();
                    if (hasVisibilityModifier)
                        unEat();

                    return classBodyFieldDeclarationStatement();
                }
                else if (tryEat(TokenType::LPAR))
                {
                    unEat();
                    if (hasVisibilityModifier)
                        unEat();

                    return classBodyFunctionDeclarationStatement();
                }

                return blockNode;
            }
        }

        Node* classBodyFieldVisibilityModifierStatement()
        {
            auto visibilityModifier = ClassVisibilityModifier::PUBLIC;

            if (tryEat([](TokenType type){ return Token::isVisibilityModifier(type); }))
            {
                auto visibilityModifierString = eat();
                m_lexer->nextToken();
                visibilityModifier = Class::modifierFromString(visibilityModifierString);
            }

            return new Node(NodeType::CLASS_FIELD_VISIBILITY, visibilityModifier);
        }

        Node* classBodyFieldDeclarationStatement()
        {
            auto visibilityModifierNode = classBodyFieldVisibilityModifierStatement();

            auto fieldName = eat(TokenType::IDENTIFIER);
            eat(TokenType::COLON);

            auto declarationTypeNode = declarationTypeStatement();

            eat(TokenType::SEMICOLON);

            return new Node(NodeType::CLASS_FIELD, fieldName, visibilityModifierNode, declarationTypeNode);
        }

        Node* classBodyFunctionDeclarationStatement()
        {
            auto visibilityModifierNode = classBodyFieldVisibilityModifierStatement();

            auto functionDeclarationNode = functionDeclarationStatement();

            return new Node(NodeType::CLASS_FUNCTION, 0, visibilityModifierNode, functionDeclarationNode);
        }



        Node* interfaceStatement()
        {
            eat(TokenType::INTERFACE);

            auto interfaceName = eat(TokenType::IDENTIFIER);

            auto bodyNode = interfaceCompoundStatement();

            return new Node(NodeType::INTERFACE_IMPLEMENTATION, interfaceName, bodyNode);
        }

        Node* interfaceCompoundStatement()
        {
            eat(TokenType::LBRA);

            Node* tempNode = nullptr;

            while (!tryEat(TokenType::RBRA))
            {
                auto interfaceBodyStatementNode = interfaceBodyStatement();
                tempNode = new Node(NodeType::STATEMENT_LIST, "", tempNode, interfaceBodyStatementNode);
            }
            m_lexer->nextToken();


            return tempNode;
        }

        Node* interfaceBodyStatement()
        {
            return interfaceBodyFunctionDeclarationStatement();
        }

        Node* interfaceBodyFunctionDeclarationStatement()
        {
            auto functionName = eat(TokenType::IDENTIFIER);

            auto functionArgumentsNode = functionDeclarationArgumentsStatement();

            auto returnTypeNode = new Node(NodeType::DECLARATION_TYPE, Type(FundamentalType::VOID));

            if (tryEat(TokenType::COLON))
            {
                eat(TokenType::COLON);
                returnTypeNode = declarationTypeStatement();
            }

            eat(TokenType::SEMICOLON);

            return new Node(NodeType::INTERFACE_FUNCTION_DEFINITION, functionName, functionArgumentsNode, returnTypeNode);
        }

    };


}

