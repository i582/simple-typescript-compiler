#include "ICM/icm.h"


int main(int argc, char** argv)
{
    stc::ICM icm("../testPrograms/main.ts", "test.asm");
    icm.compile();



//    try
//    {
//        stc::Lexer lexer("../testPrograms/main.ts");
//        lexer.split();
//        lexer.printTokens();
//
//        stc::Parser parser(&lexer);
//        parser.parse();
//        parser.check();
//        parser.printTree();
//
//        stc::Asm an_asm("test.asm", parser.ast());
//        an_asm.generate();
//
//

//    }
//    catch (const std::logic_error& error)
//    {
//        std::cout << "\n\n";
//        std::cout << "Error detected:" << std::endl;
//        std::cout << error.what() << std::endl;
//        std::cout << "\n\n";
//    }

    return 0;
}