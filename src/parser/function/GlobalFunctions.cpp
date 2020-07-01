#include "GlobalFunctions.h"

stc::GlobalFunctions* stc::GlobalFunctions::m_functions = nullptr;

stc::GlobalFunctions::GlobalFunctions()
{
    this->m_table = FunctionTable();

    this->init();
    this->initAssemblerImplementations();
}

stc::GlobalFunctions::~GlobalFunctions()
{
    m_table.clear();
}

void stc::GlobalFunctions::initAssemblerImplementations()
{
    m_assemblerImplementations.insert(std::make_pair("input",
                                                     "input PROC\n"
                                                     "   enter 16, 0\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx\n"
                                                     "   invoke crt_scanf, offset input_format, offset input_result\n"
                                                     "   mov eax, input_result\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx\n"
                                                     "   leave\n"
                                                     "   ret \n"
                                                     "input ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("print",
                                                     "print PROC\n"
                                                     "   enter 4, 0\n"
                                                     "   push eax\n"
                                                     "   mov eax, [ebp + 8]\n"
                                                     "   invoke crt_printf, offset print_format, eax\n"
                                                     "   pop eax\n"
                                                     "   leave\n"
                                                     "   ret 4\n"
                                                     "print ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("println",
                                                     "println PROC\n"
                                                     "   enter 20, 0\n"
                                                     "   push eax\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx\n"
                                                     "   mov eax, [ebp + 8]\n"
                                                     "   invoke crt_printf, offset println_format, eax\n"
                                                     "   pop eax\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx\n"
                                                     "   leave\n"
                                                     "   ret 4\n"
                                                     "println ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("sqrt",
                                                     "sqrt PROC\n"
                                                     "   enter 0, 0\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx\n"
                                                     "   mov eax, [ebp + 8]\n"
                                                     "   mov sqrt_result, eax\n"
                                                     "   finit\n"
                                                     "   fild sqrt_result\n"
                                                     "   fsqrt\n"
                                                     "   fist sqrt_result\n"
                                                     "   mov eax, sqrt_result\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx\n"
                                                     "   leave\n"
                                                     "   ret 4\n"
                                                     "sqrt ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("concat",
                                                     "concat PROC\n"
                                                     "   enter 40, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx"
                                                     "\n"
                                                     "   mov ecx, [ebp + 8] ; указатель на первую строку\n"
                                                     "   mov edx, [ebp + 12] ; указатель на вторую строку\n"
                                                     "\n"
                                                     "   push [ebp + 8]\n"
                                                     "   call crt_strlen\n"
                                                     "   push eax ; узнаем длину первой строки и помещаем ее в стек\n"
                                                     "\n"
                                                     "\n"
                                                     "   push [ebp + 12]\n"
                                                     "   call crt_strlen\n"
                                                     "   push eax ; узнаем длину второй строки и помещаем ее в стек\n"
                                                     "\n"
                                                     "\n"
                                                     "   pop ecx\n"
                                                     "   pop edx\n"
                                                     "   add ecx, edx ; узнаем общую длину строк\n"
                                                     "   add ecx, 1 ; добавляем место под нуль-терминатор\n"
                                                     "   push ecx\n"
                                                     "\n"
                                                     "\n"
                                                     + mallocFunction("") +
                                                     "   ;call crt_malloc ; выделяем память под строку\n"
                                                     "   push eax ; сохраняем указатель на память в стеке\n"
                                                     "\n"
                                                     "\n"
                                                     "   pop eax\n"
                                                     "   push [ebp + 8] ; указатель на строку, которая копируется (1 строка)\n"
                                                     "   push eax ; указатель на начало выделенной памяти\n"
                                                     "   call crt_strcat ; копируем\n"
                                                     "   push eax\n"
                                                     "\n"
                                                     "   pop eax\n"
                                                     "   push [ebp + 12] ; указатель на строку, которая копируется (2 строка)\n"
                                                     "   push eax ; указатель на начало выделенной памяти\n"
                                                     "   call crt_strcat ; копируем\n"
                                                     "   push eax\n"
                                                     "   pop eax\n"
                                                     "\n"
                                                     "   ; теперь в ecx лежит строка содержащая объединенные две входные строки\n"
                                                     "\n"
                                                     "\n"

                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 8\n"
                                                     "concat ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("slice",
                                                     "slice PROC\n"
                                                     "   enter 0, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx"
                                                     "\n"
                                                     "   cmp DWORD PTR [ebp + 8], 0\n"
                                                     "   je _error_end ; передан нулевой указатель\n"
                                                     "\n"
                                                     "   push [ebp + 8]\n"
                                                     "   call crt_strlen\n"
                                                     "   mov edx, eax ; в edx теперь хранится длина строки\n"
                                                     "\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   mov ebx, DWORD PTR [ebp + 16]\n"
                                                     "   cmp eax, ebx\n"
                                                     "   jg _swap_start_and_end\n"
                                                     "   jl _no_swap_start_and_end\n"
                                                     "\n"
                                                     "_swap_start_and_end:\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   mov ebx, DWORD PTR [ebp + 16]\n"
                                                     "   \n"
                                                     "   mov DWORD PTR [ebp + 12], ebx\n"
                                                     "   mov DWORD PTR [ebp + 16], eax\n"
                                                     "\n"
                                                     "\n"
                                                     "_no_swap_start_and_end:\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   cmp eax, 0\n"
                                                     "   jl _error_end ; если начало меньше ноля\n"
                                                     "\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   cmp eax, edx\n"
                                                     "   jg _error_end ; если начало больше или равен длине строки\n"
                                                     "\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   cmp eax, 0\n"
                                                     "   jl _error_end ; если конец меньше ноля\n"
                                                     "\n"
                                                     "   cmp [ebp + 16], edx\n"
                                                     "   jg _error_end ; если конец больше или равен длине строки\n"
                                                     "\n"
                                                     "   push edx\n"
                                                     "\n"
                                                     "   mov ebx, [ebp + 16]\n"
                                                     "   sub ebx, [ebp + 12] ; находим длину среза\n"
                                                     "   add ebx, 1 ; добавляем место для нуля-терминатора\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     + callocFunction("") +
                                                     "   ;call crt_calloc ; выделяем память под срех\n"
                                                     "   push eax ; сохраняем указатель на память в стеке\n"
                                                     "   \n"
                                                     "   pop ecx ; указатель на память\n"
                                                     "   pop ebx ; длина среза\n"
                                                     "   \n"
                                                     " \n"
                                                     "   mov edx, DWORD PTR [ebp + 8]\n"
                                                     "   add edx, DWORD PTR [ebp + 12]\n"
                                                     "   sub edx, 0 ; вычитаем 1, чтобы начать с нужного символа\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push edx\n"
                                                     "   push ecx\n"
                                                     "   call crt_strncpy\n"
                                                     "   push eax\n"
                                                     "\n"
                                                     "\n"
                                                     "   add eax, ebx\n"
                                                     "   mov DWORD PTR [eax], 0\n"
                                                     "   pop eax\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 12\n"
                                                     "\n"
                                                     "_error_end:\n"
                                                     "   mov eax, 0\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 12\n"
                                                     "slice ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("strlen",
                                                     "strlen PROC\n"
                                                     "   enter 0, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx"
                                                     "\n"
                                                     "   push DWORD PTR [ebp + 8]\n"
                                                     "   call crt_strlen\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 4\n"
                                                     "strlen ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("at",
                                                     "at PROC\n"
                                                     "   enter 0, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx"
                                                     "\n"
                                                     "   cmp DWORD PTR [ebp + 8], 0\n"
                                                     "   je _error_end ; передан нулевой указатель\n"
                                                     "\n"
                                                     "   push DWORD PTR [ebp + 8]\n"
                                                     "   call crt_strlen\n"
                                                     "   mov edx, eax ; в edx теперь хранится длина строки\n"
                                                     "\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   cmp eax, 0\n"
                                                     "   jl _error_end ; если индекс меньше ноля\n"
                                                     "\n"
                                                     "   mov eax, DWORD PTR [ebp + 12]\n"
                                                     "   cmp eax, edx\n"
                                                     "   jge _error_end ; если индекс больше или равен длине строки\n"
                                                     "   \n"
                                                     "\n"
                                                     "   push 2\n"
                                                     + callocFunction("") +
                                                     "   ;call crt_calloc ; выделяем память под символ с нулем терминатором\n"
                                                     "   push eax ; сохраняем указатель на память в стеке\n"
                                                     "\n"
                                                     "\n"
                                                     "   mov edx, DWORD PTR [ebp + 8]\n"
                                                     "   add edx, DWORD PTR [ebp + 12]\n"
                                                     "\n"
                                                     "   mov ecx, DWORD PTR [edx]\n"
                                                     "   mov DWORD PTR [eax], ecx\n"
                                                     "\n"
                                                     "\n"
                                                     "   push eax\n"
                                                     "\n"
                                                     "   mov ebx, 0\n"
                                                     "   add eax, 1\n"
                                                     "   mov DWORD PTR [eax], ebx\n"
                                                     "\n"
                                                     "   pop eax\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 8\n"
                                                     "\n"
                                                     "_error_end:\n"
                                                     "   mov eax, 0\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 8\n"
                                                     "\n"
                                                     "at ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("find",
                                                     "find PROC\n"
                                                     "   enter 0, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx"
                                                     "\n"
                                                     "   push [ebp + 12]\n"
                                                     "   push [ebp + 8]\n"
                                                     "   call crt_strstr\n"
                                                     "\n"
                                                     "   cmp eax, 0\n"
                                                     "   je _not_found\n"
                                                     "\n"
                                                     "   mov ebx, [ebp + 8]\n"
                                                     "   sub eax, ebx\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 8\n"
                                                     "\n"
                                                     "_not_found:\n"
                                                     "   mov eax, -1\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 8\n"
                                                     "find ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("toString",
                                                     "toString PROC\n"
                                                     "   enter 40, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx"
                                                     "\n"
                                                     "   push 20\n"
                                                     + callocFunction("") +
                                                     "   ;call crt_malloc\n"
                                                     "   mov ebx, eax\n"
                                                     "    \n"
                                                     "   push [ebp + 12]\n"
                                                     "   push ebx\n"
                                                     "   push [ebp + 8]\n"
                                                     "   call crt__itoa\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx\n"
                                                     "   leave\n"
                                                     "   ret 8\n"
                                                     "toString ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("toNumber",
                                                     "toNumber PROC\n"
                                                     "   enter 0, 0\n"
                                                     "\n"
                                                     "   push ebx\n"
                                                     "   push ecx\n"
                                                     "   push edx\n"
                                                     "\n"
                                                     "   push [ebp + 8]\n"
                                                     "   call crt_atoi\n"
                                                     "\n"
                                                     "\n"
                                                     "   pop ebx\n"
                                                     "   pop ecx\n"
                                                     "   pop edx\n"
                                                     "\n"
                                                     "   leave\n"
                                                     "   ret 4\n"
                                                     "toNumber ENDP\n"));

    m_assemblerImplementations.insert(std::make_pair("strEqual",
                                                     "strEqual PROC\n"
                                                     "   enter 0, 0\n"

                                                     "   push [ebp + 8]\n"
                                                     "   push [ebp + 12]\n"
                                                     "   call crt_strcmp\n"
                                                     "   cmp eax, 0\n"
                                                     "   je __stringEqual\n"
                                                     "   jne __stringNotEqual\n"
                                                     "__stringEqual:\n"
                                                     "   mov eax, 1\n"
                                                     "   jmp __stringEnd\n"
                                                     "__stringNotEqual:\n"
                                                     "   mov eax, 0\n"
                                                     "__stringEnd:\n"
                                                     "   leave\n"
                                                     "   ret 4\n"
                                                     "strEqual ENDP\n"));
}

void stc::GlobalFunctions::init()
{
    auto newFunction = new Function("Array", Type(FundamentalType::Any), {Type(FundamentalType::Number)});
    m_table.add(newFunction);

    newFunction = new Function("input", Type(FundamentalType::Number), {});
    m_table.add(newFunction);

    newFunction = new Function("print", Type(FundamentalType::Void), {Type(FundamentalType::Number)});
    m_table.add(newFunction);

    newFunction = new Function("println", Type(FundamentalType::Void), {Type(FundamentalType::Symbol, true)});
    m_table.add(newFunction);

    newFunction = new Function("sqrt", Type(FundamentalType::Number), {Type(FundamentalType::Number)});
    m_table.add(newFunction);

    newFunction = new Function("concat", Type(FundamentalType::Symbol, true),
                               {Type(FundamentalType::Symbol, true), Type(FundamentalType::Symbol, true)});
    m_table.add(newFunction);

    newFunction = new Function("slice", Type(FundamentalType::Symbol, true),
                               {Type(FundamentalType::Symbol, true), Type(FundamentalType::Number), Type(
                                       FundamentalType::Number)
                               });
    m_table.add(newFunction);

    newFunction = new Function("strlen", Type(FundamentalType::Number), {Type(FundamentalType::Symbol, true)});
    m_table.add(newFunction);

    newFunction = new Function("at", Type(FundamentalType::Symbol, true),
                               {Type(FundamentalType::Symbol, true), Type(FundamentalType::Number)});
    m_table.add(newFunction);

    newFunction = new Function("find", Type(FundamentalType::Number),
                               {Type(FundamentalType::Symbol, true), Type(FundamentalType::Symbol, true)});
    m_table.add(newFunction);

    newFunction = new Function("toString", Type(FundamentalType::Symbol, true),
                               {Type(FundamentalType::Number), Type(FundamentalType::Number)});
    m_table.add(newFunction);

    newFunction = new Function("toNumber", Type(FundamentalType::Number), {Type(FundamentalType::Symbol, true)});
    m_table.add(newFunction);

    newFunction = new Function("strEqual", Type(FundamentalType::Boolean),
                               {Type(FundamentalType::Symbol, true), Type(FundamentalType::Symbol, true)});
    m_table.add(newFunction);

    newFunction = new Function("crt_cos", Type(FundamentalType::Number), {Type(FundamentalType::Number)});
    m_table.add(newFunction);


    newFunction = new Function("merge", Type(FundamentalType::Number, true),
                               {Type(FundamentalType::Number, true), Type(FundamentalType::Number, true)});
    m_table.add(newFunction);


}

stc::Function* stc::GlobalFunctions::get(const std::string& name,
                                         const std::vector<stc::ArgumentType>& argumentsDescription)
{
    auto instance = i();
    return instance.m_table.get(name, argumentsDescription);
}


stc::Function* stc::GlobalFunctions::get(const std::string& name)
{
    auto instance = i();
    return instance.m_table.get(name);
}

bool stc::GlobalFunctions::contains(stc::Function* function)
{
    auto instance = i();
    return instance.m_table.contains(function);
}

bool stc::GlobalFunctions::contains(const std::string& name)
{
    auto instance = i();

    return instance.m_table.contains(name);
}

stc::GlobalFunctions& stc::GlobalFunctions::i()
{
    if (m_functions == nullptr)
        m_functions = new GlobalFunctions();

    return *m_functions;
}

bool stc::GlobalFunctions::isGlobalFunction(const std::string& name)
{
    return stc::GlobalFunctions::m_functions->contains(name);
}

std::string stc::GlobalFunctions::getAssemblerImplementation(const std::string& name)
{
    if (i().m_assemblerImplementations.find(name) == i().m_assemblerImplementations.end())
    {
        return "";
    }

    return i().m_assemblerImplementations[name];
}

std::string stc::GlobalFunctions::mallocFunction(const string& value)
{
    const auto pushLine = string("   push " + value + "\n");

    return (value.empty() ? "" : pushLine) +
           "   call crt_malloc\n"
           "   pop ecx\n"
           "   mov edi, offset memoryManagerPointers\n"
           "   mov edx, memoryManagerCurrentIndex\n"
           "   imul edx, 4\n"
           "   add edi, edx\n"
           "   mov DWORD PTR [edi], eax\n"
           "   add memoryManagerCurrentIndex, 1\n";
}

std::string stc::GlobalFunctions::callocFunction(const string& value)
{
    const auto pushLine = string("   push " + value + "\n");

    return (value.empty() ? "" : pushLine) +
           "   call crt_calloc\n"
           "   pop ecx\n"
           "   mov edi, offset memoryManagerPointers\n"
           "   mov edx, memoryManagerCurrentIndex\n"
           "   imul edx, 4\n"
           "   add edi, edx\n"
           "   mov DWORD PTR [edi], eax\n"
           "   add memoryManagerCurrentIndex, 1\n";
}


