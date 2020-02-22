#include "parser/parser.h"

int main()
{
    compiler::parser parse("test.ts");
    parse.parse();

    return 0;
}


