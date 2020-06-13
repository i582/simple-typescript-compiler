#pragma once

#include <memory>
#include <string>
#include <stdexcept>
#include <map>
#include <string>



namespace stc
{

using namespace std;


enum class ReportLevel
{
    Warning,
    Error,
    FatalError
};


namespace ReportUtilities
{

const map<ReportLevel, string> severityNames = {
        make_pair(ReportLevel::Warning, "WARNING"), make_pair(ReportLevel::Error, "ERROR"), make_pair(
                ReportLevel::FatalError, "<critical> ERROR"),
};


template<typename ... Args>
std::string sprintf(const std::string& format, Args... args)
{
    size_t size = snprintf(nullptr, 0, format.c_str(), args...) + 1;

    if (size <= 0)
    {
        throw std::runtime_error("Error during formatting.");
    }

    std::unique_ptr<char[]> buf(new char[size]);
    snprintf(buf.get(), size, format.c_str(), args...);
    return std::string(buf.get(), buf.get() + size - 1);
}

}

class Lexer2;
class Node;

class Report
{
private:
    Lexer2* m_lexer;
    ReportLevel m_level;
    string m_name;
    string m_message;
    Node* m_node;
    string m_filepath;


public:
    Report(Lexer2* lexer, Node* node, ReportLevel level, const string& name, const string& message, const string& filepath);
    _NODISCARD string toString() const;

private:
    string underline(size_t length) const
    {
        string temp;
        temp.resize(length);
        for (int i = 0; i < length; ++i)
        {
            temp[i] = '^';
        }

        return temp;
    };

};

}