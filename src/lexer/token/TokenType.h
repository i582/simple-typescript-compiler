#pragma once

namespace stc
{


enum class TokenType
{
    NUMBER_CONST, // number const
    STRING_CONST, // string const

    // general for variable and function
    IDENTIFIER,


    // variables
    LET,
    CONST,


    // type
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


    // bitwise operators
    BITWISE_AND, // &
    BITWISE_OR, // |


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


    DECLARE,
    IMPORT,
    EXPORT,
    FROM,


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

}