#include "Parser.h"

stc::Parser::Parser(Lexer* lexer)
{
    this->m_lexer = lexer;
    this->m_tree = new Ast(m_lexer->filePath());
}


void stc::Parser::error(const std::string& message)
{
    auto fullMessage = "Parse error: " + message + "\n" +
            "Current token: '" + m_lexer->currentToken().lexeme() + "' (" +
                                 to_string(m_lexer->currentToken().line()) + ", " +
                                 to_string(m_lexer->currentToken().pos()) + ")" + "\n";




    //m_lexer->printCurrentTokenLine();

    throw std::logic_error(fullMessage);
}

void stc::Parser::parse()
{
    cout << "-- Started construction of the abstract syntax tree" << endl;

    Node* statementNode = statement();
    m_tree->m_root = new Node(NodeType::PROGRAM, 0, statementNode);

    cout << "-- Construction of the abstract syntax tree done" << endl;
}


void stc::Parser::check()
{
    cout << "-- Started semantic correctness checks" << endl;

    cout << "-- Started import processing" << endl;
    m_tree->checkImports();
    m_tree->handleImports();
    cout << "-- Import processing done" << endl;


    cout << "-- Started analysis preparation" << endl;
    m_tree->identifyBlocks();

    m_tree->markAllScopes();

   // m_tree->deduceVariableType();

    m_tree->identifyVariables();
    m_tree->identifyGlobalVariables();

    m_tree->identifyArrays();

    m_tree->addImportVariables();

    m_tree->identifyFunctions();
    m_tree->markBreakContinueOperators();
    m_tree->markReturnOperator();
    cout << "-- Analysis preparation done" << endl;


    cout << "-- Started constant verification" << endl;
    m_tree->checkConstant();
    cout << "-- Constant verification done" << endl;

    cout << "-- Started array verification" << endl;
    m_tree->checkArray();
    cout << "-- Array verification done" << endl;

    cout << "-- Started functions call verification" << endl;
    m_tree->checkFunctionsCall();
    cout << "-- Functions call verification done" << endl;

    cout << "-- Started expression verification" << endl;
    m_tree->checkExpression();
    cout << "-- Expression verification done" << endl;


    cout << "-- Started export verification" << endl;
    m_tree->checkExports();
    m_tree->handleExports();
    cout << "-- Export verification done" << endl;

    cout << "-- Semantic correctness checks done" << endl;
}

void stc::Parser::printTree()
{
    m_tree->print();
    m_tree->printVariableTable();
    m_tree->printFunctionsTable();
    m_tree->printImportVariableTable();
    m_tree->printImportFunctionsTable();
}

stc::Ast* stc::Parser::ast()
{
    return m_tree;
}

stc::Node* stc::Parser::primaryExpression()
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
        return parenthesizedExpression();
    }
    else if (tryEat(TokenType::LSQR))
    {
        return initializer();
    }
    else if (tryEat(TokenType::LET) || tryEat(TokenType::CONST))
    {
        return declarationStatement();
    }
    else if (tryEat(TokenType::NEW))
    {
        return operatorStatement();
    }


    return nullptr;
}

stc::Node* stc::Parser::parenthesizedExpression()
{
    eat(TokenType::LPAR);

    auto tempNode = expression();

    eat(TokenType::RPAR);

    return tempNode;
}

stc::Node* stc::Parser::postfixExpression()
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
        auto argumentExpressionListNode = argumentExpressionList();

        eat(TokenType::RPAR);

        return new Node(NodeType::FUNCTION_CALL, functionName, argumentExpressionListNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::argumentExpressionList()
{
    Node* tempNode = nullptr;

    while (!tryEat(TokenType::RPAR))
    {
        auto tempFunctionArgument = assignmentExpression();

        tempNode = new Node(NodeType::FUNCTION_ARGS, 0, tempFunctionArgument, tempNode);

        if (tryEat(TokenType::COMMA))
        {
            skip();
        }
    }

    return tempNode;
}

stc::Node* stc::Parser::unaryExpression()
{
    if (tryEat(TokenType::INC))
    {
        skip();
        auto unaryExpressionNode = unaryExpression();
        return new Node(NodeType::BEFORE_INC, 0, unaryExpressionNode);
    }
    else if (tryEat(TokenType::DEC))
    {
        skip();
        auto unaryExpressionNode = unaryExpression();
        return new Node(NodeType::BEFORE_DEC, 0, unaryExpressionNode);
    }
    else if (tryEat([](TokenType type){ return Token::isUnaryOperator(type); }))
    {
        auto type = NodeType::UNARY_PLUS;

        if (tryEat(TokenType::MINUS))
        {
            type = NodeType::UNARY_MINUS;
        }
        else if (tryEat(TokenType::EXCLAMATION))
        {
            type = NodeType::UNARY_EXCLAMATION;
        }

        skip();
        auto unaryExpressionNode = unaryExpression();
        return new Node(type, 0, unaryExpressionNode);
    }

    return postfixExpression();
}

stc::Node* stc::Parser::multiplicativeExpression()
{
    auto tempNode = unaryExpression();


    if (tryEat(TokenType::STAR) || tryEat(TokenType::SLASH))
    {
        auto tempType = NodeType::MUL;

        if (tryEat(TokenType::SLASH))
        {
            tempType = NodeType::DIV;
        }

        skip();

        auto multiplicativeNode = multiplicativeExpression();

        return new Node(tempType, 0, tempNode, multiplicativeNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::additiveExpression()
{
    auto tempNode = multiplicativeExpression();

    if (tryEat(TokenType::PLUS) || tryEat(TokenType::MINUS))
    {
        auto tempType = NodeType::ADD;

        if (tryEat(TokenType::MINUS))
        {
            tempType = NodeType::SUB;
        }

        skip();

        auto additiveNode = additiveExpression();

        return new Node(tempType, 0, tempNode, additiveNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::relationalExpression()
{
    auto tempNode = additiveExpression();

    if (tryEat(TokenType::LESS))
    {
        skip();
        auto additiveExpressionNode = additiveExpression();

        return new Node(NodeType::LESS, 0, tempNode, additiveExpressionNode);
    }
    else if (tryEat(TokenType::GREATER))
    {
        skip();
        auto additiveExpressionNode = additiveExpression();

        return new Node(NodeType::GREATER, 0, tempNode, additiveExpressionNode);
    }
    else if (tryEat(TokenType::GREATER_EQUAL))
    {
        skip();
        auto additiveExpressionNode = additiveExpression();

        return new Node(NodeType::GREATER_EQUAL, 0, tempNode, additiveExpressionNode);
    }
    else if (tryEat(TokenType::LESS_EQUAL))
    {
        skip();
        auto additiveExpressionNode = additiveExpression();

        return new Node(NodeType::LESS_EQUAL, 0, tempNode, additiveExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::equalityExpression()
{
    auto tempNode = relationalExpression();

    if (tryEat(TokenType::EQUAL))
    {
        skip();
        auto relationalExpressionNode = relationalExpression();

        return new Node(NodeType::EQUAL, 0, tempNode, relationalExpressionNode);
    }
    else if (tryEat(TokenType::NOT_EQUAL))
    {
        skip();
        auto relationalExpressionNode = relationalExpression();

        return new Node(NodeType::NOT_EQUAL, 0, tempNode, relationalExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::logicalAndExpression()
{
    auto tempNode = equalityExpression();

    if (tryEat(TokenType::AND))
    {
        skip();
        auto logicalAndExpressionNode = logicalAndExpression();

        return new Node(NodeType::LOGICAL_AND, 0, tempNode, logicalAndExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::logicalOrExpression()
{
    auto tempNode = equalityExpression();

    if (tryEat(TokenType::OR))
    {
        skip();
        auto logicalOrExpressionNode = logicalOrExpression();

        return tempNode = new Node(NodeType::LOGICAL_OR, 0, tempNode, logicalOrExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::assignmentExpression()
{
    Node* tempNode = logicalOrExpression();

    if (tryEat([](TokenType type){ return Token::isAssignmentOperator(type); }))
    {
        auto currentTokenType = eatType();
        auto tempAssignmentExpression = assignmentExpression();

        if (currentTokenType == TokenType::ASSIGN)
        {
            return new Node(NodeType::SET, 0, tempNode, tempAssignmentExpression);
        }
        else if (currentTokenType == TokenType::ADD_ASSIGN)
        {
            auto addNode = new Node(NodeType::ADD, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, addNode);
        }
        else if (currentTokenType == TokenType::SUB_ASSIGN)
        {
            auto subNode = new Node(NodeType::SUB, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, subNode);
        }
        else if (currentTokenType == TokenType::MUL_ASSIGN)
        {
            auto mulNode = new Node(NodeType::MUL, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, mulNode);
        }
        else if (currentTokenType == TokenType::DIV_ASSIGN)
        {
            auto divNode = new Node(NodeType::DIV, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, divNode);
        }
    }

    return tempNode;
}

stc::Node* stc::Parser::expression()
{
    auto tempNode = assignmentExpression();

    return new Node(NodeType::EXPRESSION, 0, tempNode);
}

stc::Node* stc::Parser::statement()
{
    Node* tempNode = nullptr;

    if (tryEat(TokenType::LBRA))
    {
        return compoundStatement();
    }
    else if (tryEat(TokenType::IF))
    {
        return selectionStatement();
    }
    else if (tryEat(TokenType::WHILE) ||
             tryEat(TokenType::DO_WHILE) ||
             tryEat(TokenType::FOR))
    {
        tempNode = iterationStatement();
    }
    else if (tryEat(TokenType::FUNCTION))
    {
        skip();
        tempNode = functionStatement();
    }
    else if (tryEat(TokenType::RETURN) ||
            tryEat(TokenType::BREAK) ||
            tryEat(TokenType::CONTINUE))
    {
        return operatorStatement();
    }
    else if (tryEat(TokenType::DECLARE))
    {
        tempNode = declareFunctionStatement();
    }
    else if (tryEat(TokenType::IMPORT))
    {
        return importStatement();
    }
    else if (tryEat(TokenType::EXPORT))
    {
        return exportStatement();
    }
    else
    {
        return expressionStatement();
    }

    tempNode = new Node(NodeType::STATEMENT, 0, tempNode);

    return tempNode;
}

stc::Node* stc::Parser::compoundStatement()
{
    skip();
    return statementList();
}

stc::Node* stc::Parser::statementList()
{
    Node* tempNode = nullptr;

    while (!tryEat(TokenType::RBRA))
    {
        auto statementNode = statement();
        tempNode = new Node(NodeType::STATEMENT_LIST, 0, tempNode, statementNode);
    }
    skip();

    return new Node(NodeType::STATEMENT, 0, tempNode);
}

stc::Node* stc::Parser::expressionStatement()
{
    auto tempNode = expression();

    eat(TokenType::SEMICOLON);

    return tempNode;
}

stc::Node* stc::Parser::selectionStatement()
{
    skip();

    auto conditionNode = parenthesizedExpression();
    auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());
    auto elseNode = (Node*)nullptr;
    auto nodeType = NodeType::IF;

    if (tryEat(TokenType::ELSE))
    {
        nodeType = NodeType::IF_ELSE;
        skip();

        elseNode = statement();
    }

    return new Node(nodeType, 0, conditionNode, bodyNode, elseNode);
}

stc::Node* stc::Parser::iterationStatement()
{
    if (tryEat(TokenType::WHILE))
    {
        skip();

        auto conditionNode = parenthesizedExpression();
        auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());

        return new Node(NodeType::WHILE, 0, conditionNode, bodyNode);
    }
    else if (tryEat(TokenType::DO_WHILE))
    {
        skip();

        auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());
        eat(TokenType::WHILE);
        auto conditionNode = parenthesizedExpression();

        return new Node(NodeType::DO_WHILE, 0, conditionNode, bodyNode);
    }
    else if (tryEat(TokenType::FOR))
    {
        skip();

        eat(TokenType::LPAR);
        auto variableNode = expression();
        eat(TokenType::SEMICOLON);
        auto conditionNode = expression();
        eat(TokenType::SEMICOLON);
        auto actionNode = expression();
        eat(TokenType::RPAR);
        auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());


        return new Node(NodeType::FOR, 0, variableNode, conditionNode, actionNode, bodyNode);
    }

    return nullptr;
}

stc::Node* stc::Parser::declarationStatement()
{
    auto isConst = tryEat(TokenType::CONST);
    skip();
    auto variableName = eat(TokenType::IDENTIFIER);

    auto declarationTypeNode = (Node*)nullptr;

    if (tryEat(TokenType::COLON))
    {
        declarationTypeNode = declarationType();
    }
    else if (tryEat(TokenType::ASSIGN))
    {
        declarationTypeNode = nullptr;
    }
    else
    {
        error("Expected variable type or assignment to expression.");
    }



    return new Node(isConst ? NodeType::CONSTANT_DECLARATION : NodeType::VARIABLE_DECLARATION, variableName, declarationTypeNode);
}

stc::Node* stc::Parser::declarationType()
{
    eat(TokenType::COLON);
    auto variableType = eatType([](TokenType type){ return Token::isThisTypeIsVariableType(type); });


    if (tryEat(TokenType::LSQR))
    {
        auto currentType = (int)variableType;
        auto newArrayType = TokenType(currentType << 4);

        skip();
        eat(TokenType::RSQR);

        variableType = newArrayType;
    }

    return new Node(NodeType::VARIABLE_TYPE, variableType);
}

stc::Node* stc::Parser::initializer()
{
    Node* tempNode = nullptr;

    skip();
    while (!tryEat(TokenType::RSQR))
    {
        auto initializerListNode = initializerList();
        tempNode = new Node(NodeType::INITIALIZER_LIST, 0, tempNode, initializerListNode);
    }
    skip();

    return new Node(NodeType::INITIALIZER, 0, tempNode);
}

stc::Node* stc::Parser::initializerList()
{
    if (tryEat(TokenType::COMMA))
    {
        skip();
        return initializerList();
    }
    else
    {
        return assignmentExpression();
    }

}

stc::Node* stc::Parser::functionStatement()
{
    auto functionName = eat(TokenType::IDENTIFIER);
    auto functionArgsNode = functionArgumentList();

    auto functionReturnType = TokenType::VOID;

    if (tryEat(TokenType::COLON))
    {
        eat(TokenType::COLON);
        functionReturnType = eatType([](TokenType type){ return Token::isThisTypeIsVariableType(type); });
    }


    auto functionBodyNode = statement();
    auto functionReturnTypeNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE, functionReturnType);


    return new Node(NodeType::FUNCTION_IMPLEMENTATION, functionName, functionReturnTypeNode,
                        functionArgsNode, functionBodyNode);
}

stc::Node* stc::Parser::functionArgumentList()
{
    Node* tempNode = nullptr;

    eat(TokenType::LPAR);

    while (!tryEat(TokenType::RPAR))
    {
        auto tempFunctionArgument = functionArgument();

        tempNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_ARGS, 0, tempNode, tempFunctionArgument);

        if (tryEat(TokenType::COMMA))
            skip();
    }
    skip();

    return tempNode;
}

stc::Node* stc::Parser::functionArgument()
{
    Node* tempNode = nullptr;

    auto variableName = eat(TokenType::IDENTIFIER);
    auto declarationTypeNode = declarationType();

    tempNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_ARG, variableName, declarationTypeNode);

    return tempNode;
}

stc::Node* stc::Parser::operatorStatement()
{
    if (tryEat(TokenType::RETURN))
    {
        skip();
        auto expressionStatementNode = expressionStatement();

        return new Node(NodeType::RETURN, 0, expressionStatementNode);
    }
    else if (tryEat(TokenType::BREAK))
    {
        skip();
        eat(TokenType::SEMICOLON);

        return new Node(NodeType::BREAK, 0);
    }
    else if (tryEat(TokenType::CONTINUE))
    {
        skip();
        eat(TokenType::SEMICOLON);

        return new Node(NodeType::CONTINUE, 0);
    }
    else if (tryEat(TokenType::NEW))
    {
        skip();
        auto postfixExpressionNode = postfixExpression();
        return new Node(NodeType::NEW, 0, postfixExpressionNode);
    }

    return nullptr;
}

std::string stc::Parser::eat(stc::TokenType type, bool shift)
{
    if (!tryEat(type))
    {
        error(Token::tokenTypeToString(type) + " expected!");
    }

    auto value = m_lexer->currentToken().lexeme();

    if (shift)
    {
        m_lexer->nextToken();
    }

    return value;
}

bool stc::Parser::tryEat(stc::TokenType type)
{
    return m_lexer->currentTokenType() == type;
}

std::string stc::Parser::eat(const std::function<bool(stc::TokenType)>& predicate, bool shift)
{
    auto currentType = m_lexer->currentTokenType();

    if (!predicate(currentType))
    {
        error(to_string((int)currentType) + " expected!");
    }

    auto value = m_lexer->currentToken().lexeme();

    if (shift)
    {
        m_lexer->nextToken();
    }

    return value;
}

bool stc::Parser::tryEat(const std::function<bool(stc::TokenType)>& predicate)
{
    return predicate(m_lexer->currentTokenType());
}

std::string stc::Parser::eat()
{
    auto value = m_lexer->currentToken().lexeme();
    return value;
}

void stc::Parser::skip()
{
    m_lexer->nextToken();
}

stc::TokenType stc::Parser::eatType()
{
    auto value = m_lexer->currentToken().type();
    m_lexer->nextToken();
    return value;
}

stc::TokenType stc::Parser::eatType(const std::function<bool(stc::TokenType)>& predicate)
{
    auto currentType = m_lexer->currentTokenType();

    if (!predicate(currentType))
    {
        error(to_string((int)currentType) + " expected!");
    }

    auto value = m_lexer->currentToken().type();

    m_lexer->nextToken();

    return value;
}

stc::Node* stc::Parser::declareFunctionStatement()
{
    skip();
    eat(TokenType::FUNCTION);
    auto functionName = eat(TokenType::IDENTIFIER);
    auto functionArgsNode = functionArgumentList();

    auto functionReturnType = TokenType::VOID;

    if (tryEat(TokenType::COLON))
    {
        eat(TokenType::COLON);
        functionReturnType = eatType([](TokenType type){ return Token::isThisTypeIsVariableType(type); });
    }

    auto functionReturnTypeNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE, functionReturnType);
    auto functionBodyNode = new Node(NodeType::STATEMENT);
    eat(TokenType::SEMICOLON);


    return new Node(NodeType::FUNCTION_IMPLEMENTATION, functionName, functionReturnTypeNode,
                    functionArgsNode, functionBodyNode);
}

stc::Node* stc::Parser::importStatement()
{
    eat(TokenType::IMPORT);

    auto importItemListNode = importList();

    eat(TokenType::FROM);

    auto relativeFilePath = eat(TokenType::STRING_CONST);
    auto relativeFilePathNode = new Node(NodeType::IMPORT_FILE, relativeFilePath);

    auto importNode = new Node(NodeType::IMPORT, 0, importItemListNode, relativeFilePathNode);

    return importNode;
}

stc::Node* stc::Parser::importList()
{
    eat(TokenType::LBRA);

    Node* tempNode = nullptr;
    while (!tryEat(TokenType::RBRA))
    {
        auto importItem = eat(TokenType::IDENTIFIER);
        auto importItemNode = new Node(NodeType::IMPORT_LIST_ELEMENT, importItem);
        tempNode = new Node(NodeType::IMPORT_LIST, 0, importItemNode, tempNode);

        if (tryEat(TokenType::COMMA))
            skip();
    }
    skip();

    return tempNode;
}

stc::Node* stc::Parser::exportList()
{
    eat(TokenType::LBRA);

    Node* tempNode = nullptr;
    while (!tryEat(TokenType::RBRA))
    {
        auto exportItem = eat(TokenType::IDENTIFIER);
        auto exportItemNode = new Node(NodeType::EXPORT_LIST_ELEMENT, exportItem);
        tempNode = new Node(NodeType::EXPORT_LIST, 0, exportItemNode, tempNode);

        if (tryEat(TokenType::COMMA))
            skip();
    }
    skip();

    return tempNode;
}

stc::Node* stc::Parser::exportStatement()
{
    eat(TokenType::EXPORT);

    auto exportItemListNode = exportList();
    auto exportNode = new Node(NodeType::EXPORT, 0, exportItemListNode);

    return exportNode;
}

