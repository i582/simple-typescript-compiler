#include "Function.h"

stc::Function::Function(const std::string& name, stc::ReturnType returnType,
                        const std::vector<stc::ArgumentType>& arguments, size_t sizeLocalVariable)
{
    this->m_name = name;
    this->m_returnType = returnType;
    this->m_arguments = arguments;
    this->m_argumentsSizeInByte = 0;
    this->m_localVariableSizeInByte = sizeLocalVariable;

    for (const auto& argument : arguments)
    {
        this->m_argumentsSizeInByte += argument.countByte();
    }
}

std::string stc::Function::name() const noexcept
{
    return m_name;
}

stc::ReturnType stc::Function::returnType() const noexcept
{
    return m_returnType;
}

const std::vector<stc::ArgumentType>& stc::Function::arguments() const noexcept
{
    return m_arguments;
}

bool stc::Function::operator==(const stc::Function& rhs) const noexcept
{
    auto eq = m_name == rhs.m_name &&
              m_returnType == rhs.m_returnType &&
              m_arguments.size() == rhs.m_arguments.size();


    if (!eq)
        return false;

    for (int i = 0; i < m_arguments.size(); ++i)
    {
        if (!(m_arguments[i] == rhs.m_arguments[i]))
        {
            return false;
        }
    }

    return true;
}

size_t stc::Function::argumentsSizeInByte() const noexcept
{
    return m_argumentsSizeInByte;
}

size_t stc::Function::localVariableSizeInByte() const noexcept
{
    return m_localVariableSizeInByte;
}

std::string stc::Function::argumentsViewString() const noexcept
{
    return argumentsToString(m_arguments);
}

void stc::Function::print() const noexcept
{
    cout << "Function name: '" << m_name << "'. Return type: '" << m_returnType.toString() << "'. Arguments: " << argumentsViewString() << endl;
}

std::string stc::Function::argumentsToString(const std::vector<stc::ArgumentType>& arguments) noexcept
{
    string result = "(";

    for (const auto& argument : arguments)
    {
        result += argument.toString() + ",";
    }

    if (arguments.empty())
        result += "void";
    else
        result.pop_back();

    result += ")";
    return result;
}

