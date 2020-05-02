#pragma once

#include <iostream>
#include <string>

namespace stc
{
using std::string;
using std::cout;
using std::endl;

enum class TokenType
{
    NUMBER_CONST, // number const
    STRING_CONST, // string const

    // general for variable and function
    IDENTIFIER,


    // variables
    LET,
    CONST,


    // types

    NUMBER,
    BOOLEAN,
    STRING,
    VOID,
    ANY,



    // cycles
    DO_WHILE,
    WHILE,
    FOR,
    // cycles addition
    BREAK,
    CONTINUE,


    // conditions
    IF,
    ELSE,


    // relationship operators
    LESS, // <
    GREATER, // >
    LESS_EQUAL, // <=
    GREATER_EQUAL, // >=


    // equal operators
    EQUAL, // ==
    NOT_EQUAL, // !=


    // logical operators
    AND, // &&
    OR, // ||


    // math operators
    PLUS, // +
    MINUS, // -
    STAR, // *
    SLASH, // /
    INC, // ++
    DEC, // --
    STAR_STAR, // **


    // brackets
    LBRA, // {
    RBRA, // }
    LPAR, // (
    RPAR, // )
    LSQR, // [
    RSQR, // ]


    // assign
    ASSIGN, // =
    ADD_ASSIGN, // +=
    SUB_ASSIGN, // -=
    MUL_ASSIGN, // *=
    DIV_ASSIGN, // /=


    // function
    FUNCTION,
    RETURN,

    // boolean values
    TRUE,
    FALSE,

    // other symbols
    SEMICOLON, // ;
    COLON, // :
    COMMA, // ,
    POINT, // .
    QUESTION, // ?
    EXCLAMATION, // !

    // comment
    LINE_COMMENT, // //
    BLOCK_COMMENT_START, // /*
    BLOCK_COMMENT_END, // */


    // operator new
    NEW,


    // classes
    CLASS,
    CONSTRUCTOR,
    PRIVATE,
    PUBLIC,
    PROTECTED,
    STATIC,
    THIS,

    INTERFACE,
};

class Token
{
private:
    string m_lexeme;
    TokenType m_type;

    size_t m_line;
    size_t m_pos;

public:
    explicit Token(const string& lexeme, size_t line = 0, size_t pos = 0);

public:
    _NODISCARD TokenType type() const;
    _NODISCARD string lexeme() const;
    _NODISCARD size_t line() const;
    _NODISCARD size_t pos() const;


public:
    static bool is_number(const string& lexeme);
    static bool is_string(const string& lexeme);

    static bool is_unary_operator(TokenType type);
    static bool is_assignment_operator(TokenType type);


    static bool is_this_type_is_type_of_variable(TokenType type);

    static TokenType what_type_of_lexeme(const string& lexeme);


    static bool isVisibilityModifier(TokenType type);

};


}