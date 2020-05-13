#include "Lexer.h"

stc::Lexer::Lexer(const std::string& filePath)
{
    this->m_currentTokenIndex = 0;
    this->m_state = LexerState::DEFAULT;


    this->m_filePath = fs::current_path() / filePath;

    this->open(filePath);
}

stc::Lexer::~Lexer()
{
    m_tokens.clear();
}

void stc::Lexer::printTokens()
{

    Log::write("-- Started printing token table\n");

    for (const auto& token : m_tokens)
    {
        token.print();
    }

    Log::write("-- End of token table\n");
    Log::write("\n");

}

bool stc::Lexer::nextToken()
{
    if (m_currentTokenIndex < m_tokens.size() - 1)
    {
        ++m_currentTokenIndex;
        return false;
    }
    else
    {
        return true;
    }
}

bool stc::Lexer::prevToken()
{
    if (m_currentTokenIndex > 0)
    {
        --m_currentTokenIndex;
        return false;
    }
    else
    {
        return true;
    }
}


stc::Token& stc::Lexer::currentToken()
{
    return m_tokens[m_currentTokenIndex];
}

stc::TokenType stc::Lexer::currentTokenType()
{
    return currentToken().type();
}

void stc::Lexer::open(const std::string& filePath)
{
    std::ifstream in(filePath, std::ios::binary);

    if (!in.is_open())
    {
        ErrorHandle::raise("File not found! (" + filePath + ")");
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
    Log::write("-- Started token splitting\n");

    string temp_token;

    size_t current_line = 1;
    size_t current_pos = 0;


    for (int i = 0; i < m_code.size(); ++i)
    {
        if (m_code[i] == '\n' && m_state == LexerState::IN_LINE_COMMENT)
        {
            m_state = LexerState::DEFAULT;
            continue;
        }

        skipExcessSymbols(i, current_line, current_pos);

        const auto& symbol = m_code[i];

        if (symbol == '/' && i + 1 < m_code.size() && m_code[i + 1] == '/')
        {
            m_state = LexerState::IN_LINE_COMMENT;
        }

        if (symbol == '/' && i + 1 < m_code.size() && m_code[i + 1] == '*')
        {
            m_state = LexerState::IN_BLOCK_COMMENT;
        }

        if (symbol == '*' && i + 1 < m_code.size() && m_code[i + 1] == '/')
        {
            m_state = LexerState::DEFAULT;
            ++i;
            continue;
        }

        if (m_state == LexerState::IN_LINE_COMMENT ||
                m_state == LexerState::IN_BLOCK_COMMENT)
        {
            continue;
        }



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


        if (isSplitSymbol(symbol))
        {
            ++current_pos;


            if (!temp_token.empty())
            {
                m_tokens.push_back(Token(temp_token, current_line, current_pos));
                temp_token.clear();
            }


            if (isTokenSymbol(symbol))
            {
                if (i + 1 < m_code.size() && nextSymbolIsPartOfToken(symbol, m_code[i + 1]))
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

            temp_token += symbol;
        }
    }


    if (!temp_token.empty())
    {
        m_tokens.push_back(Token(temp_token, current_line, current_pos));
        temp_token.clear();
    }

    Log::write("-- Token separation done\n");
}

void stc::Lexer::skipExcessSymbols(int& index, size_t& currentLine, size_t& currentPos)
{
    char& current_symbol = m_code[index];

    if (current_symbol == '\n' || current_symbol == '\r')
    {
        if (current_symbol == '\n')
        {
            ++currentLine;
            currentPos = 0;
        }
        else
        {
            ++currentPos;
        }

        current_symbol = ' ';
    }


    if (current_symbol == ' ')
    {
        if (index + 1 < m_code.size() && m_code[index + 1] == ' ')
        {
            ++index;
            ++currentPos;
        }
    }
}

bool stc::Lexer::isSplitSymbol(const char& symbol)
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

bool stc::Lexer::isTokenSymbol(const char& symbol)
{
    return symbol != ' ' && symbol != '\0';
}

bool stc::Lexer::nextSymbolIsPartOfToken(const char& token, const char& symbol)
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

void stc::Lexer::printCurrentTokenLine()
{
    int i = m_currentTokenIndex;
    int j = m_currentTokenIndex;
    auto current_line = currentToken().line();

    while (i > 0 && m_tokens[i].line() == current_line)
    {
        --i;
    }
    ++i;

    int count_symbol_before = m_currentTokenIndex - i;

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
            Log::write("" + m_tokens[k].lexeme() + "" + " ");
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

const std::filesystem::path& stc::Lexer::filePath() const
{
    return m_filePath;
}

