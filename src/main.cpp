#include "parser/parser.h"


int main()
{
    compiler::parser parse("test.ts");
    parse.parse();
    parse.generate();

    return 0;
}


