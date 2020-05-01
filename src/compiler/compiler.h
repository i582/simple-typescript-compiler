#pragma once

#include "../parser/Parser.h"

namespace stc
{

class Compiler
{
public:
    static void compile(const std::string& inputFile, const std::string& outputFile)
    {
        stc::Lexer lexer(inputFile);
        lexer.split();
        lexer.print_tokens();

        stc::Parser parser(&lexer);
        parser.parse();
        parser.check();
        parser.printTree();

//        stc::Asm an_asm(outputFile, parser.ast());
//        an_asm.generate();
    }
};

}
