#pragma once

#include <string>

#include "../function/FunctionTable.h"
#include "../variable/VariableTable.h"
#include "../../log/Log.h"

namespace stc
{
using std::string;

enum class ClassVisibilityModifier
{
    PUBLIC,
    PRIVATE,
    PROTECTED
};

class Class
{
private:
    string m_name;
    FunctionTable m_functions;
    VariableTable m_fields;


public:
    explicit Class(const string& name)
    {
        this->m_name = name;
    }

public:
    bool operator==(const Class& rhs) const
    {
        return m_name == rhs.m_name;
    }

public:
    template<typename... Vals>
    void addFunction(Vals&&... vals)
    {
        m_functions.add(Function(std::forward<Vals>(vals...)));
    }

    template<typename... Vals>
    void addVariable(Vals&&... vals)
    {
        m_fields.add(Variable(std::forward<Vals>(vals...)));
    }


    void functions(const FunctionTable& functions)
    {
        m_functions = functions;
    }

    void fields(const VariableTable& fields)
    {
        m_fields = fields;
    }

public:
    void print() const noexcept
    {
        Log::write("\n");
        Log::write("Class: ");
        Log::write("'" + m_name + "'\n");
        Log::write("{\n");


        Log::write(" Variables\n");
        Log::write(" {\n");
        m_fields.print();

        if (m_fields.raw().empty())
        {
            Log::write("    void\n");
        }
        Log::write(" }\n");

        Log::write("\n");

        Log::write(" Functions\n");
        Log::write(" {\n");
        m_functions.print();

        if (m_functions.raw().empty())
        {
            Log::write("   void\n");
        }
        Log::write(" }\n");

        Log::write("\n");
    }

    _NODISCARD string toString() const
    {
        return  "{ Classname: '" + m_name +
                "'. Address: 0x" + to_string((int)this) +
                " }";
    }

public:
    _NODISCARD const string& name() const
    {
        return m_name;
    }

    _NODISCARD const FunctionTable& functions() const
    {
        return m_functions;
    }

    _NODISCARD const VariableTable& fields() const
    {
        return m_fields;
    }

    _NODISCARD size_t fieldsSize() const
    {
        return 0;
    }

public:
    static ClassVisibilityModifier modifierFromString(const string& value)
    {
        if (value == "public")
            return ClassVisibilityModifier::PUBLIC;
        if (value == "private")
            return ClassVisibilityModifier::PRIVATE;
        if (value == "protected")
            return ClassVisibilityModifier::PROTECTED;

        return ClassVisibilityModifier::PUBLIC;
    }
    static string modifierToString(ClassVisibilityModifier modifier)
    {
        switch (modifier)
        {
            case ClassVisibilityModifier::PUBLIC:
                return "public";
            case ClassVisibilityModifier::PRIVATE:
                return "private";
            case ClassVisibilityModifier::PROTECTED:
                return "protected";

            default:
                return "";
        }
    }
};

}