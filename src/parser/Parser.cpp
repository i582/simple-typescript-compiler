#include "Parser.h"

stc::Parser::Parser(Lexer2* lexer)
{
    this->m_lexer = lexer;
    this->m_tree = new Ast(lexer, m_lexer->filePath());

}

void stc::Parser::parse()
{
    Log::write("-- Started construction of the abstract syntax tree\n");

    Node* statementNode = statement();
    m_tree->m_root = new Node(NodeType::PROGRAM, 0, statementNode);


    if (!ErrorHandle::reports().empty())
    {
        throw std::logic_error("");
    }

    Log::write("-- Construction of the abstract syntax tree done\n");
}


void stc::Parser::check()
{
    m_tree->analyze();
}

void stc::Parser::printTree()
{

    m_tree->print();
    m_tree->printVariableTable();
    m_tree->printFunctionsTable();
    m_tree->printImportVariableTable();
    m_tree->printImportFunctionsTable();

    m_tree->printClassesTable();

}

stc::Ast* stc::Parser::ast()
{
    return m_tree;
}

stc::Node* stc::Parser::primaryExpression()
{
    if (tryEat(TokenType::NUMBER_CONST))
    {
        const auto token = eat(TokenType::NUMBER_CONST);
        const auto value = token.lexeme();
        const auto number = stold(value);

        const auto resultNode = new Node(NodeType::NUMBER_CONST, number);
        resultNode->position(token.position());

        return resultNode;
    }
    else if (tryEat(TokenType::STRING_CONST))
    {
        const auto token = eat(TokenType::STRING_CONST);
        const auto value = token.lexeme();

        const auto resultNode = new Node(NodeType::STRING_CONST, value);
        resultNode->position(token.position());

        return resultNode;
    }
    else if (tryEat(TokenType::TRUE))
    {
        const auto token = eat(TokenType::TRUE);

        const auto resultNode = new Node(NodeType::BOOLEAN_CONST, 1);
        resultNode->position(token.position());

        return resultNode;
    }
    else if (tryEat(TokenType::FALSE))
    {
        const auto token = eat(TokenType::FALSE);

        const auto resultNode = new Node(NodeType::BOOLEAN_CONST, 0);
        resultNode->position(token.position());

        return resultNode;
    }
    else if (tryEat(TokenType::IDENTIFIER))
    {
        const auto token = eat(TokenType::IDENTIFIER);
        const auto name = token.lexeme();

        const auto resultNode = new Node(NodeType::USING_VARIABLE, name);
        resultNode->position(token.position());

        return resultNode;
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
    else if (tryEat(TokenType::THIS))
    {
        skip();
        return new Node(NodeType::CLASS_THIS);
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

        const auto tempExpression = expression();

        eat(TokenType::RSQR);

        return new Node(NodeType::INDEX_CAPTURE, 0, tempNode, tempExpression);
    }
    else if (tryEat(TokenType::LPAR))
    {
        eat(TokenType::LPAR);

        const auto functionName = any_cast<string>(tempNode->value);
        const auto argumentExpressionListNode = argumentExpressionList();

        eat(TokenType::RPAR);

        return new Node(NodeType::FUNCTION_CALL, functionName, argumentExpressionListNode);
    }
    else if (tryEat(TokenType::POINT))
    {
        skip();
        const auto postfixExpressionNode = postfixExpression();

        return new Node(NodeType::CLASS_ACCESS_TO_FIELD, 0, tempNode, postfixExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::argumentExpressionList()
{
    Node* tempNode = nullptr;

    while (!tryEat(TokenType::RPAR))
    {
        const auto tempFunctionArgument = assignmentExpression();

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
        const auto unaryExpressionNode = unaryExpression();
        return new Node(NodeType::BEFORE_INC, 0, unaryExpressionNode);
    }
    else if (tryEat(TokenType::DEC))
    {
        skip();
        const auto unaryExpressionNode = unaryExpression();
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
        const auto unaryExpressionNode = unaryExpression();
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
        const auto multiplicativeNode = multiplicativeExpression();
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
        const auto additiveNode = additiveExpression();
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
        const auto additiveExpressionNode = additiveExpression();
        return new Node(NodeType::LESS, 0, tempNode, additiveExpressionNode);
    }
    else if (tryEat(TokenType::GREATER))
    {
        skip();
        const auto additiveExpressionNode = additiveExpression();
        return new Node(NodeType::GREATER, 0, tempNode, additiveExpressionNode);
    }
    else if (tryEat(TokenType::GREATER_EQUAL))
    {
        skip();
        const auto additiveExpressionNode = additiveExpression();
        return new Node(NodeType::GREATER_EQUAL, 0, tempNode, additiveExpressionNode);
    }
    else if (tryEat(TokenType::LESS_EQUAL))
    {
        skip();
        const auto additiveExpressionNode = additiveExpression();
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
        const auto relationalExpressionNode = relationalExpression();
        return new Node(NodeType::EQUAL, 0, tempNode, relationalExpressionNode);
    }
    else if (tryEat(TokenType::NOT_EQUAL))
    {
        skip();
        const auto relationalExpressionNode = relationalExpression();
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
        const auto logicalAndExpressionNode = logicalAndExpression();
        return new Node(NodeType::LOGICAL_AND, 0, tempNode, logicalAndExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::logicalOrExpression()
{
    auto tempNode = logicalAndExpression();

    if (tryEat(TokenType::OR))
    {
        skip();
        const auto logicalOrExpressionNode = logicalOrExpression();
        return tempNode = new Node(NodeType::LOGICAL_OR, 0, tempNode, logicalOrExpressionNode);
    }

    return tempNode;
}

stc::Node* stc::Parser::assignmentExpression()
{
    auto tempNode = logicalOrExpression();

    if (tryEat([](TokenType type){ return Token::isAssignmentOperator(type); }))
    {
        const auto currentTokenType = eatType();
        const auto tempAssignmentExpression = assignmentExpression();

        if (currentTokenType == TokenType::ASSIGN)
        {
            return new Node(NodeType::SET, 0, tempNode, tempAssignmentExpression);
        }
        else if (currentTokenType == TokenType::ADD_ASSIGN)
        {
            const  auto addNode = new Node(NodeType::ADD, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, addNode);
        }
        else if (currentTokenType == TokenType::SUB_ASSIGN)
        {
            const auto subNode = new Node(NodeType::SUB, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, subNode);
        }
        else if (currentTokenType == TokenType::MUL_ASSIGN)
        {
            const auto mulNode = new Node(NodeType::MUL, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, mulNode);
        }
        else if (currentTokenType == TokenType::DIV_ASSIGN)
        {
            const auto divNode = new Node(NodeType::DIV, 0, tempNode, tempAssignmentExpression);
            return new Node(NodeType::SET, 0, tempNode, divNode);
        }
    }

    return tempNode;
}

stc::Node* stc::Parser::expression()
{
    const auto tempNode = assignmentExpression();

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
    else if (tryEat(TokenType::CLASS))
    {
        return classStatement();
    }
    else if (tryEat(TokenType::INTERFACE))
    {
        return interfaceStatement();
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
        const auto statementNode = statement();
        tempNode = new Node(NodeType::STATEMENT_LIST, 0, tempNode, statementNode);
    }
    skip();

    return new Node(NodeType::STATEMENT, 0, tempNode);
}

stc::Node* stc::Parser::expressionStatement()
{
    const auto tempNode = expression();

    eat(TokenType::SEMICOLON);

    return tempNode;
}

stc::Node* stc::Parser::selectionStatement() // "if" "(" expression ")" "{"....
{
    skip();

    const auto conditionNode = parenthesizedExpression();
    const auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());
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

        const auto conditionNode = parenthesizedExpression();
        const auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());

        return new Node(NodeType::WHILE, 0, conditionNode, bodyNode);
    }
    else if (tryEat(TokenType::DO_WHILE))
    {
        skip();

        const auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());
        eat(TokenType::WHILE);
        const auto conditionNode = parenthesizedExpression();

        return new Node(NodeType::DO_WHILE, 0, conditionNode, bodyNode);
    }
    else if (tryEat(TokenType::FOR))
    {
        skip();

        eat(TokenType::LPAR);
        const auto variableNode = expression();
        eat(TokenType::SEMICOLON);
        const auto conditionNode = expression();
        eat(TokenType::SEMICOLON);
        const auto actionNode = expression();
        eat(TokenType::RPAR);
        const auto bodyNode = new Node(NodeType::STATEMENT, 0, statement());

        return new Node(NodeType::FOR, 0, variableNode, conditionNode, actionNode, bodyNode);
    }

    return nullptr;
}

stc::Node* stc::Parser::declarationStatement()
{
    const auto isConst = tryEat(TokenType::CONST);
    skip();
    const auto token = eat(TokenType::IDENTIFIER);
    const auto variableName = token.lexeme();

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
        auto tempNode = Node(NodeType::CONSTANT_DECLARATION);
        tempNode.position(token.position());

        report(&tempNode, ReportLevel::FatalError, "typeOrAssignmentExpected", "Expected variable type or assignment to expression");
    }

    const auto resultNode = new Node(isConst ? NodeType::CONSTANT_DECLARATION : NodeType::VARIABLE_DECLARATION, variableName, declarationTypeNode);
    resultNode->position(token.position());

    return resultNode;
}

stc::Node* stc::Parser::declarationType()
{
    eat(TokenType::COLON);

    const auto fieldTypeString = eat([](TokenType type) {
                                    return Token::isThisTypeIsVariableType(type);
                                 }).lexeme();
    auto isArray = false;

    if (tryEat(TokenType::LSQR))
    {
        eat(TokenType::LSQR);

        isArray = true;

        eat(TokenType::RSQR);
    }

    const auto declarationType = Type(fieldTypeString, isArray);

    return new Node(NodeType::DECLARATION_TYPE, declarationType);
}

stc::Node* stc::Parser::initializer()
{
    Node* tempNode = nullptr;

    skip();
    while (!tryEat(TokenType::RSQR))
    {
        const auto initializerListNode = initializerList();
        tempNode = new Node(NodeType::INITIALIZER_LIST_ELEMENT, 0, tempNode, initializerListNode);
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
    const auto functionName = eat([](TokenType type){ return type == TokenType::IDENTIFIER || type == TokenType::CONSTRUCTOR; }).lexeme();
    const auto functionArgsNode = functionArgumentList();
    auto functionReturnType = Type("void");

    if (tryEat(TokenType::COLON))
    {
        const auto declarationNode = declarationType();

        functionReturnType = any_cast<Type>(declarationNode->value);
    }

    const auto functionReturnTypeNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE, functionReturnType);


    const auto functionBodyNode = statement();

    return new Node(NodeType::FUNCTION_IMPLEMENTATION, functionName, functionReturnTypeNode,
                    functionArgsNode, functionBodyNode);
}

stc::Node* stc::Parser::functionArgumentList()
{
    Node* tempNode = nullptr;

    eat(TokenType::LPAR);

    while (!tryEat(TokenType::RPAR))
    {
        const auto tempFunctionArgument = functionArgument();

        tempNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_ARGS, 0, tempNode, tempFunctionArgument);

        if (tryEat(TokenType::COMMA))
            skip();
    }
    skip();

    return tempNode;
}

stc::Node* stc::Parser::functionArgument()
{
    const auto variableName = eat(TokenType::IDENTIFIER).lexeme();
    const auto declarationTypeNode = declarationType();

    if (tryEat(TokenType::ASSIGN))
    {
        skip();

        const auto defaultValueExpressionNode = primaryExpression();
        const auto defaultValueNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_DEFAULT_ARG_VALUE, 0, defaultValueExpressionNode);

        return new Node(NodeType::FUNCTION_IMPLEMENTATION_ARG, variableName, declarationTypeNode, defaultValueNode);
    }

    return new Node(NodeType::FUNCTION_IMPLEMENTATION_ARG, variableName, declarationTypeNode);
}

stc::Node* stc::Parser::operatorStatement()
{
    if (tryEat(TokenType::RETURN))
    {
        const auto token = eat();
        skip();
        const auto expressionStatementNode = expressionStatement();

        const auto result = new Node(NodeType::RETURN, 0, expressionStatementNode);

        result->position(token.position());

        return result;
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

        auto functionCallNode = functionCall();
        return new Node(NodeType::NEW, 0, functionCallNode);
    }

    return nullptr;
}

stc::Token stc::Parser::eat(stc::TokenType type, bool shift)
{
    if (!tryEat(type))
    {
        unEat();
        auto token = eat();
        auto tempNode = Node(NodeType::CONSTANT_DECLARATION);
        tempNode.position(token.position());

        report(&tempNode, ReportLevel::FatalError, "someExpected", "'" + Token::tokenTypeToString(type) + "' expected!");
    }

    auto value = m_lexer->currentToken();

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

stc::Token stc::Parser::eat(const std::function<bool(stc::TokenType)>& predicate, bool shift)
{
    const auto currentType = m_lexer->currentTokenType();

    if (!predicate(currentType))
    {
        unEat();
        auto token = eat();
        auto tempNode = Node(NodeType::CONSTANT_DECLARATION);
        tempNode.position(token.position());

        report(&tempNode, ReportLevel::FatalError, "someExpected", "'" + Token::tokenTypeToString(currentType) + "' expected!");
    }

    auto value = m_lexer->currentToken();

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

stc::Token stc::Parser::eat()
{
    return m_lexer->currentToken();
}

void stc::Parser::skip()
{
    m_lexer->nextToken();
}

void stc::Parser::unEat()
{
    m_lexer->prevToken();
}

stc::TokenType stc::Parser::eatType()
{
    auto value = m_lexer->currentToken().type();
    m_lexer->nextToken();
    return value;
}

stc::TokenType stc::Parser::eatType(const std::function<bool(stc::TokenType)>& predicate)
{
    const auto currentType = m_lexer->currentTokenType();

    if (!predicate(currentType))
    {
        unEat();
        auto token = eat();
        auto tempNode = Node(NodeType::CONSTANT_DECLARATION);
        tempNode.position(token.position());

        report(&tempNode, ReportLevel::FatalError, "someExpected", "'" + Token::tokenTypeToString(currentType) + "' expected!");
    }

    auto value = m_lexer->currentToken().type();

    m_lexer->nextToken();

    return value;
}

stc::Node* stc::Parser::declareFunctionStatement()
{
    skip();
    eat(TokenType::FUNCTION);
    const auto functionName = eat(TokenType::IDENTIFIER).lexeme();
    const auto functionArgsNode = functionArgumentList();
    auto functionReturnType = Type("void");

    if (tryEat(TokenType::COLON))
    {
        const auto declarationNode = declarationType();

        functionReturnType = any_cast<Type>(declarationNode->value);
    }


    const auto functionReturnTypeNode = new Node(NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE, functionReturnType);

    const auto functionBodyNode = new Node(NodeType::STATEMENT);
    eat(TokenType::SEMICOLON);


    return new Node(NodeType::FUNCTION_IMPLEMENTATION, functionName, functionReturnTypeNode,
                    functionArgsNode, functionBodyNode);
}

stc::Node* stc::Parser::importStatement()
{
    const auto token = eat(TokenType::IMPORT);

    const auto importItemListNode = importList();

    eat(TokenType::FROM);

    const auto relativeFilePath = eat(TokenType::STRING_CONST).lexeme();
    const auto relativeFilePathNode = new Node(NodeType::IMPORT_FILE, relativeFilePath);

    const auto importNode = new Node(NodeType::IMPORT, 0, importItemListNode, relativeFilePathNode);

    importNode->position(token.position());

    return importNode;
}

stc::Node* stc::Parser::importList()
{
    eat(TokenType::LBRA);

    Node* tempNode = nullptr;
    while (!tryEat(TokenType::RBRA))
    {
        const auto importItem = eat(TokenType::IDENTIFIER).lexeme();
        const auto importItemNode = new Node(NodeType::IMPORT_LIST_ELEMENT, importItem);
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
        const auto exportItem = eat(TokenType::IDENTIFIER).lexeme();
        const auto exportItemNode = new Node(NodeType::EXPORT_LIST_ELEMENT, exportItem);
        tempNode = new Node(NodeType::EXPORT_LIST, 0, exportItemNode, tempNode);

        if (tryEat(TokenType::COMMA))
            skip();
    }
    skip();

    return tempNode;
}

stc::Node* stc::Parser::exportStatement()
{
    const auto token = eat(TokenType::EXPORT);

    const auto exportItemListNode = exportList();
    const auto exportNode = new Node(NodeType::EXPORT, 0, exportItemListNode);

    exportNode->position(token.position());

    return exportNode;
}

void stc::Parser::report(stc::Node* node, stc::ReportLevel level, const std::string& name, const std::string& message)
{
    ErrorHandle::report(m_lexer, node, level, name, message);
}
