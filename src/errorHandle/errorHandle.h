#pragma once
#include <stdexcept>
#include <string>
#include "../report/reports.h"

namespace stc
{
using std::string;

struct ErrorHandle
{
private:
    static ErrorHandle m_instance;

private:
    ErrorHandle() = default;

private:
    Reports m_reports;

public:
    static ErrorHandle& i()
    {
        return m_instance;
    }

    static void report(Lexer2* lexer, Node* node, ReportLevel level, const string& name, const string& message);

    static Reports& reports()
    {
        return i().m_reports;
    }

    static void clear()
    {
        return i().m_reports.clear();
    }

    static void raise(const string& errorMessage)
    {
        throw std::logic_error(errorMessage);
    }
};


}