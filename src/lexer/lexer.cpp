#include "lexer.h"

compiler::lexer::lexer(const std::string& file_path)
{
    this->_current_token_index = 0;

    open(file_path);
}

compiler::lexer::~lexer()
{
    _tokens.clear();
}

void compiler::lexer::parse()
{
    split();
}

void compiler::lexer::print_tokens()
{
    for (const auto& token : _tokens)
    {
        cout <<
        token->lexeme() << "" <<
        "\t\twith type:" << (int)token->type() <<
        "\tline:" << token->line() <<
        "\tposition:" << token->pos() <<
        "\n";
    }
}

bool compiler::lexer::next_token()
{
    if (_current_token_index < _tokens.size() - 1)
    {
        ++_current_token_index;
        return false;
    }
    else
    {
        return true;
    }
}

bool compiler::lexer::prev_token()
{
    if (_current_token_index > 0)
    {
        --_current_token_index;
        return false;
    }
    else
    {
        return true;
    }
}

compiler::token_type compiler::lexer::next_token_type()
{
    next_token();
    auto token_type = current_token_type();
    prev_token();
    return token_type;
}

compiler::token& compiler::lexer::current_token()
{
    return *_tokens[_current_token_index];
}

compiler::token_type compiler::lexer::current_token_type()
{
    return current_token().type();
}

void compiler::lexer::open(const std::string& file_path)
{
    std::ifstream in(file_path, std::ios::binary);

    if (!in.is_open())
    {
        throw std::logic_error("File not found!");
    }

    int size = in.seekg( 0, std::ios::end).tellg();
    in.seekg(0);

    _code.resize(size);
    in.read(&_code[0], size);

    _code = "{" + _code + "}";
}

void compiler::lexer::split()
{
    string temp_token;

    size_t current_line = 1;
    size_t current_pos = 0;


    for (int i = 0; i < _code.size(); ++i)
    {
        skip_excess_symbols(i, current_line, current_pos);

        const auto& symbol = _code[i];

        if (is_split_symbol(symbol))
        {
            ++current_pos;

            if (!temp_token.empty())
            {
                _tokens.push_back(new token(temp_token, current_line, current_pos));
                temp_token.clear();
            }


            if (is_token_symbol(symbol))
            {
                if (i + 1 < _code.size() && next_symbol_is_part_of_token(symbol, _code[i + 1]))
                {
                    auto next_symbol = _code[i + 1];

                    string symbol_token(1, symbol);
                    symbol_token += next_symbol;
                    _tokens.push_back(new token(symbol_token, current_line, current_pos));
                    ++i;
                }
                else
                {
                    const string symbol_token(1, symbol);
                    _tokens.push_back(new token(symbol_token, current_line, current_pos));
                }


            }

            continue;
        }

        ++current_pos;
        temp_token += symbol;
    }


    if (!temp_token.empty())
    {
        _tokens.push_back(new token(temp_token, current_line, current_pos));
        temp_token.clear();
    }
}

void compiler::lexer::skip_excess_symbols(int& index, size_t& current_line, size_t& current_pos)
{
    char& current_symbol = _code[index];

    if (current_symbol == '\n' || current_symbol == '\r')
    {
        if (current_symbol == '\n')
        {
            ++current_line;
            current_pos = 0;
        }
        else
        {
            ++current_pos;
        }

        current_symbol = ' ';
    }


    if (current_symbol == ' ')
    {
        if (index + 1 < _code.size() && _code[index + 1] == ' ')
        {
            ++index;
            ++current_pos;
        }
    }
}

bool compiler::lexer::is_split_symbol(const char& symbol)
{
    return  symbol == ':' || symbol == ';' ||
            symbol == ',' || symbol == '.' ||
            symbol == '{' || symbol == '}' ||
            symbol == '(' || symbol == ')' ||
            symbol == '[' || symbol == ']' ||
            symbol == '*' || symbol == '/' ||
            symbol == '+' || symbol == '-' ||
            symbol == '&' || symbol == '|' ||
            symbol == '=' || symbol == '!' ||
            symbol == '<' || symbol == '>' ||
            symbol == '\''|| symbol == '"' ||
            symbol == '^' || symbol == '?' ||
            symbol == '%' || symbol == '\\'||
            symbol == ' ';
}

bool compiler::lexer::is_token_symbol(const char& symbol_)
{
    return symbol_ != ' ' && symbol_ != '\0';
}

bool compiler::lexer::next_symbol_is_part_of_token(const char& token, const char& symbol)
{
    switch (token)
    {
        case '=':
        case '!':
        case '<':
        case '>':
        {
            return symbol == '=';
        }

        case '-':
        {
            return symbol == '-'  || symbol == '=';
        }

        case '+':
        {
            return symbol == '+' || symbol == '=';
        }

        case '*':
        {
            return symbol == '=' || symbol == '/';
        }

        case '/':
        {
            return symbol == '=' || symbol == '*' || symbol == '/';
        }


        case '|':
        {
            return symbol == '|';
        }

        case '&':
        {
            return symbol == '&';
        }

        default: return false;
    }
}

void compiler::lexer::print_current_token_line()
{
    int i = _current_token_index;
    int j = _current_token_index;
    auto current_line = current_token().line();

    while (i > 0 && _tokens[i]->line() == current_line)
    {
        --i;
    }
    ++i;

    int count_symbol_before = _current_token_index - i;

    while (j < _tokens.size() && _tokens[j]->line() == current_line)
    {
        ++j;
    }

    size_t count_symbol_before_current = 0;
    string underline;
    size_t size_current_token = 0;
    for (int k = i; k < j; ++k)
    {
        if (k - i == count_symbol_before)
        {
            cout << "" << _tokens[k]->lexeme() << "" << " ";
            size_current_token = _tokens[k]->lexeme().size();
            continue;
        }

        cout << _tokens[k]->lexeme() << " ";

        if (k - i <= count_symbol_before)
        {
            count_symbol_before_current += _tokens[k]->lexeme().size() + 1;
        }
    }

    for (int l = 0; l < count_symbol_before_current; ++l)
    {
        underline += ' ';
    }

    for (int l = 0; l < size_current_token; ++l)
    {
        underline += '~';
    }

    cout << endl;
    cout << underline;
}

bool compiler::lexer::is_correct_identifier(const std::string& token)
{
    if (!isalpha(token[0]) && token[0] != '_')
    {
        return false;
    }

    for (const auto& symbol : token)
    {
        if (!isalpha(symbol) && !isdigit(symbol) && symbol != '_')
        {
            return false;
        }
    }

    return true;
}
