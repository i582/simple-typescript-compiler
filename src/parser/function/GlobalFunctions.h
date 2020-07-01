#pragma once
#include <map>
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
    map<string, string> m_assemblerImplementations;

public:
    static bool isGlobalFunction(const string& name);

public:
    static Function* get(const string& name, const vector<ArgumentType>& argumentsDescription);
    static Function* get(const string& name);
    static bool contains(Function* function);
    static bool contains(const string& name);

    static string getAssemblerImplementation(const string& name);

    static string mallocFunction(const string& value);
    static string callocFunction(const string& value);

private:
    void init();
    void initAssemblerImplementations();
};

}