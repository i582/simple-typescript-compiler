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
    bool contains(const string& function);


    Function* get(const string& function, const vector<ArgumentType>& argumentDescriptions);
    Function* get(const string& function);


    void clear();

    _NODISCARD const vector<Function*>& raw() const;

public:
    void print() const;

};

}