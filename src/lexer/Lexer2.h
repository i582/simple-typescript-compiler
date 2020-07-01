#pragma once
#include <string>
#include <vector>
#include <fstream>
#include <filesystem>

#include "token/Token.h"



namespace stc
{
namespace fs = std::filesystem;

using std::vector;
using std::ios;
using std::ifstream;
using fs::path;

using symbol = char;

class Lexer2
{
private:
    string m_code;
    vector<string> m_lines;

    size_t m_currentIndex;
    char m_currentSymbol;
    vector<Token> m_tokens;

    string m_possibleComplexOperators;

    Position m_position;

    size_t m_currentTokenIndex;
    path m_filePath;


public:
    explicit Lexer2(const string& path)
    {
        this->open(path);
        this->m_currentIndex = 0;
        this->m_currentSymbol = m_code[m_currentIndex];

        this->m_filePath = (fs::current_path() / path).lexically_normal();

        this->m_possibleComplexOperators = "<>=-+*/!&|";

        this->m_position = Position();
        this->m_currentTokenIndex = 0;
    }


public: // general interface
    void split()
    {
        while (m_currentIndex < m_code.size())
        {
            oneToken();
        }
    }

    void print()
    {
        for (const auto& token : m_tokens)
        {
            token.print();
        }
    }

public:
    string line(size_t index)
    {
        --index;

        if (index >= m_lines.size() || index < 0)
        {
            return "";
        }

        return m_lines[index];
    }

public: // syntax interface
    bool nextToken()
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

    bool prevToken()
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

    _NODISCARD Token& getPrevToken()
    {
        return m_tokens[m_currentTokenIndex - 1];
    }

    _NODISCARD Token& currentToken()
    {
        return m_tokens[m_currentTokenIndex];
    }

    _NODISCARD TokenType currentTokenType()
    {
        return currentToken().type();
    }

    _NODISCARD const path& filePath() const
    {
        return m_filePath;
    }

private:
    void oneToken()
    {
        resetPosition();

        string tempLexeme;

        while (!isSeparateSymbol(currentSymbol()))
        {
            tempLexeme += m_currentSymbol;
            nextSymbol();
        }

        if (!tempLexeme.empty())
        {
            addToken(tempLexeme, m_position);
        }

        if (isSeparateSymbolIsPossibleToken(currentSymbol()))
        {
            if (isPossibleComplexOperator(currentSymbol()))
            {
                complexOperator();

                if (m_tokens.back().isComment())
                {
                    comment();
                    m_tokens.erase(m_tokens.end() - 1);
                }
            }
            else if (currentSymbol() == '"')
            {
                quotedString(StringLiteralType::DoubleQuoted);
            }
            else if (currentSymbol() == '\'')
            {
                quotedString(StringLiteralType::SingleQuoted);
            }
            else
            {
                simpleOperator();
            }
        }

        nextSymbol();
    }

    void simpleOperator()
    {
        string operatorSymbol(1, currentSymbol());

        addToken(operatorSymbol, m_position);
    }

    void complexOperator()
    {
        if (!tryNextToken())
        {
            simpleOperator();
            return;
        }

        const auto firstSymbol = currentSymbol();
        nextSymbol();
        const auto secondSymbol = currentSymbol();

        if (isComplexOperator(firstSymbol, secondSymbol))
        {
            string tempLexeme(1, firstSymbol);
            tempLexeme += secondSymbol;

            addToken(tempLexeme, m_position);
        }
        else
        {
            prevSymbol();
            simpleOperator();
        }
    }

    void quotedString(StringLiteralType type)
    {
        string value;

        value += currentSymbol();
        nextSymbol();

        while (tryNextToken())
        {
            value += currentSymbol();

            if (type == StringLiteralType::DoubleQuoted && currentSymbol() == '"' ||
                type == StringLiteralType::SingleQuoted && currentSymbol() == '\'')
            {
                break;
            }

            nextSymbol();
        }

        addToken(value, m_position);
    }


    void comment()
    {
        if (m_tokens.back().type() == TokenType::BLOCK_COMMENT_START)
        {
            blockComment();
        }
        else if (m_tokens.back().type() == TokenType::LINE_COMMENT)
        {
            lineComment();
        }
    }

    void blockComment()
    {
        auto findStartCommentEnd = false;

        while (tryNextToken())
        {
            if (currentSymbol() == '*')
            {
                findStartCommentEnd = true;

                nextSymbol();
                continue;
            }

            if (findStartCommentEnd && currentSymbol() == '/')
            {
                return;
            }

            if (findStartCommentEnd && currentSymbol() != '/')
            {
                findStartCommentEnd = false;
            }

            nextSymbol();
        }
    }

    void lineComment()
    {
        while (tryNextToken())
        {
            if (currentSymbol() == '\n')
            {
                return;
            }

            nextSymbol();
        }
    }


    bool isPossibleComplexOperator(char symbol1)
    {
        return m_possibleComplexOperators.find(symbol1) != string::npos;
    }

    static bool isComplexOperator(char symbol1, char symbol2)
    {
        switch (symbol1)
        {
            case '=':
            case '!':
            case '<':
            case '>':
                return symbol2 == '=';

            case '-':
                return symbol2 == '-'  || symbol2 == '=';

            case '+':
                return symbol2 == '+' || symbol2 == '=';

            case '*':
                return symbol2 == '=' || symbol2 == '/' || symbol2 == '*';

            case '/':
                return symbol2 == '=' || symbol2 == '*' || symbol2 == '/';

            case '|':
                return symbol2 == '|';

            case '&':
                return symbol2 == '&';

            default:
                return false;
        }
    }

private:

    _NODISCARD bool tryNextToken() const
    {
        return m_currentIndex != m_code.size() - 1;
    }

    void nextSymbol()
    {
        if (currentSymbol() == '\n')
        {
            m_position.endPos = 0;
            m_position.endLine += 1;
        }
        else
        {
            m_position.endPos += 1;
        }


        m_currentIndex++;
    }

    void prevSymbol()
    {
        m_currentIndex--;
    }

    _NODISCARD symbol currentSymbol()
    {
        this->m_currentSymbol = m_code[m_currentIndex];
        return m_code[m_currentIndex];
    }

    void addToken(const string& lexeme, const Position& position)
    {
        Token newToken(lexeme, position);
        m_tokens.push_back(newToken);

        resetPosition();
    }

    void resetPosition()
    {
        m_position.startLine = m_position.endLine;
        m_position.startPos = m_position.endPos;
    }

private:
    void open(const string& path)
    {
        auto file = ifstream(path, ios::binary);

        const auto filesize = file.seekg(0, ios::end).tellg();
        file.seekg(0);

        string temp;
        while (getline(file, temp))
        {
            m_lines.push_back(temp);
        }
        file.close();

        for (const auto& line : m_lines)
        {
            m_code += line;
            m_code += '\n';
        }

        m_code = "{ " + m_code + " }";
    }

    static bool isSeparateSymbol(char symbol)
    {
        return symbol == ':' || symbol == ';' ||
               symbol == ',' || symbol == '.' ||
               symbol == '{' || symbol == '}' ||
               symbol == '(' || symbol == ')' ||
               symbol == '[' || symbol == ']' ||
               symbol == '*' || symbol == '/' ||
               symbol == '+' || symbol == '-' ||
               symbol == '&' || symbol == '|' ||
               symbol == '=' || symbol == '!' ||
               symbol == '<' || symbol == '>' ||
               symbol == '"' || symbol == '^' ||
               symbol == '?' || symbol == '%' ||
               symbol == ' ' || symbol == '\0' ||
               symbol == '\r' || symbol == '\n' ||
               symbol == '\t' || symbol == '\b' ||
               symbol == '\f' || symbol == '\v' ||
               symbol == '\'' || symbol == '\\';
    }

    static bool isSeparateSymbolIsPossibleToken(char symbol)
    {
        return !(symbol == '\r' || symbol == '\n' ||
                 symbol == '\t' || symbol == '\b' ||
                 symbol == '\f' || symbol == '\v' ||
                 symbol == ' ' || symbol == '\0');
    }

};

}