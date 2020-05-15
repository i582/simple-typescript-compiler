#pragma once
#include "FunctionTable.h"

namespace stc
{

class GlobalFunctions
{
private:
    GlobalFunctions();
    ~GlobalFunctions();

public:
    static GlobalFunctions& i();

private:
    static GlobalFunctions* m_functions;

private:
    FunctionTable m_table;


public:
    static bool isGlobalFunction(const string& name);

public:
    static Function* get(const string& name, const vector<ArgumentType>& argumentsDescription);
    static Function* get(const string& name);
    static bool contains(Function* function);
    static bool contains(const string& name);


private:
    void init();
};

}