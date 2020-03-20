#include "token.h"

compiler::token::token(const std::string& lexeme, size_t line, size_t pos)
{
    this->_lexeme = lexeme;
    this->_type = what_type_of_lexeme(lexeme);

    this->_line = line;
    this->_pos = pos;
}

compiler::token_type compiler::token::type() const
{
    return _type;
}

std::string compiler::token::lexeme() const
{
    return _lexeme;
}

size_t compiler::token::line() const
{
    return _line;
}

size_t compiler::token::pos() const
{
    return _pos;
}

compiler::token_type compiler::token::what_type_of_lexeme(const std::string& lexeme)
{
    if (is_number(lexeme))
        return token_type::NUMBER_CONST;

    if (is_string(lexeme))
        return token_type::STRING_CONST;

    // variables
    if (lexeme == "let")
        return token_type::LET;
    if (lexeme == "const")
        return token_type::CONST;
    
    // types
    if (lexeme == "number")
        return token_type::NUMBER;
    if (lexeme == "boolean")
        return token_type::BOOLEAN;
    if (lexeme == "void")
        return token_type::VOID;
    if (lexeme == "string")
        return token_type::STRING;
    

    // cycles
    if (lexeme == "for")
        return token_type::FOR;
    if (lexeme == "while")
        return token_type::WHILE;
    if (lexeme == "do")
        return token_type::DO_WHILE;


    // cycles addition
    if (lexeme == "break")
        return token_type::BREAK;
    if (lexeme == "continue")
        return token_type::CONTINUE;
    
    // conditions
    if (lexeme == "if")
        return token_type::IF;
    if (lexeme == "else")
        return token_type::ELSE;
    
    // relationship operators
    if (lexeme == ">")
        return token_type::GREATER;
    if (lexeme == "<")
        return token_type::LESS;
    if (lexeme == "<=")
        return token_type::LESS_EQUAL;
    if (lexeme == ">=")
        return token_type::GREATER_EQUAL;
    
    // equal operators
    if (lexeme == "==")
        return token_type::EQUAL;
    if (lexeme == "!=")
        return token_type::NOT_EQUAL;
    
    // logical operators
    if (lexeme == "&&")
        return token_type::AND;
    if (lexeme == "||")
        return token_type::OR;

    // math operators
    if (lexeme == "+")
        return token_type::PLUS;
    if (lexeme == "-")
        return token_type::MINUS;
    if (lexeme == "*")
        return token_type::STAR;
    if (lexeme == "/")
        return token_type::SLASH;
    if (lexeme == "++")
        return token_type::INC;
    if (lexeme == "--")
        return token_type::DEC;
    if (lexeme == "**")
        return token_type::STAR_STAR;

    // brackets
    if (lexeme == "{")
        return token_type::LBRA;
    if (lexeme == "}")
        return token_type::RBRA;
    if (lexeme == "(")
        return token_type::LPAR;
    if (lexeme == ")")
        return token_type::RPAR;
    if (lexeme == "[")
        return token_type::LSQR;
    if (lexeme == "]")
        return token_type::RSQR;


    // assign
    if (lexeme == "=")
        return token_type::ASSIGN;
    if (lexeme == "+=")
        return token_type::ADD_ASSIGN;
    if (lexeme == "-=")
        return token_type::SUB_ASSIGN;
    if (lexeme == "*=")
        return token_type::MUL_ASSIGN;
    if (lexeme == "/=")
        return token_type::DIV_ASSIGN;

    // function
    if (lexeme == "function")
        return token_type::FUNCTION;
    if (lexeme == "return")
        return token_type::RETURN;

    // new
    if (lexeme == "new")
        return token_type::NEW;

    // boolean values
    if (lexeme == "true")
        return token_type::TRUE;
    if (lexeme == "false")
        return token_type::FALSE;

    // other symbols
    if (lexeme == ";")
        return token_type::SEMICOLON;
    if (lexeme == ":")
        return token_type::COLON;
    if (lexeme == ",")
        return token_type::COMMA;
    if (lexeme == ".")
        return token_type::POINT;
    if (lexeme == "?")
        return token_type::QUESTION;
    if (lexeme == "!")
        return token_type::EXCLAMATION;

    // comment
    if (lexeme == "//")
        return token_type::LINE_COMMENT;
    if (lexeme == "/*")
        return token_type::BLOCK_COMMENT_START;
    if (lexeme == "*/")
        return token_type::BLOCK_COMMENT_END;


    return token_type::NON_TERMINAL;
}

bool compiler::token::is_number(const std::string& lexeme)
{
    bool point = false;

    for (const char& s : lexeme)
    {
        if (s == '.' && !point)
        {
            point = true;
            continue;
        }

        if (s == '.')
        {
            return false;
        }

        if (s < '0' || s > '9')
        {
            return false;
        }
    }

    return true;
}

bool compiler::token::is_string(const std::string& lexeme)
{
    return lexeme.front() == '"' && lexeme.back() == '"';
}

bool compiler::token::is_this_type_is_type_of_variable(compiler::token_type type)
{
    return  type == token_type::NUMBER ||
            type == token_type::BOOLEAN ||
            type == token_type::VOID ||
            type == token_type::STRING;
}

bool compiler::token::is_unary_operator(token_type type)
{
    return  type == token_type::PLUS ||
            type == token_type::MINUS ||
            type == token_type::EXCLAMATION;
}

bool compiler::token::is_assignment_operator(compiler::token_type type)
{
    return  type == token_type::ASSIGN ||
            type == token_type::ADD_ASSIGN ||
            type == token_type::SUB_ASSIGN ||
            type == token_type::MUL_ASSIGN ||
            type == token_type::DIV_ASSIGN;
}

bool compiler::token::is_hexadecimal(const std::string& lexeme)
{
    return false;
}
