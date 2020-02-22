#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#include "token/token.h"

namespace compiler
{
    using std::cout;
    using std::endl;
    using std::string;
    using std::vector;


    class lexer
    {
    private:
        string _code;
        vector<token*> _tokens;

        size_t _current_token_index;

    public:
        explicit lexer(const string& file_path);
        ~lexer();

    public:
        void parse();
        void print_tokens();
        void print_current_token_line();

    public:
        bool next_token();
        bool prev_token();
        [[nodiscard]] token_type next_token_type();
        [[nodiscard]] token& current_token();
        [[nodiscard]] token_type current_token_type();

        static bool is_correct_identifier(const string& token);

    private:
        void open(const string& file_path);
        void split();

        void skip_excess_symbols(int& index, size_t& current_line, size_t& current_pos);
        static bool is_split_symbol(const char& symbol);
        static bool is_token_symbol(const char& symbol_);
        static bool next_symbol_is_part_of_token(const char& token, const char& symbol);
    };


}
