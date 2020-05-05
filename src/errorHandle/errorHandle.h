#pragma once
#include <stdexcept>
#include <string>

namespace stc
{
using std::string;

struct ErrorHandle
{
    static void raise(const string& errorMessage)
    {
        throw std::logic_error(errorMessage);
    }
};


}