#include "ICM/icm.h"
#include "clipp.h"

using namespace stc;
using namespace clipp;
using namespace rang;
using namespace std;

namespace fs = filesystem;

int main(int argc, char** argv)
{
    string inputFile;
    string outputFile;
    string logFile;

    bool debugMode = false;
    bool showHelp = false;
    bool showTimeCompilation = false;

    

    auto cli = (
        (
            value("input file", inputFile),
            option("-o") & value("output file", outputFile) % "output asm file",
            option("-d", "--debug").set(debugMode) & opt_value("log file", logFile) % "debug mode",
            option("-t", "--time").set(showTimeCompilation) % "show compilation time"
        ) % "compilation"
        |
        (
                option("-h", "--help").set(showHelp) % "show this page"
        )
    );

    if(!parse(argc, argv, cli))
    {
        cout << make_man_page(cli, argv[0]);
    }
    else
    {
        Log::setLogInFile(debugMode);
        Log::setLogInOutputStream(debugMode);

        if (!logFile.empty())
        {
            Log::setLogFile(logFile);
        }

        if (outputFile.empty())
        {
            fs::path inputFilePath(inputFile);
            inputFilePath.replace_extension("asm");
            outputFile = inputFilePath.string();
        }


        ICM icm(inputFile, outputFile, true);

        cout << "Typescript to MASM compiler, v0.1 (c) 2020 \n\n";
        cout << "-- Compilation of the program ";

        cout << fg::gray << style::italic
                  << inputFile
                  << fg::reset << style::reset
                  << endl;

        auto begin = chrono::steady_clock::now();


        bool result = icm.compile(false, false, false, true);


        auto end = chrono::steady_clock::now();

        auto elapsed_ms = chrono::duration_cast<chrono::milliseconds>(end - begin);
        auto elapsed_mcs = chrono::duration_cast<chrono::microseconds>(end - begin);

        if (result)
        {
            cout << fgB::green << style::bold
                      << "Compilation of program completed successfully"
                      << fg::reset << style::reset << endl;
        }


        if (showTimeCompilation)
        {
            Log::setLogInOutputStream(true);
            Log::write("Compilation time: " + to_string(elapsed_ms.count()) + " ms (" + to_string(elapsed_mcs.count()) + " mcs)\n");
            Log::setLogInOutputStream(false);
        }

        if (showHelp)
        {
            cout << make_man_page(cli, argv[0]);
        }
    }

    return 0;
}