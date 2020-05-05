#pragma once

#include "../lexer/Lexer.h"
#include "../parser/Parser.h"
#include "../parser/ast/Ast.h"
#include "../parser/asm/Asm.h"

#include "../console-color.hpp"

namespace stc
{

// integrated compilation module
class ICM
{
private:
    Lexer* m_lexer;
    Parser* m_parser;
    Ast* m_ast;
    Asm* m_asm;

    string m_inputFilePath;

public:
    ICM(const string& inputFilePath, const string& outputFilePath)
    {
        this->m_lexer = new Lexer(inputFilePath);
        this->m_parser = new Parser(m_lexer);
        this->m_ast = m_parser->ast();
        this->m_asm = new Asm(outputFilePath, m_ast);

        this->m_inputFilePath = inputFilePath;
    }

    ~ICM()
    {
        delete m_lexer;
        delete m_parser;
        delete m_ast;
        delete m_asm;
    }

public:
    void compile(bool withoutLexer = false, bool withoutParser = false,
                 bool withoutSymantic = false, bool withoutGenerate = false)
    {
        cout << "-- Started compilation of the file \"" << m_inputFilePath << "\'" << endl;

        try
        {
            if (!withoutLexer)
            {
                m_lexer->split();
                m_lexer->printTokens();
            }

            if (!withoutParser)
            {
                m_parser->parse();

                if (!withoutSymantic)
                {
                    m_parser->check();
                }

                m_parser->printTree();
            }

            if (!withoutGenerate)
            {
                m_asm->generate();
            }
        }
        catch (const std::logic_error& error)
        {
            rang::setControlMode(rang::control::Force);
            rang::setWinTermMode(rang::winTerm::Auto);

            std::cout << "\n";
            std::cout << rang::fgB::red << rang::style::bold <<
            "An error occurred while compiling file "
            << rang::fg::reset << rang::style::reset <<

            rang::fg::gray << rang::style::italic <<
            m_inputFilePath
            << rang::fg::reset << rang::style::reset <<
            ":" << std::endl;

            std::cout << rang::fgB::red << rang::style::bold <<
            error.what()
            << rang::fg::reset << rang::style::reset << std::endl;
        }
    }

public:
    _NODISCARD Lexer* lexer() const noexcept
    {
        return m_lexer;
    }

    _NODISCARD Parser* parser() const noexcept
    {
        return m_parser;
    }

    _NODISCARD Ast* ast() const noexcept
    {
        return m_ast;
    }

    _NODISCARD Asm* anAsm() const noexcept
    {
        return m_asm;
    }
};

}