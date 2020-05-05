#pragma once
#include "FunctionTable.h"

namespace stc
{

class GlobalFunctions
{
private:
    FunctionTable* m_table;

public:
    GlobalFunctions();
    ~GlobalFunctions();

public:
    Function* get(const string& name, const vector<ArgumentType>& argumentsDescription);
    bool contains(Function* function);
    bool contains(const string& name);

private:
    void init();
};

}