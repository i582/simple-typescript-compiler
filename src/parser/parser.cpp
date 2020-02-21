#include "parser.h"

compiler::parser::parser(const std::string& file_path_)
{
    _lex = new lexer(file_path_);
    _tree = new ast();

    _lex->parse();
    _lex->print_tokens();
}

compiler::parser::~parser()
{
    delete _lex;
    delete _tree;
}

void compiler::parser::error(const std::string& message_)
{
    cout << "Parse error: " << message_ << "" << endl;

    _lex->print_current_token_line();

    throw std::logic_error(message_);
}

compiler::node* compiler::parser::parse()
{
    node* new_node = statement();
    _tree->_tree = new node(node_type::PROGRAM, "", new_node);

    _tree->print(_tree->_tree, 0);

    return new_node;
}

compiler::node* compiler::parser::primary_expression()
{
    node* temp_node = nullptr;

    if (_lex->current_token_type() == token_type::NUM)
    {
        int number = stoi(_lex->current_token().lexeme());
        temp_node = new node(node_type::NUMBER_CONST, number);

        _lex->next_token();
    }
    else if (_lex->current_token_type() == token_type::TRUE)
    {
        temp_node = new node(node_type::BOOLEAN_CONST, "true");

        _lex->next_token();
    }
    else if (_lex->current_token_type() == token_type::FALSE)
    {
        temp_node = new node(node_type::BOOLEAN_CONST, "false");

        _lex->next_token();
    }
    else if (_lex->current_token_type() == token_type::NON_TERMINAL)
    {
        auto name = _lex->current_token().lexeme();

        _lex->next_token();

        temp_node = new node(node_type::NON_TERMINAL_NAME, name);
    }
    else if (_lex->current_token_type() == token_type::LPAR)
    {
        temp_node = parenthesized_expression();
    }
    else if (_lex->current_token_type() == token_type::LSQR)
    {
        temp_node = initializer();
    }
    else if (_lex->current_token_type() == token_type::LET ||
             _lex->current_token_type() == token_type::CONST)
    {
        temp_node = declaration_statement();
    }
    else
    {
        cout << "What happens? Current token: '" + _lex->current_token().lexeme() + "'" << endl;
    }

    return temp_node;
}

compiler::node* compiler::parser::parenthesized_expression()
{
    if (_lex->current_token_type() != token_type::LPAR)
    {
        error("'(' expected! Current token: '" + _lex->current_token().lexeme() + "'");
    }
    _lex->next_token();


    auto temp_node = expression();


    if (_lex->current_token_type() != token_type::RPAR)
    {
        error("')' expected! Current token: '" + _lex->current_token().lexeme() + "'");
    }
    _lex->next_token();

    return temp_node;
}

compiler::node* compiler::parser::postfix_expression()
{
    node* temp_node = primary_expression();

    if (_lex->current_token_type() == token_type::LSQR)
    {
        _lex->next_token();
        auto temp_expression = expression();

        if (_lex->current_token_type() != token_type::RSQR)
        {
            error("']' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }
        _lex->next_token();

        temp_node = new node(node_type::INDEX_CAPTURE, 0, temp_node, temp_expression);
    }
    else if (_lex->current_token_type() == token_type::LPAR)
    {
        _lex->next_token();
        auto temp_argument_expression_list = argument_expression_list();

        if (_lex->current_token_type() != token_type::RPAR)
        {
            error("')' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }
        _lex->next_token();

        temp_node = new node(node_type::FUNCTION_CALL, 0, temp_node, temp_argument_expression_list);
    }
    else if (_lex->current_token_type() == token_type::INC)
    {
        _lex->next_token();
        temp_node = new node(node_type::AFTER_INC, 0, temp_node);
    }
    else if (_lex->current_token_type() == token_type::DEC)
    {
        _lex->next_token();
        temp_node = new node(node_type::AFTER_DEC, 0, temp_node);
    }

    return temp_node;
}

compiler::node* compiler::parser::argument_expression_list()
{
    node* temp_node = assignment_expression();

    if (_lex->current_token_type() == token_type::COMMA)
    {
        _lex->next_token();

        auto temp_argument_expression_list = argument_expression_list();

        temp_node = new node(node_type::FUNCTION_ARG, 0, temp_node, temp_argument_expression_list);
    }

    return temp_node;
}

compiler::node* compiler::parser::unary_expression()
{
    node* temp_node = nullptr;


    if (_lex->current_token_type() == token_type::INC)
    {
        _lex->next_token();
        temp_node = unary_expression();
        temp_node = new node(node_type::BEFORE_INC, 0, temp_node);
    }
    else if (_lex->current_token_type() == token_type::DEC)
    {
        _lex->next_token();
        temp_node = unary_expression();
        temp_node = new node(node_type::BEFORE_DEC, 0, temp_node);
    }
    else if (token::is_unary_operator(_lex->current_token_type()))
    {
        auto type = node_type::UNARY_PLUS;

        if (_lex->current_token_type() == token_type::MINUS)
            type = node_type::UNARY_MINUS;
        else if (_lex->current_token_type() == token_type::EXCLAMATION)
            type = node_type::UNARY_EXCLAMATION;

        _lex->next_token();
        temp_node = unary_expression();
        temp_node = new node(type, 0, temp_node);
    }
    else
    {
        temp_node = postfix_expression();
    }


    return temp_node;
}

compiler::node* compiler::parser::multiplicative_expression()
{
    node* temp_node = unary_expression();


    if (_lex->current_token_type() == token_type::STAR || _lex->current_token_type() == token_type::SLASH)
    {
        node_type temp_type = node_type::MUL;

        if (_lex->current_token_type() == token_type::SLASH)
        {
            temp_type = node_type::DIV;
        }

        _lex->next_token();

        auto temp_unary_expression = multiplicative_expression();

        temp_node = new node(temp_type, "", temp_node, temp_unary_expression);
    }

    return temp_node;
}

compiler::node* compiler::parser::additive_expression()
{
    node* temp_node = multiplicative_expression();


    if (_lex->current_token_type() == token_type::PLUS || _lex->current_token_type() == token_type::MINUS)
    {
        node_type temp_type = node_type::ADD;

        if (_lex->current_token_type() == token_type::MINUS)
        {
            temp_type = node_type::SUB;
        }

        _lex->next_token();

        auto temp_multiplicative_expression = additive_expression();

        temp_node = new node(temp_type, "", temp_node, temp_multiplicative_expression);
    }


    return temp_node;
}

compiler::node* compiler::parser::relational_expression()
{
    node* temp_node = additive_expression();


    if (_lex->current_token_type() == token_type::LESS)
    {
        _lex->next_token();
        auto temp_additive_expression = additive_expression();

        temp_node = new node(node_type::LESS, "", temp_node, temp_additive_expression);
    }
    else if (_lex->current_token_type() == token_type::GREATER)
    {
        _lex->next_token();
        auto temp_additive_expression = additive_expression();

        temp_node = new node(node_type::GREATER, "", temp_node, temp_additive_expression);
    }
    else if (_lex->current_token_type() == token_type::GREATER_EQUAL)
    {
        _lex->next_token();
        auto temp_additive_expression = additive_expression();

        temp_node = new node(node_type::GREATER_EQUAL, "", temp_node, temp_additive_expression);
    }
    else if (_lex->current_token_type() == token_type::LESS_EQUAL)
    {
        _lex->next_token();
        auto temp_additive_expression = additive_expression();

        temp_node = new node(node_type::LESS_EQUAL, "", temp_node, temp_additive_expression);
    }

    return temp_node;
}

compiler::node* compiler::parser::equality_expression()
{
    node* temp_node = relational_expression();


    if (_lex->current_token_type() == token_type::EQUAL)
    {
        _lex->next_token();
        auto temp_relational_expression = relational_expression();

        temp_node = new node(node_type::EQUAL, "", temp_node, temp_relational_expression);
    }
    else if (_lex->current_token_type() == token_type::NOT_EQUAL)
    {
        _lex->next_token();
        auto temp_relational_expression = relational_expression();

        temp_node = new node(node_type::NOT_EQUAL, "", temp_node, temp_relational_expression);
    }


    return temp_node;
}

compiler::node* compiler::parser::logical_and_expression()
{
    node* temp_node = equality_expression();


    if (_lex->current_token_type() == token_type::AND)
    {
        _lex->next_token();
        auto temp_logical_and_expression = logical_and_expression();

        temp_node = new node(node_type::LOGICAL_AND, "", temp_node, temp_logical_and_expression);
    }

    return temp_node;
}

compiler::node* compiler::parser::logical_or_expression()
{
    node* temp_node = logical_and_expression();


    if (_lex->current_token_type() == token_type::OR)
    {
        _lex->next_token();
        auto temp_logical_or_expression = logical_or_expression();

        temp_node = new node(node_type::LOGICAL_OR, "", temp_node, temp_logical_or_expression);
    }


    return temp_node;
}

compiler::node* compiler::parser::conditional_expression()
{
    node* temp_node = logical_or_expression();


    if (_lex->current_token_type() == token_type::QUESTION)
    {
        _lex->next_token();
        auto temp_expression = expression();

        if (_lex->current_token_type() != token_type::COLON)
        {
            error("':' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }
        _lex->next_token();

        auto temp_conditional_expression = conditional_expression();

        temp_node = new node(node_type::IF_ELSE, "", temp_node, temp_expression, temp_conditional_expression);
    }



    return temp_node;
}

compiler::node* compiler::parser::assignment_expression()
{
    node* temp_node = conditional_expression();


    if (token::is_assignment_operator(_lex->current_token_type()))
    {
        auto current_token_type = _lex->current_token_type();

        _lex->next_token();
        auto temp_assignment_expression = assignment_expression();


        if (current_token_type == token_type::ASSIGN)
        {
            temp_node = new node(node_type::SET, "", temp_node, temp_assignment_expression);
        }
        else if (current_token_type == token_type::ADD_ASSIGN)
        {
            auto temp_math = new node(node_type::ADD, "", temp_node, temp_assignment_expression);
            temp_node = new node(node_type::SET, "", temp_node, temp_math);
        }
        else if (current_token_type == token_type::SUB_ASSIGN)
        {
            auto temp_math = new node(node_type::SUB, "", temp_node, temp_assignment_expression);
            temp_node = new node(node_type::SET, "", temp_node, temp_math);
        }
        else if (current_token_type == token_type::MUL_ASSIGN)
        {
            auto temp_math = new node(node_type::MUL, "", temp_node, temp_assignment_expression);
            temp_node = new node(node_type::SET, "", temp_node, temp_math);
        }
        else if (current_token_type == token_type::DIV_ASSIGN)
        {
            auto temp_math = new node(node_type::DIV, "", temp_node, temp_assignment_expression);
            temp_node = new node(node_type::SET, "", temp_node, temp_math);
        }

    }
//    else
//    {
//        auto temp_conditional_expression = conditional_expression();
//
//        temp_node = new node(node_type::EXPRESSION, "", temp_node, temp_conditional_expression);
//    }


    return temp_node;
}

compiler::node* compiler::parser::expression()
{
    node* temp_node = assignment_expression();

    temp_node = new node(node_type::EXPRESSION, "", temp_node);

    return temp_node;
}

compiler::node* compiler::parser::constant_expression()
{
    node* temp_node = assignment_expression();

    temp_node = new node(node_type::CONST_EXPRESSION, "", temp_node);

    return temp_node;
}

compiler::node* compiler::parser::statement()
{
    node* temp_node = nullptr;

    if (_lex->current_token_type() == token_type::LBRA)
    {
        _lex->next_token();
        temp_node = compound_statement();
    }
    else if (_lex->current_token_type() == token_type::IF)
    {
        temp_node = selection_statement();
    }
    else if (_lex->current_token_type() == token_type::WHILE ||
             _lex->current_token_type() == token_type::DO_WHILE ||
             _lex->current_token_type() == token_type::FOR)
    {
        temp_node = iteration_statement();
    }
    else if (_lex->current_token_type() == token_type::NEW)
    {
        // TODO
    }
    else
    {
        temp_node = expression_statement();
    }

    temp_node = new node(node_type::STATEMENT, "", temp_node);


    return temp_node;
}

compiler::node* compiler::parser::compound_statement()
{
    node* temp_node = statement_list();



    if (_lex->current_token_type() != token_type::RBRA)
    {
        error("'}' expected! Current token: '" + _lex->current_token().lexeme() + "'");
    }
    _lex->next_token();

    temp_node = new node(node_type::SEQ_STATEMENT, "", temp_node);


    return temp_node;
}

compiler::node* compiler::parser::statement_list()
{
    node* temp_node = statement();

    if (_lex->current_token_type() != token_type::RBRA)
    {
        auto temp_statement_list = statement_list();
        temp_node = new node(node_type::STATEMENT_LIST, "", temp_node, temp_statement_list);
    }

    return temp_node;
}

compiler::node* compiler::parser::expression_statement()
{
    node* temp_node = expression();

    if (_lex->current_token_type() != token_type::SEMICOLON)
    {
        error("';' expected! Current token: '" + _lex->current_token().lexeme() + "'");
    }
    _lex->next_token();

    return temp_node;
}

compiler::node* compiler::parser::selection_statement()
{
    node* temp_node = new node(node_type::IF);

    _lex->next_token();

    temp_node->_operand1 = parenthesized_expression();
    temp_node->_operand2 = statement();


    if (_lex->current_token_type() == token_type::ELSE)
    {
        temp_node->_type = node_type::IF_ELSE;
        _lex->next_token();

        temp_node->_operand3 = statement();
    }


    return temp_node;
}

compiler::node* compiler::parser::iteration_statement()
{
    node* temp_node = nullptr;

    if (_lex->current_token_type() == token_type::WHILE)
    {
        temp_node = new node(node_type::WHILE);

        _lex->next_token();

        temp_node->_operand1 = parenthesized_expression();
        temp_node->_operand2 = statement();
    }
    else if (_lex->current_token_type() == token_type::DO_WHILE)
    {
        temp_node = new node(node_type::DO_WHILE);

        _lex->next_token();

        temp_node->_operand2 = statement();

        if (_lex->current_token_type() != token_type::WHILE)
        {
            error("'while' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }
        _lex->next_token();

        temp_node->_operand1 = parenthesized_expression();
    }
    else if (_lex->current_token_type() == token_type::FOR)
    {
        temp_node = new node(node_type::FOR);

        _lex->next_token();

        if (_lex->current_token_type() != token_type::LPAR)
        {
            error("'(' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }

        _lex->next_token();
        auto for_variable = expression();

        if (_lex->current_token_type() != token_type::SEMICOLON)
        {
            error("';' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }
        _lex->next_token();


        auto for_test = expression();

        if (_lex->current_token_type() != token_type::SEMICOLON)
        {
            error("';' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }
        _lex->next_token();


        auto for_action = expression();

        if (_lex->current_token_type() != token_type::RPAR)
        {
            error("')' expected! Current token: '" + _lex->current_token().lexeme() + "'");
        }

        _lex->next_token();

        temp_node->_operand1 = for_variable;
        temp_node->_operand2 = for_test;
        temp_node->_operand3 = for_action;
        temp_node->_operand4 = statement();


        auto temp_stmt = new node(node_type::STATEMENT, "");

        temp_stmt->_operand1 = temp_node;
        temp_node = temp_stmt;
    }


    return temp_node;
}

compiler::node* compiler::parser::declaration_statement()
{
    node* temp_node = nullptr;

    bool is_const = false;

    if (_lex->current_token_type() == token_type::LET)
    {
        temp_node = new node(node_type::VARIABLE_DECLARATION);
        _lex->next_token();
    }
    else if (_lex->current_token_type() == token_type::CONST)
    {
        temp_node = new node(node_type::CONSTANT_DECLARATION);
        _lex->next_token();
        is_const = true;
    }

    if (_lex->current_token_type() != token_type::NON_TERMINAL)
    {
        error("Name of variable expected!");
    }

    string variable_name = _lex->current_token().lexeme();
    _lex->next_token();


    auto temp_variable_type = declaration_type();


    if (!is_const)
    {
        temp_node = new node(node_type::VARIABLE_DECLARATION, variable_name, temp_variable_type);
    }
    else
    {
        temp_node = new node(node_type::CONSTANT_DECLARATION, variable_name, temp_variable_type);
    }

    return temp_node;
}

compiler::node* compiler::parser::declaration_type()
{
    node* temp_node = nullptr;

    if (_lex->current_token_type() != token_type::COLON)
    {
        error("Type of variable expected!");
    }
    _lex->next_token();


    if (!token::is_this_type_is_type_of_variable(_lex->current_token_type()))
    {
        error("Type of variable expected!");
    }

    auto variable_type = token::what_type_of_lexeme(_lex->current_token().lexeme());
    _lex->next_token();


    temp_node = new node(node_type::VARIABLE_TYPE, variable_type);


    if (_lex->current_token_type() == token_type::LSQR)
    {
        auto current_type = (int)variable_type;
        auto new_array_type = token_type(current_type << 4);

        temp_node->_value = new_array_type;
        _lex->next_token();

        if (_lex->current_token_type() != token_type::RSQR)
        {
            error("']' expected!");
        }
        _lex->next_token();
    }

    return temp_node;
}

compiler::node* compiler::parser::initializer()
{
    node* temp_node = nullptr;

    _lex->next_token();

    while (_lex->current_token_type() != token_type::RSQR)
    {
        auto temp_initializer_list = initializer_list();
        temp_node = new node(node_type::INITIALIZER_LIST, "", temp_node, temp_initializer_list);
    }
    _lex->next_token();

    temp_node = new node(node_type::INITIALIZER, "", temp_node);

    return temp_node;
}

compiler::node* compiler::parser::initializer_list()
{
    node* temp_node = nullptr;

    if (_lex->current_token_type() == token_type::COMMA)
    {
        _lex->next_token();

        temp_node = initializer_list();
    }
    else
    {
        temp_node = assignment_expression();
    }

    return temp_node;
}