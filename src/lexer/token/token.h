#pragma once
#include <iostream>
#include <string>

namespace compiler
{
    using std::string;
    using std::cout;
    using std::endl;

    enum class token_type
    {
        NUMBER_CONST, // number const
        STRING_CONST, // string const

        // general for variable and function
        NON_TERMINAL,


        // variables
        LET,
        CONST = 0x0010,


        // types
        UNDEFINED       = 0xffffff,

        NUMBER          = 0x001000,
        BOOLEAN         = 0x002000,
        STRING          = 0x003000,
        VOID            = 0x004000,
        ANY             = 0x005000,


        // types for array
        NUMBER_ARRAY    = 0x010000,
        BOOLEAN_ARRAY   = 0x020000,
        STRING_ARRAY    = 0x030000,
        VOID_ARRAY      = 0x040000,


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
    };

    class token
    {
    private:
        string _lexeme;
        token_type _type;

        size_t _line;
        size_t _pos;

    public:
        explicit token(const string& lexeme, size_t line = 0, size_t pos = 0);

    public:
        [[nodiscard]] token_type type() const;
        [[nodiscard]] string lexeme() const;
        [[nodiscard]] size_t line() const;
        [[nodiscard]] size_t pos() const;

    public:
        static bool is_hexadecimal(const string& lexeme);

        static bool is_number(const string& lexeme);
        static bool is_string(const string& lexeme);

        static bool is_unary_operator(token_type type);
        static bool is_assignment_operator(token_type type);


        static bool is_this_type_is_type_of_variable(token_type type);

        static token_type what_type_of_lexeme(const string& lexeme);


    };

}