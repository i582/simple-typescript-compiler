#include "Lexer.h"

stc::Lexer::Lexer(const std::string& file_path)
{
    this->m_current_token_index = 0;
    this->m_state = LexerState::DEFAULT;

    this->open(file_path);
}

stc::Lexer::~Lexer()
{
    m_tokens.clear();
}

void stc::Lexer::print_tokens()
{
    for (const auto& token : m_tokens)
    {
        cout <<
        token.lexeme() << "" <<
        "\t\twith type:" << (int)token.type() <<
        "\tline:" << token.line() <<
        "\tposition:" << token.pos() <<
        "\n";
    }
}

bool stc::Lexer::nextToken()
{
    if (m_current_token_index < m_tokens.size() - 1)
    {
        ++m_current_token_index;
        return false;
    }
    else
    {
        return true;
    }
}

bool stc::Lexer::prev_token()
{
    if (m_current_token_index > 0)
    {
        --m_current_token_index;
        return false;
    }
    else
    {
        return true;
    }
}

stc::TokenType stc::Lexer::next_token_type()
{
    nextToken();
    auto token_type = currentTokenType();
    prev_token();
    return token_type;
}

stc::Token& stc::Lexer::current_token()
{
    return m_tokens[m_current_token_index];
}

stc::TokenType stc::Lexer::currentTokenType()
{
    return current_token().type();
}

void stc::Lexer::open(const std::string& file_path)
{
    std::ifstream in(file_path, std::ios::binary);

    if (!in.is_open())
    {
        throw std::logic_error("File not found!");
    }

    int size = in.seekg( 0, std::ios::end).tellg();
    in.seekg(0);

    m_code.resize(size);
    in.read(&m_code[0], size);

    in.close();

    m_code = "{" + m_code + "}";
}

void stc::Lexer::split()
{
    string temp_token;

    size_t current_line = 1;
    size_t current_pos = 0;


    for (int i = 0; i < m_code.size(); ++i)
    {
        skip_excess_symbols(i, current_line, current_pos);

        const auto& symbol = m_code[i];

        if (symbol == '"')
        {
            if (m_state == LexerState::IN_STRING)
            {
                m_state = LexerState::DEFAULT;
                temp_token += symbol;
                continue;
            }
            else
            {
                m_state = LexerState::IN_STRING;
                temp_token += symbol;
                continue;
            }
        }

        if (m_state == LexerState::IN_STRING)
        {
            temp_token += symbol;
            continue;
        }

        if (is_split_symbol(symbol))
        {
            ++current_pos;


            if (m_state == LexerState::IN_NUMBER)
            {
                if (symbol == '.' || symbol == 'e')
                {
                    temp_token += symbol;
                    continue;
                }
            }

            if (!temp_token.empty())
            {
                m_tokens.push_back(Token(temp_token, current_line, current_pos));
                temp_token.clear();
            }


            if (is_token_symbol(symbol))
            {
                if (i + 1 < m_code.size() && next_symbol_is_part_of_token(symbol, m_code[i + 1]))
                {
                    auto next_symbol = m_code[i + 1];

                    string symbol_token(1, symbol);
                    symbol_token += next_symbol;
                    m_tokens.push_back(Token(symbol_token, current_line, current_pos));
                    ++i;
                }
                else
                {
                    const string symbol_token(1, symbol);
                    m_tokens.push_back(Token(symbol_token, current_line, current_pos));
                }


            }
        }
        else
        {
            ++current_pos;

            if (m_state != LexerState::IN_STRING)
            {
                if (m_state == LexerState::IN_NUMBER)
                {
                    if (symbol != '.' && symbol != 'e' && symbol != '-' && symbol != '+')
                    {
                        m_state = LexerState::DEFAULT;
                    }
                }
                else
                {
                    if (symbol >= '0' && symbol <= '9')
                    {
                        m_state = LexerState::IN_NUMBER;
                    }
                    else
                    {
                        m_state = LexerState::DEFAULT;
                    }
                }
            }

            temp_token += symbol;
        }
    }


    if (!temp_token.empty())
    {
        m_tokens.push_back(Token(temp_token, current_line, current_pos));
        temp_token.clear();
    }
}

void stc::Lexer::skip_excess_symbols(int& index, size_t& current_line, size_t& current_pos)
{
    char& current_symbol = m_code[index];

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
        if (index + 1 < m_code.size() && m_code[index + 1] == ' ')
        {
            ++index;
            ++current_pos;
        }
    }
}

bool stc::Lexer::is_split_symbol(const char& symbol)
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

bool stc::Lexer::is_token_symbol(const char& symbol_)
{
    return symbol_ != ' ' && symbol_ != '\0';
}

bool stc::Lexer::next_symbol_is_part_of_token(const char& token, const char& symbol)
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
            return symbol == '=' || symbol == '/' || symbol == '*';
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

void stc::Lexer::print_current_token_line()
{
    int i = m_current_token_index;
    int j = m_current_token_index;
    auto current_line = current_token().line();

    while (i > 0 && m_tokens[i].line() == current_line)
    {
        --i;
    }
    ++i;

    int count_symbol_before = m_current_token_index - i;

    while (j < m_tokens.size() && m_tokens[j].line() == current_line)
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
            cout << "" << m_tokens[k].lexeme() << "" << " ";
            size_current_token = m_tokens[k].lexeme().size();
            continue;
        }

        cout << m_tokens[k].lexeme() << " ";

        if (k - i <= count_symbol_before)
        {
            count_symbol_before_current += m_tokens[k].lexeme().size() + 1;
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

bool stc::Lexer::is_correct_identifier(const std::string& token)
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
