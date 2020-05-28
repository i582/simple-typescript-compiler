#pragma once

#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>

#include "../log/Log.h"
#include "../errorHandle/errorHandle.h"
#include "token/Token.h"


namespace fs = std::filesystem;

namespace stc
{
using std::cout;
using std::endl;
using std::string;
using std::vector;

using fs::path;

enum class LexerState
{
    DEFAULT,
    IN_NUMBER,

    IN_STRING,
    IN_LINE_COMMENT,
    IN_BLOCK_COMMENT,
};

class Lexer
{
private:
    string m_code;
    vector<Token> m_tokens;
    LexerState m_state;

    size_t m_currentTokenIndex;

    path m_filePath;

public:
    explicit Lexer(const string& filePath);
    ~Lexer();

public:
    void split();

public:
    void printTokens();
    void printCurrentTokenLine();

public:
    bool nextToken();
    bool prevToken();

public:
    _NODISCARD Token& currentToken();
    _NODISCARD TokenType currentTokenType();
    _NODISCARD const path& filePath() const;

    _NODISCARD size_t currentTokenIndex() const;

private:
    void open(const string& filePath);

    void skipExcessSymbols(int& index, size_t& currentLine, size_t& currentPos);

    static bool isSplitSymbol(const char& symbol);
    static bool isTokenSymbol(const char& symbol);
    static bool nextSymbolIsPartOfToken(const char& token, const char& symbol);
};


}
