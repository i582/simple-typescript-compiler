#pragma once

#include <vector>
#include "../variable/variable.h"

namespace compiler
{
    using std::string;
    using std::vector;

    using return_type = variable_type;
    using argument_type = variable_type;

    class func
    {
    private:
        string _name;
        return_type _return_type;
        vector<argument_type> _arguments;
        size_t _arguments_size;

    public:
        func(const string& name, return_type return_type, const vector<argument_type>& arguments);


    public:
        bool operator==(const func& rhs) const;

    public:
        string name();
        return_type return_type();
        const vector<argument_type>& arguments();

        size_t arguments_size() const;
    };


}