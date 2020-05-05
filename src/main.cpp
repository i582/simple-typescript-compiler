#include "ICM/icm.h"
#include "clipp.h"

#include "log/Log.h"
using namespace stc;

using namespace clipp;

namespace fs = std::filesystem;

int main(int argc, char** argv)
{
    std::string inputFile, outputFile;
    bool debugMode = false;
    bool help = false;
    bool timeCompilation = false;

    std::string logFile;

    auto cli = (
            (
                value("input file", inputFile),
                option("-o") & value("output file", outputFile) % "output asm file",
                option("-d", "--debug").set(debugMode) & opt_value("log file", logFile) % "debug mode",
                option("-t", "--time").set(timeCompilation) % "show compilation time"
            ) % "compilation"
            |
            (
                option("-h", "--help").set(help) % "show this page"
            )
    );

    if(!parse(argc, argv, cli))
    {
        std::cout << make_man_page(cli, argv[0]);
    }
    else
    {
        stc::Log::setLogInFile(debugMode);
        stc::Log::setLogInOutputStream(debugMode);

        if (!logFile.empty())
        {
            stc::Log::setLogFile(logFile);
        }

        if (outputFile.empty())
        {
            fs::path inputFilePath(inputFile);
            inputFilePath.replace_extension("asm");
            outputFile = inputFilePath.string();
        }


        auto begin = std::chrono::steady_clock::now();




        stc::ICM icm(inputFile, outputFile, true);

        std::cout << "Compilation of the program ";

        std::cout << rang::fg::gray << rang::style::italic
        << inputFile
        << rang::fg::reset << rang::style::reset
        << std::endl;

        bool result = icm.compile();


        if (result)
        {
            std::cout << rang::fgB::green << rang::style::bold
                      << "Compilation of program completed successfully"
                      << rang::fg::reset << rang::style::reset << std::endl;
        }


        auto end = std::chrono::steady_clock::now();

        auto elapsed_ms = std::chrono::duration_cast<std::chrono::milliseconds>(end - begin);
        auto elapsed_mcs = std::chrono::duration_cast<std::chrono::microseconds>(end - begin);

        if (timeCompilation)
        {
            Log::write("Compilation time: " + std::to_string(elapsed_ms.count()) + " ms (" + std::to_string(elapsed_mcs.count()) + " mcs)\n");
        }

        if (help)
        {
            std::cout << make_man_page(cli, argv[0]);
        }
    }

    return 0;
}