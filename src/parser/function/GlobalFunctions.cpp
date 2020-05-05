#include "GlobalFunctions.h"

stc::GlobalFunctions::GlobalFunctions()
{
    this->m_table = nullptr;

    this->init();
}

stc::GlobalFunctions::~GlobalFunctions()
{
    delete m_table;
}

void stc::GlobalFunctions::init()
{
    m_table = new FunctionTable();

    auto newFunction = new Function("Array", ReturnType::ANY, {VariableType::NUMBER});
    m_table->add(newFunction);

    newFunction = new Function("input", ReturnType::NUMBER, {});
    m_table->add(newFunction);

    newFunction = new Function("print", ReturnType::VOID, {ReturnType::NUMBER});
    m_table->add(newFunction);

    newFunction = new Function("println", ReturnType::VOID, {ReturnType::STRING});
    m_table->add(newFunction);

    newFunction = new Function("sqrt", ReturnType::NUMBER, {ReturnType::NUMBER});
    m_table->add(newFunction);
}

stc::Function* stc::GlobalFunctions::get(const std::string& name,
                                         const std::vector<stc::ArgumentType>& argumentsDescription)
{
    return m_table->get(name, argumentsDescription);
}

bool stc::GlobalFunctions::contains(stc::Function* function)
{
    return m_table->contains(function);
}

bool stc::GlobalFunctions::contains(const std::string& name)
{
    Function* newFunction = nullptr;

    if (name == "Array")
    {
        newFunction = new Function(name, ReturnType::ANY, {ReturnType::NUMBER });
    }
    else if (name == "input")
    {
        newFunction = new Function(name, ReturnType::NUMBER, {});
    }
    else if (name == "print")
    {
        newFunction = new Function(name, ReturnType::VOID, {ReturnType::NUMBER});
    }
    else if (name == "println")
    {
        newFunction = new Function(name, ReturnType::VOID, {ReturnType::STRING});
    }
    else if (name == "sqrt")
    {
        newFunction = new Function(name, ReturnType::NUMBER, {ReturnType::NUMBER});
    }
    else
    {
        return false;
    }

    return m_table->contains(newFunction);
}
