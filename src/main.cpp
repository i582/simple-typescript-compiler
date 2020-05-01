#include "compiler/compiler.h"

int main(int argc, char** argv)
{
//    if (argc <= 1)
//    {
//        std::cout << "Usage: <input_file> <output_file>" << std::endl;
//    }
//    else
//    {
//        std::string inputFile(argv[1]);
//        std::string outputFile(argv[2]);
//
//
//        auto begin = std::chrono::steady_clock::now();
//
//
//        compiler::Parser parser(inputFile, outputFile);
//        parser.parse();
//        parser.generate();
//
//
//        auto end = std::chrono::steady_clock::now();
//
//        auto elapsed_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - begin);
//        std::cout << "The time: " << elapsed_ms.count() << " ms\n";
//    }

    //stc::Compiler::compile("../test_programs/factorial.ts", "test.asm");


    stc::Lexer lexer("../test_programs/classes.ts");
    lexer.split();
    lexer.print_tokens();

    stc::Parser parser(&lexer);
    parser.parse();
    parser.check();
    parser.printTree();
//
//    stc::Asm an_asm("test.asm", parser.ast());
//    an_asm.generate();

    return 0;
}


