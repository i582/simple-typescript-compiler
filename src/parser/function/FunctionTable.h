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
    void add(Function* function);
    bool contains(Function* function) const;
    bool contains(const string& name) const;


    Function* get(const string& name, const vector<ArgumentType>& argumentDescriptions) const;
    Function* get(const string& name) const;


    void clear();

    _NODISCARD const vector<Function*>& raw() const;

public:
    void print() const;

};

}