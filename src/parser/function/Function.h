#pragma once

#include <vector>
#include "../variable/Variable.h"

namespace stc
{

using std::string;
using std::vector;

using ReturnType = GenericType;
using ArgumentType = GenericType;

class Function
{
private:
    string m_name;
    vector<ArgumentType> m_arguments;
    ReturnType m_returnType;

    size_t m_argumentsSizeInByte;
    size_t m_localVariableSizeInByte;


public:
    Function(const string& name, const ReturnType& returnType, const vector<ArgumentType>& arguments,
             size_t sizeLocalVariable = 0);


public:
    bool operator==(const Function& rhs) const noexcept;

public:
    void print() const noexcept;

public:
    _NODISCARD string name() const noexcept;
    _NODISCARD ReturnType returnType() const noexcept;
    _NODISCARD const vector<ArgumentType>& arguments() const noexcept;


    _NODISCARD string argumentsViewString() const noexcept;
    _NODISCARD size_t argumentsSizeInByte() const noexcept;
    _NODISCARD size_t localVariableSizeInByte() const noexcept;

public:
    _NODISCARD static string argumentsToString(const vector<ArgumentType>& arguments) noexcept;
};


}