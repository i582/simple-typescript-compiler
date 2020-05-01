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

    auto array_new_function = new Function("Array", ReturnType::ANY, {VariableType::NUMBER});
    m_table->add_function(array_new_function);

    auto new_function = new Function("input", ReturnType::NUMBER, {});
    m_table->add_function(new_function);

    new_function = new Function("print", ReturnType::VOID, {ReturnType::NUMBER});
    m_table->add_function(new_function);

    new_function = new Function("println", ReturnType::VOID, {ReturnType::STRING});
    m_table->add_function(new_function);

    new_function = new Function("sqrt", ReturnType::NUMBER, {ReturnType::NUMBER});
    m_table->add_function(new_function);
}

stc::Function* stc::GlobalFunctions::get_function(const std::string& name,
                                                  const std::vector<stc::ArgumentType>& arguments_description)
{
    return m_table->get_function(name, arguments_description);
}

bool stc::GlobalFunctions::has_function(stc::Function* function)
{
    return m_table->has_function(function);
}

bool stc::GlobalFunctions::has_function(const std::string& name)
{
    Function* new_function = nullptr;

    if (name == "Array")
    {
        new_function = new Function(name, ReturnType::ANY, {ArgumentType::NUMBER });
    }
    else if (name == "input")
    {
        new_function = new Function(name, ReturnType::NUMBER, {});
    }
    else if (name == "print")
    {
        new_function = new Function(name, ReturnType::VOID, {ReturnType::NUMBER});
    }
    else if (name == "println")
    {
        new_function = new Function(name, ReturnType::VOID, {ReturnType::STRING});
    }
    else if (name == "sqrt")
    {
        new_function = new Function(name, ReturnType::NUMBER, {ReturnType::NUMBER});
    }
    else
    {
        return false;
    }

    return m_table->has_function(new_function);
}
