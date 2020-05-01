#pragma once

#include <algorithm>
#include <vector>
#include "Variable.h"
#include "tuple"

namespace stc
{
using std::vector;
using std::tuple;


class VariableTable
{
private:
    size_t m_scopeId{};

    vector<Variable> m_variables;
    VariableTable* m_parent{};


public:
    VariableTable() = default;
    explicit VariableTable(size_t scopeId);


public:
    void setParentTable(VariableTable* parent) noexcept;

public:
    void add(const Variable& variable);

public:
    _NODISCARD Variable& getByName(const string& variable);
    _NODISCARD tuple<size_t, Variable*> getVariableAndScopeIdWhereItDeclared(const string& name);
    _NODISCARD Variable& getByNameAndScopeId(const string& name, size_t block_id);


public:
    _NODISCARD bool contains(const string& variable) const;
    _NODISCARD bool containsGlobally(const string& name) const;



public:
    _NODISCARD size_t scopeId() const noexcept;
    _NODISCARD const vector<Variable>& raw() const;


public:
    void print() const noexcept;

};

}