#pragma once
#include <iostream>
#include <iomanip>
#include <string>
#include "../../errorHandle/errorHandle.h"
#include "../../log/Log.h"


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
    CONST = 0x0010,


    // type
    NUMBER          = 0x001000,
    BOOLEAN         = 0x002000,
    STRING          = 0x003000,
    VOID            = 0x004000,
    ANY             = 0x005000,


    // cycles
    DO_WHILE = 0x00F0,
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
    void print() const;

public:
    static bool isNumber(const string& lexeme);
    static bool isString(const string& lexeme);

    static bool isUnaryOperator(TokenType type);
    static bool isAssignmentOperator(TokenType type);
    static bool isThisTypeIsVariableType(TokenType type);

    static TokenType typeByLexeme(const string& lexeme);

    _NODISCARD static string tokenTypeToString(TokenType type);

    static bool isCorrectIdentifier(const string& lexeme);
    static bool isVisibilityModifier(stc::TokenType type);
};


}