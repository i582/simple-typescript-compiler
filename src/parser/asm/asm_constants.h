#pragma once
#include <string>

namespace compiler
{
    using std::string;

    const string asm_header = ".586\n"
                        ".model flat, stdcall\n\n"
                        "include c:\\masm32\\include\\msvcrt.inc\n"
                        "include c:\\masm32\\include\\kernel32.inc\n"
                        "includelib c:\\masm32\\lib\\msvcrt.lib\n"
                        "includelib c:\\masm32\\lib\\kernel32.lib\n";

    const string start_data =   "data segment\n";
    const string end_data =     "data ends\n";

    const string text_start =   "text segment\n";
    const string text_end =     "text ends\n";

    const string label_start =  "__start:\n";
    const string label_end =    "end __start\n";

    const string proc_prolog =     "   push ebp\n"
                                        "   mov ebp, esp\n";

    const string proc_epilogue =   "   pop ebp\n";

    const string function_return =                  "   ret\n";

    const string tab = "   ";



    // registers
    const string eax("eax");
    const string ebx("ebx");
    const string ecx("ecx");
    const string edx("edx");
    const string esi("esi");





    const string null("0");
    const string one("1");
    const string minus_one("-1");
}