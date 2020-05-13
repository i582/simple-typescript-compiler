#include "GlobalFunctions.h"

stc::GlobalFunctions* stc::GlobalFunctions::m_functions = nullptr;

stc::GlobalFunctions::GlobalFunctions()
{
    this->m_table = FunctionTable();

    this->init();
}

stc::GlobalFunctions::~GlobalFunctions()
{
    m_table.clear();
}

void stc::GlobalFunctions::init()
{
    auto newFunction = new Function("Array", Type(FundamentalType::ANY), { Type(FundamentalType::NUMBER) });
    m_table.add(newFunction);

    newFunction = new Function("input", Type(FundamentalType::NUMBER), {});
    m_table.add(newFunction);

    newFunction = new Function("print", Type(FundamentalType::VOID), { Type(FundamentalType::NUMBER) });
    m_table.add(newFunction);

    newFunction = new Function("println", Type(FundamentalType::VOID), { Type(FundamentalType::SYMBOL, true) });
    m_table.add(newFunction);

    newFunction = new Function("sqrt", Type(FundamentalType::NUMBER), { Type(FundamentalType::NUMBER) });
    m_table.add(newFunction);

    newFunction = new Function("concat", Type(FundamentalType::SYMBOL, true), { Type(FundamentalType::SYMBOL, true), Type(FundamentalType::SYMBOL, true) });
    m_table.add(newFunction);

    newFunction = new Function("slice", Type(FundamentalType::SYMBOL, true), { Type(FundamentalType::SYMBOL, true), Type(FundamentalType::NUMBER), Type(FundamentalType::NUMBER) });
    m_table.add(newFunction);

    newFunction = new Function("strlen", Type(FundamentalType::NUMBER), { Type(FundamentalType::SYMBOL, true)});
    m_table.add(newFunction);

    newFunction = new Function("at", Type(FundamentalType::SYMBOL, true), { Type(FundamentalType::SYMBOL, true), Type(FundamentalType::NUMBER)});
    m_table.add(newFunction);

    newFunction = new Function("find", Type(FundamentalType::NUMBER), { Type(FundamentalType::SYMBOL, true), Type(FundamentalType::SYMBOL, true)});
    m_table.add(newFunction);

    newFunction = new Function("toString", Type(FundamentalType::SYMBOL, true), { Type(FundamentalType::NUMBER), Type(FundamentalType::NUMBER)});
    m_table.add(newFunction);

    newFunction = new Function("toNumber",  Type(FundamentalType::NUMBER), { Type(FundamentalType::SYMBOL, true) });
    m_table.add(newFunction);


    newFunction = new Function("crt_cos", Type(FundamentalType::NUMBER), { Type(FundamentalType::NUMBER) });
    m_table.add(newFunction);

}

stc::Function* stc::GlobalFunctions::get(const std::string& name,
                                         const std::vector<stc::ArgumentType>& argumentsDescription)
{
    auto instance = i();
    return instance.m_table.get(name, argumentsDescription);
}


stc::Function* stc::GlobalFunctions::get(const std::string& name)
{
    auto instance = i();
    return instance.m_table.get(name);
}

bool stc::GlobalFunctions::contains(stc::Function* function)
{
    auto instance = i();
    return instance.m_table.contains(function);
}

bool stc::GlobalFunctions::contains(const std::string& name)
{
    auto instance = i();

    return instance.m_table.contains(name);
}

stc::GlobalFunctions& stc::GlobalFunctions::i()
{
    if (m_functions == nullptr)
        m_functions = new GlobalFunctions();

    return *m_functions;
}

bool stc::GlobalFunctions::isGlobalFunction(const std::string& name)
{
    auto instance = i();
    return instance.m_functions->contains(name);
}

