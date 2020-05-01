#include "InterfaceTable.h"

void stc::InterfaceTable::add(const stc::Interface& an_interface) noexcept
{
    m_interfaces.push_back(an_interface);
}

bool stc::InterfaceTable::contains(const stc::Interface& an_interface) const noexcept
{
    for (const auto& m_class : m_interfaces)
    {
        if (m_class == an_interface)
            return true;
    }

    return false;
}

stc::Interface& stc::InterfaceTable::get(const std::string& name)
{
    auto it = std::find_if(m_interfaces.begin(), m_interfaces.end(), [&](const Interface& an_interface)
    {
        return an_interface.name() == name;
    });

    if (it == m_interfaces.end())
    {
        cout << "Error! Interface with name '" + name + "' not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

const std::vector<stc::Interface>& stc::InterfaceTable::raw() const noexcept
{
    return m_interfaces;
}

void stc::InterfaceTable::print() const noexcept
{
    for (const auto& m_interface : m_interfaces)
    {
        m_interface.print();
    }
}

