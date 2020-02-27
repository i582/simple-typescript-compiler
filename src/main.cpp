#include "parser/parser.h"

int main()
{
//    compiler::lexer lex("test.ts");
//    lex.parse();
//    lex.print_tokens();

    compiler::parser parse("test.ts");
    parse.parse();

    return 0;
}


