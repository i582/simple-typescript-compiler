#include "Token.h"

stc::Token::Token(const std::string& lexeme, size_t line, size_t pos)
{
    this->m_lexeme = lexeme;
    this->m_type = what_type_of_lexeme(lexeme);

    this->m_line = line;
    this->m_pos = pos;
}

stc::TokenType stc::Token::type() const
{
    return m_type;
}

std::string stc::Token::lexeme() const
{
    return m_lexeme;
}

size_t stc::Token::line() const
{
    return m_line;
}

size_t stc::Token::pos() const
{
    return m_pos;
}

stc::TokenType stc::Token::what_type_of_lexeme(const std::string& lexeme)
{
    // variables
    if (lexeme == "let")
        return TokenType::LET;
    if (lexeme == "const")
        return TokenType::CONST;
    
    // types
    if (lexeme == "number")
        return TokenType::NUMBER;
    if (lexeme == "boolean")
        return TokenType::BOOLEAN;
    if (lexeme == "void")
        return TokenType::VOID;
    if (lexeme == "string")
        return TokenType::STRING;


    // cycles
    if (lexeme == "for")
        return TokenType::FOR;
    if (lexeme == "while")
        return TokenType::WHILE;
    if (lexeme == "do")
        return TokenType::DO_WHILE;


    // cycles addition
    if (lexeme == "break")
        return TokenType::BREAK;
    if (lexeme == "continue")
        return TokenType::CONTINUE;
    
    // conditions
    if (lexeme == "if")
        return TokenType::IF;
    if (lexeme == "else")
        return TokenType::ELSE;
    
    // relationship operators
    if (lexeme == ">")
        return TokenType::GREATER;
    if (lexeme == "<")
        return TokenType::LESS;
    if (lexeme == "<=")
        return TokenType::LESS_EQUAL;
    if (lexeme == ">=")
        return TokenType::GREATER_EQUAL;
    
    // equal operators
    if (lexeme == "==")
        return TokenType::EQUAL;
    if (lexeme == "!=")
        return TokenType::NOT_EQUAL;
    
    // logical operators
    if (lexeme == "&&")
        return TokenType::AND;
    if (lexeme == "||")
        return TokenType::OR;

    // math operators
    if (lexeme == "+")
        return TokenType::PLUS;
    if (lexeme == "-")
        return TokenType::MINUS;
    if (lexeme == "*")
        return TokenType::STAR;
    if (lexeme == "/")
        return TokenType::SLASH;
    if (lexeme == "++")
        return TokenType::INC;
    if (lexeme == "--")
        return TokenType::DEC;
    if (lexeme == "**")
        return TokenType::STAR_STAR;

    // brackets
    if (lexeme == "{")
        return TokenType::LBRA;
    if (lexeme == "}")
        return TokenType::RBRA;
    if (lexeme == "(")
        return TokenType::LPAR;
    if (lexeme == ")")
        return TokenType::RPAR;
    if (lexeme == "[")
        return TokenType::LSQR;
    if (lexeme == "]")
        return TokenType::RSQR;


    // assign
    if (lexeme == "=")
        return TokenType::ASSIGN;
    if (lexeme == "+=")
        return TokenType::ADD_ASSIGN;
    if (lexeme == "-=")
        return TokenType::SUB_ASSIGN;
    if (lexeme == "*=")
        return TokenType::MUL_ASSIGN;
    if (lexeme == "/=")
        return TokenType::DIV_ASSIGN;

    // function
    if (lexeme == "function")
        return TokenType::FUNCTION;
    if (lexeme == "return")
        return TokenType::RETURN;

    // new
    if (lexeme == "new")
        return TokenType::NEW;

    // boolean values
    if (lexeme == "true")
        return TokenType::TRUE;
    if (lexeme == "false")
        return TokenType::FALSE;

    // other symbols
    if (lexeme == ";")
        return TokenType::SEMICOLON;
    if (lexeme == ":")
        return TokenType::COLON;
    if (lexeme == ",")
        return TokenType::COMMA;
    if (lexeme == ".")
        return TokenType::POINT;
    if (lexeme == "?")
        return TokenType::QUESTION;
    if (lexeme == "!")
        return TokenType::EXCLAMATION;

    // comment
    if (lexeme == "//")
        return TokenType::LINE_COMMENT;
    if (lexeme == "/*")
        return TokenType::BLOCK_COMMENT_START;
    if (lexeme == "*/")
        return TokenType::BLOCK_COMMENT_END;


    if (is_number(lexeme))
        return TokenType::NUMBER_CONST;

    if (is_string(lexeme))
        return TokenType::STRING_CONST;

    // classes
    if (lexeme == "class")
        return TokenType::CLASS;
    if (lexeme == "constructor")
        return TokenType::CONSTRUCTOR;
    if (lexeme == "private")
        return TokenType::PRIVATE;
    if (lexeme == "public")
        return TokenType::PUBLIC;
    if (lexeme == "protected")
        return TokenType::PROTECTED;
    if (lexeme == "static")
        return TokenType::STATIC;
    if (lexeme == "this")
        return TokenType::THIS;


    if (lexeme == "interface")
        return TokenType::INTERFACE;

    return TokenType::IDENTIFIER;
}

bool stc::Token::is_number(const std::string& lexeme)
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

bool stc::Token::is_string(const std::string& lexeme)
{
    return lexeme.front() == '"' && lexeme.back() == '"';
}

bool stc::Token::is_this_type_is_type_of_variable(stc::TokenType type)
{
    return type == TokenType::NUMBER ||
           type == TokenType::BOOLEAN ||
           type == TokenType::VOID ||
           type == TokenType::STRING;
}

bool stc::Token::is_unary_operator(TokenType type)
{
    return type == TokenType::PLUS ||
           type == TokenType::MINUS ||
           type == TokenType::EXCLAMATION;
}

bool stc::Token::is_assignment_operator(stc::TokenType type)
{
    return type == TokenType::ASSIGN ||
           type == TokenType::ADD_ASSIGN ||
           type == TokenType::SUB_ASSIGN ||
           type == TokenType::MUL_ASSIGN ||
           type == TokenType::DIV_ASSIGN;
}

bool stc::Token::isVisibilityModifier(stc::TokenType type)
{
    return type == TokenType::PUBLIC ||
           type == TokenType::PRIVATE ||
           type == TokenType::PROTECTED;
}

