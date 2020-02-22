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
        // num
        NUM, // number

        // general for variable and function
        NON_TERMINAL,


        // variables
        LET,
        CONST = 0x0010,


        // types
        NUMBER = 0x01000,
        BOOLEAN = 0x02000,
        VOID = 0x03000,
        // types for array
        NUMBER_ARRAY = 0x10000,
        BOOLEAN_ARRAY = 0x20000,
        VOID_ARRAY = 0x30000,


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
        static bool is_number(const string& lexeme);

        static bool is_unary_operator(token_type type);
        static bool is_assignment_operator(token_type type);


        static bool is_this_type_is_type_of_variable(token_type type);

        static token_type what_type_of_lexeme(const string& lexeme);



    };

}