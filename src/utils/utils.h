#pragma once
#include <string>

namespace stc::Utils
{

template<typename... Args>
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