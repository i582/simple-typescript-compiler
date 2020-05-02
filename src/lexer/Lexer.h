#pragma once

#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#include "token/Token.h"

namespace stc
{
using std::cout;
using std::endl;
using std::string;
using std::vector;


enum class LexerState
{
    DEFAULT,
    IN_NUMBER,

    IN_STRING,
};

class Lexer
{
private:
    string m_code;
    vector<Token> m_tokens;
    LexerState m_state;

    size_t m_current_token_index;

public:
    explicit Lexer(const string& file_path);

    ~Lexer();

public:
    void print_tokens();

    void print_current_token_line();

public:
    void split();

    bool nextToken();

    bool prev_token();

    [[nodiscard]] TokenType next_token_type();

    [[nodiscard]] Token& current_token();

    [[nodiscard]] TokenType currentTokenType();

    static bool is_correct_identifier(const string& token);

private:
    void open(const string& file_path);

    void skip_excess_symbols(int& index, size_t& current_line, size_t& current_pos);

    static bool is_split_symbol(const char& symbol);

    static bool is_token_symbol(const char& symbol_);

    static bool next_symbol_is_part_of_token(const char& token, const char& symbol);
};


}
