#include "report.h"
#include "../parser/node/Node.h"

stc::Report::Report(stc::Lexer2* lexer, stc::Node* node, stc::ReportLevel level, const std::string& name,
                    const std::string& message, const std::string& filepath)
{
    this->m_lexer = lexer;
    this->m_node = node;
    this->m_level = level;
    this->m_name = name;
    this->m_message = message;
    this->m_filepath = filepath;
}

std::string stc::Report::toString() const
{
    const auto& reportLevelString = ReportUtilities::severityNames.at(m_level);
    const auto& reportName = m_name;
    const auto& reportMessage = m_message;
    const auto& reportFile = m_filepath;

    if (m_node == nullptr)
    {
        return ReportUtilities::sprintf("%s %s: %s\n"
                , reportLevelString.c_str(), reportName.c_str(), reportMessage.c_str());
    }

    const auto& reportLineNumber = m_node->position().startLine;
    const auto& reportLine = m_lexer->line(reportLineNumber);
    const auto& reportLineLength = reportLine.length();

    const auto& reportLinePrev = m_lexer->line(reportLineNumber - 1);
    const auto& reportLineNext = m_lexer->line(reportLineNumber + 1);

    return ReportUtilities::sprintf("%s %s: %s at %s:%d\n\n"
                                    "%3d: %s\n"
                                    "%3d: %s\n"
                                    "     %s\n"
                                    "%3d: %s\n\n\n"
            , reportLevelString.c_str(), reportName.c_str(), reportMessage.c_str(), reportFile.c_str(), reportLineNumber,
                                    reportLineNumber - 1, reportLinePrev.c_str(),
                                    reportLineNumber, reportLine.c_str(),
                                    underline(reportLineLength).c_str(),
                                    reportLineNumber + 1, reportLineNext.c_str());
}
