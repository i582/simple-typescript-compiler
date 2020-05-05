#pragma once

#include <map>
#include <variant>

#include "../../variable/Variable.h"
#include "../../function/Function.h"

namespace stc
{
using std::map;
using std::variant;

using ExportValue = variant<Variable*, Function*>;

enum class ExportValueType
{
    VARIABLE,
    FUNCTION
};

class ExportTable
{
private:
    map<string, ExportValue> m_exportTable;

public:
    ExportTable() = default;

public:
    void add(const string& name, const ExportValue& value)
    {
        m_exportTable.insert(std::make_pair(name, value));
    }


public:
    _NODISCARD bool contains(const string& name) const
    {
        return m_exportTable.find(name) != m_exportTable.end();
    }

public:
    _NODISCARD ExportValue get(const string& name) const
    {
        return m_exportTable.at(name);
    }

public:
    static ExportValueType typeOfValue(const ExportValue& value)
    {
        ExportValueType type = ExportValueType::VARIABLE;

        std::visit(overload {
            [&](Variable* n)
            {
                type = ExportValueType::VARIABLE;
            },
            [&](Function* s)
            {
                type = ExportValueType::FUNCTION;
            }
        }, value);

        return type;
    }

};

}