#pragma once
#include <iostream>
#include <string>
#include <variant>
#include "../../lexer/token/token.h"

namespace compiler
{
    using std::string;
    using std::cout;
    using std::endl;

    using variable_value = std::variant<int, float, bool, string>;

    enum class variable_type
    {
        INT = 0x01000,
        BOOLEAN = 0x02000,
        VOID = 0x03000,
        DOUBLE = 0x04000,

        // types for array
        INT_ARRAY = 0x10000,
        BOOLEAN_ARRAY = 0x20000,
        VOID_ARRAY = 0x30000,
        DOUBLE_ARRAY = 0x040000,
    };

    class variable
    {
    private:
        string _variable_name;
        variable_type _variable_type;
        variable_value _variable_value;

        bool _is_const;

    public:
        variable(const string& variable_name_, variable_type variable_type_, const variable_value& variable_value_,
                 bool is_const_ = false);


    public:
        bool has_equal_type(const variable& rhs_);

    public:
        void print() const;

        [[nodiscard]] string name() const;
        [[nodiscard]] variable_type type() const;

        bool is_const();
        bool is_array();

    public:
        static variable_value default_value(variable_type variable_type_);
        static variable_type variable_type_from_token_type(token_type token_type_);

    };


}