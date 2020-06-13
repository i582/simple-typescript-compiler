#pragma once
#include <iostream>
#include <iomanip>
#include <string>
#include "../../errorHandle/errorHandle.h"
#include "../../log/Log.h"
#include "TokenType.h"
#include "Position.h"

namespace stc
{
using std::string;
using std::cout;
using std::endl;


enum class StringLiteralType
{
    DoubleQuoted,
    SingleQuoted
};

class Token
{
private:
    string m_lexeme;
    TokenType m_type;

    Position m_position;

public:
    explicit Token(const string& lexeme, const Position& position);

public:
    _NODISCARD TokenType type() const;
    _NODISCARD string lexeme() const;

    _NODISCARD const Position& position() const;


    _NODISCARD bool isComment() const;

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
    static bool isVisibilityModifier(TokenType type);

};


}