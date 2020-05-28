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

    fs::path outputFilePath;
    fs::path inputFilePath;


    auto debugMode = false;
    auto run = false;
    auto showHelp = false;
    auto showTimeCompilation = false;
    auto showAbout = false;
    auto updateMode = false;

    auto cli = (
        (
            value("input file", inputFile),
            option("-o") & value("output file", outputFile) % "output asm file",
            option("-r", "--run").set(run) & opt_value("run", logFile) % "run",
            option("-d", "--debug").set(debugMode) & opt_value("log file", logFile) % "debug mode",
            option("-t", "--time").set(showTimeCompilation) % "show compilation time",
            option("-r", "--run").set(run) % "compile and run asm",
            option("-u", "--update").set(updateMode) % "compilation occurs every time the file is updated"
        ) % "compilation"
        |
        (
            option("-h", "--help").set(showHelp) % "show this page"
        )
        |
        (
            option("-a", "--about").set(showAbout) % "about compiler"
        )
    );

    if (!parse(argc, argv, cli))
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
            outputFilePath = fs::path(inputFile);
            outputFilePath.replace_extension("asm");
            outputFile = outputFilePath.string();
        }
        else
        {
            outputFilePath = fs::path(outputFile);
        }


        if (!inputFile.empty())
        {

            inputFilePath = fs::path(inputFile);

            auto time = fs::last_write_time(inputFilePath);

            auto lastUpdate = chrono::duration_cast<chrono::milliseconds>(time.time_since_epoch()).count();
            auto currentUpdate = chrono::duration_cast<chrono::milliseconds>(time.time_since_epoch()).count();
            currentUpdate = 0;

            do
            {

                if (lastUpdate == currentUpdate)
                {
                    time = fs::last_write_time(inputFilePath);
                    currentUpdate = chrono::duration_cast<chrono::milliseconds>(time.time_since_epoch()).count();

                    Sleep(100);
                    continue;
                }
                else
                {
                    if (currentUpdate == 0)
                    {
                        currentUpdate = chrono::duration_cast<chrono::milliseconds>(time.time_since_epoch()).count();
                    }

                    lastUpdate = currentUpdate;
                }


                ICM icm(inputFile, outputFile);

                cout << "Typescript to MASM compiler, v0.1 (c) 2020 \n\n";
                cout << "-- Compilation of the program ";

                cout << fg::gray << style::italic
                     << inputFile
                     << fg::reset << style::reset
                     << endl;

                const auto begin = chrono::steady_clock::now();


                const auto result = icm.compile(false, false, false, false);


                const auto end = chrono::steady_clock::now();

                auto elapsed_ms = chrono::duration_cast<chrono::milliseconds>(end - begin);
                auto elapsed_mcs = chrono::duration_cast<chrono::microseconds>(end - begin);

                if (result)
                {
                    cout << fgB::green << style::bold
                         << "Compilation of program completed successfully"
                         << fg::reset << style::reset << endl << endl;


                    if (run)
                    {
                        cout << "MASM Compile\n";

                        system("ml /c /coff /nologo test.asm");
                        system("link /nologo /subsystem:console test.obj");

                        cout << "\nOutput:\n";
                        system("test.exe");
                        //ShellExecute(NULL, NULL, "test.exe", NULL, NULL, SW_NORMAL);
                        //startup("test.exe", argv);

                        cout << "\n\n";

                    }
                }




                if (showTimeCompilation)
                {
                    Log::setLogInOutputStream(true);
                    Log::write("Compilation time: " + to_string(elapsed_ms.count()) + " ms (" +
                               to_string(elapsed_mcs.count()) + " mcs)\n");
                    Log::setLogInOutputStream(false);
                }


                if (updateMode)
                {
                    cout << "Waiting for file update...\n\n";
                }



                Sleep(100);

            } while (updateMode);

        }

        if (showHelp)
        {
            cout << make_man_page(cli, argv[0]);
        }

        if (showAbout)
        {
            cout << "Typescript to MASM compiler, v0.1 (c) 2020 \n\n";
            cout << "Designed by Petr Makhnev i582 BSTU \"Voenmeh\"." << endl;
        }



    }

    //../testPrograms/factorial.ts

    return 0;
}