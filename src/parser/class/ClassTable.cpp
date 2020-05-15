#include "ClassTable.h"

void stc::ClassTable::add(stc::Class* a_class) noexcept
{
    m_classes.push_back(a_class);
}

bool stc::ClassTable::contains(const stc::Class& a_class) const noexcept
{
    for (const auto& m_class : m_classes)
    {
        if (*m_class == a_class)
            return true;
    }

    return false;
}

bool stc::ClassTable::contains(const std::string& name) const noexcept
{
    for (const auto& m_class : m_classes)
    {
        if (m_class->name() == name)
            return true;
    }

    return false;
}


stc::Class* stc::ClassTable::get(const std::string& name)
{
    auto it = std::find_if(m_classes.begin(), m_classes.end(), [&](Class* t_class)
    {
        return t_class->name() == name;
    });

    if (it == m_classes.end())
    {
        cout << "Error! Class with name '" + name + "' not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

const std::vector<stc::Class*>& stc::ClassTable::raw() const noexcept
{
    return m_classes;
}

void stc::ClassTable::print() const noexcept
{
    for (const auto& m_class : m_classes)
    {
        m_class->print();
    }
}


