#pragma once

#include <vector>

#include "../log/Log.h"
#include "report.h"

namespace stc
{

class Reports
{
    vector<Report> m_reports;


public:
    Reports() = default;


public:
    void add(const Report& report)
    {
        m_reports.push_back(report);
    }

    void print() const
    {
        for (const auto& report : m_reports)
        {
            Log::write(report.toString() + "\n", LogType::Error);
        }
    }

    bool empty() const noexcept
    {
        return m_reports.empty();
    }

    void clear()
    {
        m_reports.clear();
    }

};

}