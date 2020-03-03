#pragma once

#include <vector>
#include "../variable/variable.h"

namespace compiler
{

    using std::vector;
    using std::string;

    class array
    {
    private:
        string _name;
        size_t _size;

        vector<variable_value> _values;


    public:
        array(const string& name, size_t size, const vector<variable_value>& values = {});

    public:
        [[nodiscard]] string name() const;
        [[nodiscard]] size_t size() const;

        void values(const vector<variable_value>& values);
        [[nodiscard]] const vector<variable_value>& values() const;

        string values_to_string() const;

    };

}