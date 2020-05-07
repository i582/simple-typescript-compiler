#pragma once

#include "Function.h"
#include "../../errorHandle/errorHandle.h"

namespace stc
{

class FunctionTable
{
private:
    vector<Function*> m_functions;

public:
    FunctionTable() = default;
    ~FunctionTable();

public:
    void add(Function* new_function);
    bool contains(Function* function);
    bool contains(const string& name);


    Function* get(const string& name, const vector<ArgumentType>& argumentDescriptions);
    Function* get(const string& name);


    void clear();

    _NODISCARD const vector<Function*>& raw() const;

public:
    void print() const;

};

}