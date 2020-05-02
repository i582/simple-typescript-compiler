#include "Parser.h"

stc::Parser::Parser(Lexer* lexer)
{
    m_lexer = lexer;
    m_tree = new Ast();

    m_lexer->split();

#ifndef NO_DEBUG_INFO
    m_lex->print_tokens();
#endif
}

stc::Parser::~Parser()
{
    delete m_tree;
}

void stc::Parser::error(const std::string& message)
{
    cout << "Parse error: " << message << " ";

    cout << "Current token: '" << m_lexer->current_token().lexeme() + "' (" +
                                  std::to_string(m_lexer->current_token().line()) + ", " +
                                  std::to_string(m_lexer->current_token().pos()) + ")"
                                 << endl;

    m_lexer->print_current_token_line();

    throw std::logic_error(message);
}

void stc::Parser::parse()
{
    Node* statementNode = statement();
    m_tree->m_root = new Node(NodeType::PROGRAM, "", statementNode);
}


void stc::Parser::check()
{
    m_tree->identifyScopes();

    m_tree->markAllScopes();

    m_tree->identifyVariables();
    m_tree->identifyGlobalVariables();

    m_tree->identifyFunctions();

    m_tree->identifyClasses();
    m_tree->identifyInterfaces();

    m_tree->setConnectionTypeClass();

    m_tree->checkClassAccess();

//    m_tree->markBreakContinueOperators();
//    m_tree->markReturnOperators();
//
//    m_tree->check_const();
//    m_tree->check_array();
//    m_tree->check_functions_call();
//    m_tree->check_expression();
}

void stc::Parser::printTree()
{
    m_tree->print();
    m_tree->printAllVariables();
    m_tree->printAllFunctions();
    m_tree->printAllClasses();
    m_tree->printAllInterfaces();
}

stc::Ast* stc::Parser::ast()
{
    return m_tree;
}


stc::Node* stc::Parser::primary_expression()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() == TokenType::NUMBER_CONST)
    {
        string number_str = m_lexer->current_token().lexeme();


        number number_val = stold(number_str);
        temp_node = new Node(NodeType::NUMBER_CONST, number_val);

        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::STRING_CONST)
    {
        string str = m_lexer->current_token().lexeme();

        temp_node = new Node(NodeType::STRING_CONST, str);
        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::TRUE)
    {
        temp_node = new Node(NodeType::BOOLEAN_CONST, 1);

        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::FALSE)
    {
        temp_node = new Node(NodeType::BOOLEAN_CONST, 0);

        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::IDENTIFIER)
    {
        string name = m_lexer->current_token().lexeme();

        if (!Lexer::is_correct_identifier(name))
        {
            error("Invalid identifier: '" + m_lexer->current_token().lexeme() + "'");
        }

        m_lexer->nextToken();


        if (m_lexer->currentTokenType() == TokenType::LPAR)
        {
            temp_node = new Node(NodeType::FUNCTION_CALL, name);
        }
        else
        {
            temp_node = new Node(NodeType::USING_VARIABLE, name);
        }

    }
    else if (m_lexer->currentTokenType() == TokenType::LPAR)
    {
        temp_node = parenthesized_expression();
    }
    else if (m_lexer->currentTokenType() == TokenType::LSQR)
    {
        temp_node = initializer();
    }
    else if (m_lexer->currentTokenType() == TokenType::LET ||
            m_lexer->currentTokenType() == TokenType::CONST)
    {
        temp_node = declaration_statement();
    }
    else if (m_lexer->currentTokenType() == TokenType::NEW)
    {
        temp_node = operator_statement();
    }
    else
    {
#ifndef NO_DEBUG_INFO
        cout << "What happens? Current token: '" + m_lex->current_token().lexeme() + "' ("
             << m_lex->current_token().line() << ", " << m_lex->current_token().pos() << ")" << endl;
#endif
    }

    return temp_node;
}

stc::Node* stc::Parser::parenthesized_expression()
{
    if (m_lexer->currentTokenType() != TokenType::LPAR)
    {
        error("'(' expected!");
    }
    m_lexer->nextToken();


    auto temp_node = expression();


    if (m_lexer->currentTokenType() != TokenType::RPAR)
    {
        error("')' expected!");
    }
    m_lexer->nextToken();

    return temp_node;
}

stc::Node* stc::Parser::postfix_expression()
{
    Node* temp_node = primary_expression();

    if (m_lexer->currentTokenType() == TokenType::LSQR)
    {
        m_lexer->nextToken();
        auto temp_expression = expression();

        if (m_lexer->currentTokenType() != TokenType::RSQR)
        {
            error("']' expected!");
        }
        m_lexer->nextToken();

        temp_node = new Node(NodeType::INDEX_CAPTURE, 0, temp_node, temp_expression);
    }
    else if (m_lexer->currentTokenType() == TokenType::LPAR)
    {
        m_lexer->nextToken();
        auto function_name = any_cast<string>(temp_node->value);
        auto temp_argument_expression_list = argument_expression_list();

        if (m_lexer->currentTokenType() != TokenType::RPAR)
        {
            error("')' expected!");
        }
        m_lexer->nextToken();

        temp_node = new Node(NodeType::FUNCTION_CALL, function_name, temp_argument_expression_list);
    }
    else if (m_lexer->currentTokenType() == TokenType::INC)
    {
        m_lexer->nextToken();
        temp_node = new Node(NodeType::AFTER_INC, 0, temp_node);
    }
    else if (m_lexer->currentTokenType() == TokenType::DEC)
    {
        m_lexer->nextToken();
        temp_node = new Node(NodeType::AFTER_DEC, 0, temp_node);
    }

    return temp_node;
}

stc::Node* stc::Parser::argument_expression_list()
{
    Node* temp_node = nullptr;

    while (m_lexer->currentTokenType() != TokenType::RPAR)
    {
        auto temp_function_argument = assignment_expression();

        temp_node = new Node(NodeType::FUNCTION_ARGS, "", temp_function_argument, temp_node);

        if (m_lexer->currentTokenType() == TokenType::COMMA)
        {
            m_lexer->nextToken();
        }
    }

    return temp_node;
}

stc::Node* stc::Parser::unary_expression()
{
    Node* temp_node = nullptr;


    if (m_lexer->currentTokenType() == TokenType::INC)
    {
        m_lexer->nextToken();
        temp_node = unary_expression();
        temp_node = new Node(NodeType::BEFORE_INC, 0, temp_node);
    }
    else if (m_lexer->currentTokenType() == TokenType::DEC)
    {
        m_lexer->nextToken();
        temp_node = unary_expression();
        temp_node = new Node(NodeType::BEFORE_DEC, 0, temp_node);
    }
    else if (Token::is_unary_operator(m_lexer->currentTokenType()))
    {
        auto type = NodeType::UNARY_PLUS;

        if (m_lexer->currentTokenType() == TokenType::MINUS)
            type = NodeType::UNARY_MINUS;
        else if (m_lexer->currentTokenType() == TokenType::EXCLAMATION)
            type = NodeType::UNARY_EXCLAMATION;

        m_lexer->nextToken();
        temp_node = unary_expression();
        temp_node = new Node(type, 0, temp_node);
    }
    else
    {
        temp_node = postfixExpression();
    }


    return temp_node;
}

stc::Node* stc::Parser::multiplicative_expression()
{
    Node* temp_node = unary_expression();


    if (m_lexer->currentTokenType() == TokenType::STAR || m_lexer->currentTokenType() == TokenType::SLASH)
    {
        NodeType temp_type = NodeType::MUL;

        if (m_lexer->currentTokenType() == TokenType::SLASH)
        {
            temp_type = NodeType::DIV;
        }

        m_lexer->nextToken();

        auto temp_unary_expression = multiplicative_expression();

        temp_node = new Node(temp_type, "", temp_node, temp_unary_expression);
    }

    return temp_node;
}

stc::Node* stc::Parser::additive_expression()
{
    Node* temp_node = multiplicative_expression();


    if (m_lexer->currentTokenType() == TokenType::PLUS || m_lexer->currentTokenType() == TokenType::MINUS)
    {
        NodeType temp_type = NodeType::ADD;

        if (m_lexer->currentTokenType() == TokenType::MINUS)
        {
            temp_type = NodeType::SUB;
        }

        m_lexer->nextToken();

        auto temp_multiplicative_expression = additive_expression();

        temp_node = new Node(temp_type, "", temp_node, temp_multiplicative_expression);
    }


    return temp_node;
}

stc::Node* stc::Parser::relational_expression()
{
    Node* temp_node = additive_expression();


    if (m_lexer->currentTokenType() == TokenType::LESS)
    {
        m_lexer->nextToken();
        auto temp_additive_expression = additive_expression();

        temp_node = new Node(NodeType::LESS, "", temp_node, temp_additive_expression);
    }
    else if (m_lexer->currentTokenType() == TokenType::GREATER)
    {
        m_lexer->nextToken();
        auto temp_additive_expression = additive_expression();

        temp_node = new Node(NodeType::GREATER, "", temp_node, temp_additive_expression);
    }
    else if (m_lexer->currentTokenType() == TokenType::GREATER_EQUAL)
    {
        m_lexer->nextToken();
        auto temp_additive_expression = additive_expression();

        temp_node = new Node(NodeType::GREATER_EQUAL, "", temp_node, temp_additive_expression);
    }
    else if (m_lexer->currentTokenType() == TokenType::LESS_EQUAL)
    {
        m_lexer->nextToken();
        auto temp_additive_expression = additive_expression();

        temp_node = new Node(NodeType::LESS_EQUAL, "", temp_node, temp_additive_expression);
    }

    return temp_node;
}

stc::Node* stc::Parser::equality_expression()
{
    Node* temp_node = relational_expression();


    if (m_lexer->currentTokenType() == TokenType::EQUAL)
    {
        m_lexer->nextToken();
        auto temp_relational_expression = relational_expression();

        temp_node = new Node(NodeType::EQUAL, "", temp_node, temp_relational_expression);
    }
    else if (m_lexer->currentTokenType() == TokenType::NOT_EQUAL)
    {
        m_lexer->nextToken();
        auto temp_relational_expression = relational_expression();

        temp_node = new Node(NodeType::NOT_EQUAL, "", temp_node, temp_relational_expression);
    }


    return temp_node;
}

stc::Node* stc::Parser::logical_and_expression()
{
    Node* temp_node = equality_expression();


    if (m_lexer->currentTokenType() == TokenType::AND)
    {
        m_lexer->nextToken();
        auto temp_logical_and_expression = logical_and_expression();

        temp_node = new Node(NodeType::LOGICAL_AND, "", temp_node, temp_logical_and_expression);
    }

    return temp_node;
}

stc::Node* stc::Parser::logical_or_expression()
{
    Node* temp_node = logical_and_expression();


    if (m_lexer->currentTokenType() == TokenType::OR)
    {
        m_lexer->nextToken();
        auto temp_logical_or_expression = logical_or_expression();

        temp_node = new Node(NodeType::LOGICAL_OR, "", temp_node, temp_logical_or_expression);
    }


    return temp_node;
}

stc::Node* stc::Parser::conditional_expression()
{
    Node* temp_node = logical_or_expression();


    if (m_lexer->currentTokenType() == TokenType::QUESTION)
    {
        m_lexer->nextToken();
        auto temp_expression = expression();

        if (m_lexer->currentTokenType() != TokenType::COLON)
        {
            error("':' expected!");
        }
        m_lexer->nextToken();

        auto temp_conditional_expression = conditional_expression();

        temp_node = new Node(NodeType::IF_ELSE, "", temp_node, temp_expression, temp_conditional_expression);
    }



    return temp_node;
}

stc::Node* stc::Parser::assignment_expression()
{
    Node* temp_node = conditional_expression();


    if (Token::is_assignment_operator(m_lexer->currentTokenType()))
    {
        auto current_token_type = m_lexer->currentTokenType();

        m_lexer->nextToken();
        auto temp_assignment_expression = assignment_expression();


        if (current_token_type == TokenType::ASSIGN)
        {
            temp_node = new Node(NodeType::SET, "", temp_node, temp_assignment_expression);
        }
        else if (current_token_type == TokenType::ADD_ASSIGN)
        {
            auto temp_math = new Node(NodeType::ADD, "", temp_node, temp_assignment_expression);
            temp_node = new Node(NodeType::SET, "", temp_node, temp_math);
        }
        else if (current_token_type == TokenType::SUB_ASSIGN)
        {
            auto temp_math = new Node(NodeType::SUB, "", temp_node, temp_assignment_expression);
            temp_node = new Node(NodeType::SET, "", temp_node, temp_math);
        }
        else if (current_token_type == TokenType::MUL_ASSIGN)
        {
            auto temp_math = new Node(NodeType::MUL, "", temp_node, temp_assignment_expression);
            temp_node = new Node(NodeType::SET, "", temp_node, temp_math);
        }
        else if (current_token_type == TokenType::DIV_ASSIGN)
        {
            auto temp_math = new Node(NodeType::DIV, "", temp_node, temp_assignment_expression);
            temp_node = new Node(NodeType::SET, "", temp_node, temp_math);
        }

    }

    return temp_node;
}

stc::Node* stc::Parser::expression()
{
    Node* temp_node = assignment_expression();

    temp_node = new Node(NodeType::EXPRESSION, "", temp_node);

    return temp_node;
}

stc::Node* stc::Parser::constant_expression()
{
    Node* temp_node = assignment_expression();

    temp_node = new Node(NodeType::CONST_EXPRESSION, "", temp_node);

    return temp_node;
}

stc::Node* stc::Parser::statement()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() == TokenType::LBRA)
    {
        temp_node = compound_statement();
    }

    else if (m_lexer->currentTokenType() == TokenType::IF)
    {
        return selection_statement();
    }
    else if (m_lexer->currentTokenType() == TokenType::WHILE ||
            m_lexer->currentTokenType() == TokenType::DO_WHILE ||
            m_lexer->currentTokenType() == TokenType::FOR)
    {
        temp_node = iteration_statement();
    }
    else if (m_lexer->currentTokenType() == TokenType::FUNCTION)
    {
        m_lexer->nextToken();
        temp_node = function_statement();
    }
    else if (m_lexer->currentTokenType() == TokenType::RETURN ||
            m_lexer->currentTokenType() == TokenType::BREAK ||
            m_lexer->currentTokenType() == TokenType::CONTINUE)
    {
        return operator_statement();
    }
    else if (m_lexer->currentTokenType() == TokenType::CLASS)
    {
        return classStatement();
    }
    else if (m_lexer->currentTokenType() == TokenType::INTERFACE)
    {
        return interfaceStatement();
    }
    else
    {
        return expression_statement();
    }

    temp_node = new Node(NodeType::STATEMENT, "", temp_node);


    return temp_node;
}

stc::Node* stc::Parser::compound_statement()
{
    m_lexer->nextToken();

    Node* temp_node = statement_list();

    return temp_node;
}

stc::Node* stc::Parser::statement_list()
{
    Node* temp_node = nullptr;


    while (m_lexer->currentTokenType() != TokenType::RBRA)
    {
        auto temp_statement = statement();
        temp_node = new Node(NodeType::STATEMENT_LIST, "", temp_node, temp_statement);
    }
    eat(TokenType::RBRA);


    return temp_node;
}

stc::Node* stc::Parser::expression_statement()
{
    Node* temp_node = expression();

    if (m_lexer->currentTokenType() != TokenType::SEMICOLON)
    {
        error("';' expected!");
    }
    m_lexer->nextToken();

    return temp_node;
}

stc::Node* stc::Parser::selection_statement()
{
    Node* temp_node = new Node(NodeType::IF);

    m_lexer->nextToken();

    temp_node->operand1 = parenthesized_expression();
    temp_node->operand2 = statement();


    if (m_lexer->currentTokenType() == TokenType::ELSE)
    {
        temp_node->type = NodeType::IF_ELSE;
        m_lexer->nextToken();

        temp_node->operand3 = statement();
    }


    return temp_node;
}

stc::Node* stc::Parser::iteration_statement()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() == TokenType::WHILE)
    {
        temp_node = new Node(NodeType::WHILE);

        m_lexer->nextToken();

        temp_node->operand1 = parenthesized_expression();
        temp_node->operand2 = statement();
    }
    else if (m_lexer->currentTokenType() == TokenType::DO_WHILE)
    {
        temp_node = new Node(NodeType::DO_WHILE);

        m_lexer->nextToken();

        temp_node->operand2 = statement();

        if (m_lexer->currentTokenType() != TokenType::WHILE)
        {
            error("'while' expected!");
        }
        m_lexer->nextToken();

        temp_node->operand1 = parenthesized_expression();
    }
    else if (m_lexer->currentTokenType() == TokenType::FOR)
    {
        temp_node = new Node(NodeType::FOR);

        m_lexer->nextToken();

        if (m_lexer->currentTokenType() != TokenType::LPAR)
        {
            error("'(' expected!");
        }

        m_lexer->nextToken();
        auto for_variable = expression();

        if (m_lexer->currentTokenType() != TokenType::SEMICOLON)
        {
            error("';' expected!");
        }
        m_lexer->nextToken();


        auto for_test = expression();

        if (m_lexer->currentTokenType() != TokenType::SEMICOLON)
        {
            error("';' expected!");
        }
        m_lexer->nextToken();


        auto for_action = expression();

        if (m_lexer->currentTokenType() != TokenType::RPAR)
        {
            error("')' expected!");
        }

        m_lexer->nextToken();

        temp_node->operand1 = for_variable;
        temp_node->operand2 = for_test;
        temp_node->operand3 = for_action;
        temp_node->operand4 = statement();


        auto temp_stmt = new Node(NodeType::STATEMENT, "");

        temp_stmt->operand1 = temp_node;
        temp_node = temp_stmt;
    }


    return temp_node;
}

stc::Node* stc::Parser::declaration_statement()
{
    Node* temp_node = nullptr;

    bool is_const = false;

    if (m_lexer->currentTokenType() == TokenType::LET)
    {
        temp_node = new Node(NodeType::VARIABLE_DECLARATION);
        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::CONST)
    {
        temp_node = new Node(NodeType::CONSTANT_DECLARATION);
        m_lexer->nextToken();
        is_const = true;
    }

    if (m_lexer->currentTokenType() != TokenType::IDENTIFIER)
    {
        error("Name of variable expected!");
    }

    string variable_name = m_lexer->current_token().lexeme();
    m_lexer->nextToken();


    auto temp_variable_type = declarationType();


    if (!is_const)
    {
        temp_node = new Node(NodeType::VARIABLE_DECLARATION, variable_name, temp_variable_type);
    }
    else
    {
        temp_node = new Node(NodeType::CONSTANT_DECLARATION, variable_name, temp_variable_type);
    }

    return temp_node;
}

stc::Node* stc::Parser::declarationType()
{
    eat(TokenType::COLON);

    return declarationTypeStatement();
}

stc::Node* stc::Parser::initializer()
{
    Node* temp_node = nullptr;

    m_lexer->nextToken();

    while (m_lexer->currentTokenType() != TokenType::RSQR)
    {
        auto temp_initializer_list = initializer_list();
        temp_node = new Node(NodeType::INITIALIZER_LIST, "", temp_node, temp_initializer_list);
    }
    m_lexer->nextToken();

    temp_node = new Node(NodeType::INITIALIZER, "", temp_node);

    return temp_node;
}

stc::Node* stc::Parser::initializer_list()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() == TokenType::COMMA)
    {
        m_lexer->nextToken();

        temp_node = initializer_list();
    }
    else
    {
        temp_node = assignment_expression();
    }

    return temp_node;
}

stc::Node* stc::Parser::function_statement()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() != TokenType::IDENTIFIER)
    {
        error("Name of function expected!");
    }

    string function_name = m_lexer->current_token().lexeme();
    m_lexer->nextToken();

    auto temp_function_args = function_argument_list();


    if (m_lexer->currentTokenType() != TokenType::COLON)
    {
        error("':' expected!");
    }
    m_lexer->nextToken();

    if (!Token::is_this_type_is_type_of_variable(m_lexer->currentTokenType()))
    {
        error("Type of function expected!");
    }
    auto function_type = Token::what_type_of_lexeme(m_lexer->current_token().lexeme());
    m_lexer->nextToken();


    auto temp_function_compound_statement = statement();

    auto temp_function_return_type = new Node(NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE, function_type);

    temp_node = new Node(NodeType::FUNCTION_IMPLEMENTATION, function_name, temp_function_return_type,
                         temp_function_args, temp_function_compound_statement);

    return temp_node;
}

stc::Node* stc::Parser::function_argument_list()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() != TokenType::LPAR)
    {
        error("'(' expected!");
    }
    m_lexer->nextToken();

    while (m_lexer->currentTokenType() != TokenType::RPAR)
    {
        auto temp_function_argument = function_argument();

        temp_node = new Node(NodeType::FUNCTION_IMPLEMENTATION_ARGS, "", temp_node, temp_function_argument);

        if (m_lexer->currentTokenType() == TokenType::COMMA)
        {
            m_lexer->nextToken();
        }
    }


    if (m_lexer->currentTokenType() != TokenType::RPAR)
    {
        error("')' expected!");
    }
    m_lexer->nextToken();

    return temp_node;
}

stc::Node* stc::Parser::function_argument()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() != TokenType::IDENTIFIER)
    {
        error("Name of variable expected!");
    }

    string variable_name = m_lexer->current_token().lexeme();
    m_lexer->nextToken();


    auto temp_variable_type = declarationType();


    temp_node = new Node(NodeType::FUNCTION_IMPLEMENTATION_ARG, variable_name, temp_variable_type);

    return temp_node;
}

stc::Node* stc::Parser::operator_statement()
{
    Node* temp_node = nullptr;

    if (m_lexer->currentTokenType() == TokenType::RETURN)
    {
        m_lexer->nextToken();
        auto temp_expression_statement = expression_statement();

        temp_node = new Node(NodeType::RETURN, 0, temp_expression_statement);
    }
    else if (m_lexer->currentTokenType() == TokenType::BREAK)
    {
        m_lexer->nextToken();
        temp_node = new Node(NodeType::BREAK, 0);
        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::CONTINUE)
    {
        m_lexer->nextToken();
        temp_node = new Node(NodeType::CONTINUE, 0);
        m_lexer->nextToken();
    }
    else if (m_lexer->currentTokenType() == TokenType::NEW)
    {
        m_lexer->nextToken();
        temp_node = postfixExpression();
        temp_node = new Node(NodeType::NEW, 0, temp_node);
    }

    return temp_node;
}

std::string stc::Parser::eat(stc::TokenType type, bool shift)
{
    if (!tryEat(type))
    {
        error(to_string((int)type) + " expected!");
    }

    string value = m_lexer->current_token().lexeme();

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

    string value = m_lexer->current_token().lexeme();

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
    string value = m_lexer->current_token().lexeme();
    return value;
}

void stc::Parser::unEat()
{
    m_lexer->prev_token();
}


   