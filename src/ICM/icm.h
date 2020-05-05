#pragma once

#include "../lexer/Lexer.h"
#include "../parser/Parser.h"
#include "../parser/ast/Ast.h"
#include "../analyzer/Analyzer.h"
#include "../parser/asm/Asm.h"
#include "../log/Log.h"
#include "../rang.hpp"

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

    Analyzer* m_analyzer;

    string m_inputFilePath;
    string m_outputFilePath;

    bool m_debugMode;

public:
    ICM(const string& inputFilePath, const string& outputFilePath, bool debugMode = false)
    {
        this->m_lexer = nullptr;
        this->m_parser = nullptr;
        this->m_ast = nullptr;
        this->m_asm = nullptr;
        this->m_analyzer = nullptr;

        this->m_inputFilePath = inputFilePath;
        this->m_outputFilePath = outputFilePath;
        this->m_debugMode = debugMode;
    }

    ~ICM()
    {
        delete m_lexer;
        delete m_parser;
        delete m_ast;
        delete m_asm;
        delete m_analyzer;
    }

public:
    bool compile(bool withoutLexer = false, bool withoutParser = false,
                 bool withoutSymantic = false, bool withoutGenerate = false)
    {
        Log::write("-- Started compilation of the file \"" + m_inputFilePath + "\'\n");

        try
        {
            this->m_lexer = new Lexer(m_inputFilePath, m_debugMode);
            this->m_parser = new Parser(m_lexer, m_debugMode);
            this->m_ast = m_parser->ast();
            this->m_asm = new Asm(m_outputFilePath, m_ast, m_debugMode);

            this->m_analyzer = new Analyzer(m_ast);

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

            m_analyzer->identifyBaseBlocks();


//            if (!withoutGenerate)
//            {
//                m_asm->generate();
//            }

            return true;
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

            return false;
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