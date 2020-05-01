#include "ClassTable.h"

void stc::ClassTable::add(const stc::Class& a_class) noexcept
{
    m_classes.push_back(a_class);
}

bool stc::ClassTable::contains(const stc::Class& a_class) const noexcept
{
    for (const auto& m_class : m_classes)
    {
        if (m_class == a_class)
            return true;
    }

    return false;
}

stc::Class& stc::ClassTable::get(const std::string& a_class)
{
    auto it = std::find_if(m_classes.begin(), m_classes.end(), [&](const Class& t_class)
    {
        return t_class.name() == a_class;
    });

    if (it == m_classes.end())
    {
        cout << "Error! Class with name '" + a_class + "' not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

const std::vector<stc::Class>& stc::ClassTable::raw() const noexcept
{
    return m_classes;
}

void stc::ClassTable::print() const noexcept
{
    for (const auto& m_class : m_classes)
    {
        m_class.print();
    }
}

