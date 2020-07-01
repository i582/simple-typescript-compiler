#pragma once


#include "../lexer/Lexer2.h"
#include "../parser/Parser.h"
#include "../parser/ast/Ast.h"
#include "../analyzer/Analyzer.h"
#include "../parser/asm/asm.h"
#include "../log/Log.h"
#include "../rang.hpp"

namespace stc
{

// integrated compilation module
class Icm
{
private:
    Lexer2* m_lexer2;
    Parser* m_parser;
    Ast* m_ast;
    Asm* m_asm;

    Analyzer* m_analyzer;

    string m_inputFilePath;
    string m_outputFilePath;


public:
    Icm(const string& inputFilePath, const string& outputFilePath)
    {
        this->m_lexer2 = nullptr;
        this->m_parser = nullptr;
        this->m_ast = nullptr;
        this->m_asm = nullptr;
        this->m_analyzer = nullptr;

        this->m_inputFilePath = inputFilePath;
        this->m_outputFilePath = outputFilePath;
    }

    ~Icm()
    {
        delete m_lexer2;
        delete m_parser;
        delete m_ast;
        delete m_asm;
        delete m_analyzer;
    }

public:
    bool compile(bool withoutLexer = false, bool withoutParser = false,
                 bool withoutSemantic = false, bool withoutGenerate = false)
    {
        Log::write("-- Started compilation of the file \"" + m_inputFilePath + "\'\n");

        try
        {
            this->m_lexer2 = new Lexer2(m_inputFilePath);
            this->m_parser = new Parser(m_lexer2);
            this->m_ast = m_parser->ast();
            this->m_asm = new Asm(m_outputFilePath, m_ast);

            this->m_analyzer = new Analyzer(m_ast);


            if (!withoutLexer)
            {
                m_lexer2->split();
                m_lexer2->print();
            }

            if (!withoutParser)
            {
                m_parser->parse();

                if (!withoutSemantic)
                {
                    m_ast->analyze();
                }

                m_parser->printTree();
            }

           // m_analyzer->identifyBaseBlocks();


            if (!withoutGenerate)
            {
                m_asm->generate();
            }

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
            ":" << std::endl << std::endl;


            const auto loggedInStream = Log::loggedInOutputStream();
            Log::setLogInOutputStream(true);


            ErrorHandle::reports().print();
            ErrorHandle::reports().clear();

            Log::setLogInOutputStream(loggedInStream);

            std::cerr << rang::fgB::red << rang::style::bold <<

            error.what();
            std::cerr << rang::fg::reset << rang::style::reset << std::endl;

            return false;
        }
    }

public:
    _NODISCARD Lexer2* lexer() const noexcept
    {
        return m_lexer2;
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