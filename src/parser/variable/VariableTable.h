#pragma once

#include <algorithm>
#include <vector>
#include <tuple>
#include "Variable.h"
#include "../../errorHandle/errorHandle.h"

namespace stc
{

using std::vector;
using std::tuple;

class VariableTable
{
private:
    size_t m_scopeId;

    vector<Variable*> m_variables;
    VariableTable* m_parent;


public:
    explicit VariableTable(size_t scopeId);
    VariableTable();

    ~VariableTable();

public:
    _NODISCARD size_t scopeId() const;


    void setParent(VariableTable* parent);
    void add(Variable* variable);


    _NODISCARD Variable* getByName(const string& name) const;
    _NODISCARD tuple<size_t, Variable*> getVariableAndScopeIdWhereItDeclared(const string& name) const;
    _NODISCARD Variable* getByNameAndScopeId(const string& name, size_t scopeId) const;


    _NODISCARD bool contains(const string& name) const;
    _NODISCARD bool containsGlobally(const string& name) const;


    _NODISCARD const vector<Variable*>& raw() const;


public:
    void print() const;

};

}