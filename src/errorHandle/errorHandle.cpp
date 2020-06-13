#include "errorHandle.h"
#include "../parser/node/Node.h"

stc::ErrorHandle stc::ErrorHandle::m_instance = ErrorHandle();

void stc::ErrorHandle::report(stc::Lexer2* lexer, stc::Node* node, stc::ReportLevel level, const std::string& name,
                              const std::string& message)
{
    auto newReport = Report(lexer, node, level, name, message, lexer == nullptr ? "" : lexer->filePath().string());
    i().m_reports.add(newReport);

    if (level == ReportLevel::FatalError)
    {
        throw std::logic_error("");
    }
}
