#include "Function.h"

stc::Function::Function(const std::string& name, stc::ReturnType returnType,
                        const std::vector<stc::ArgumentType>& arguments, Node* m_node,
                        size_t sizeLocalVariable, const vector<Variable*>& argumentVariables,
                        const vector<Variable*>& localVariables)
{
    this->m_name = name;
    this->m_returnType = returnType;
    this->m_arguments = arguments;
    this->m_argumentsSize = 0;
    this->m_localVariableSize = sizeLocalVariable;

    this->m_node = m_node;

    this->m_argumentVariables = argumentVariables;
    this->m_localVariables = localVariables;

    for (const auto& argument : arguments)
    {
        this->m_argumentsSize += Variable::typeSizeInByte(argument);
    }
}


void stc::Function::print() const noexcept
{
    cout << "   Function name: ";
    cout << ("'" + m_name + "'");

    cout << ". Return type: ";
    cout << ("'" + Variable::variableTypeToString(m_returnType) + "'");

    cout << ". Arguments: ";
    cout << argumentsViewString() << endl;

    cout << "   {" << endl;

    cout << "      Local variables: " << "(" << m_localVariableSize << " byte)" << endl;
    cout << "      {" << endl;
    for (const auto& localVariable : m_localVariables)
    {
        cout << "         ";
        localVariable->print();
    }
    if (m_localVariables.empty())
    {
        cout << "         void" << endl;
    }
    cout << "      }" << endl;

    cout << endl;


    cout << "      Argument variables: " << "(" << m_argumentsSize << " byte)" << endl;
    cout << "      {" << endl;
    for (const auto& argumentVariable : m_argumentVariables)
    {
        cout << "         ";
        argumentVariable->print();
    }
    if (m_argumentVariables.empty())
    {
        cout << "         void" << endl;
    }
    cout << "      }" << endl;

    cout << "   }" << endl;

    cout << "\n";
}

std::string stc::Function::name() const
{
    return m_name;
}

stc::ReturnType stc::Function::returnType() const
{
    return m_returnType;
}

const std::vector<stc::ArgumentType>& stc::Function::arguments() const
{
    return m_arguments;
}

bool stc::Function::operator==(const stc::Function& rhs) const
{
    auto eq = m_name == rhs.m_name &&
              m_arguments.size() == rhs.m_arguments.size();


    if (!eq)
        return false;

    for (int i = 0; i < m_arguments.size(); ++i)
    {
        if (m_arguments[i] != rhs.m_arguments[i])
        {
            return false;
        }
    }

    return true;
}

size_t stc::Function::argumentsSize() const
{
    return m_argumentsSize;
}

size_t stc::Function::localVariableSize() const
{
    return m_localVariableSize;
}

std::string stc::Function::argumentsViewString() const
{
    return argumentsToString(m_arguments);
}

const std::vector<stc::Variable*>& stc::Function::localVariables() const
{
    return m_localVariables;
}

const std::vector<stc::Variable*>& stc::Function::argumentVariables() const
{
    return m_argumentVariables;
}

std::string stc::Function::argumentsToString(const std::vector<stc::ArgumentType>& arguments) noexcept
{
    string result = "(";

    for (const auto& argument : arguments)
    {
        result += Variable::variableTypeToString(argument) + ", ";
    }

    if (arguments.empty())
    {
        result += "void";
    }
    else
    {
        result.pop_back();
        result.pop_back();
    }

    result += ")";
    return result;
}

stc::Node* stc::Function::implementationNode() const
{
    return m_node;
}
