#pragma once

#include <vector>
#include "../variable/Variable.h"
#include "../node/Node.h"

namespace stc
{
using std::string;
using std::vector;

using ReturnType = VariableType;
using ArgumentType = VariableType;

class Function
{
private:
    string m_name;
    ReturnType m_returnType;
    vector<ArgumentType> m_arguments;

    size_t m_argumentsSize;
    size_t m_localVariableSize;

    vector<Variable*> m_argumentVariables;
    vector<Variable*> m_localVariables;

    Node* m_node;

public:
    Function(const string& name, ReturnType returnType, const vector<ArgumentType>& arguments, Node* m_node = nullptr,
             size_t sizeLocalVariable = 0, const vector<Variable*>& argumentVariables = {}, const vector<Variable*>& localVariables = {});


public:
    bool operator==(const Function& rhs) const;

public:
    void print() const noexcept;

public:
    _NODISCARD string name() const;
    _NODISCARD ReturnType returnType() const;
    _NODISCARD const vector<ArgumentType>& arguments() const;

    _NODISCARD string argumentsViewString() const;

    _NODISCARD size_t argumentsSize() const;
    _NODISCARD size_t localVariableSize() const;

    _NODISCARD const vector<Variable*>& localVariables() const;
    _NODISCARD const vector<Variable*>& argumentVariables() const;

    _NODISCARD Node* implementationNode() const;

public:
    _NODISCARD static string argumentsToString(const vector<ArgumentType>& arguments) noexcept;

};


}