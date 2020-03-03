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

    template<class... Ts>
    struct overload : Ts...
    {
        using Ts::operator()...;
    };
    template<class... Ts>
    overload(Ts...)->overload<Ts...>;

    using number = long double;

    using variable_value = std::variant<number, bool, string>;


    enum class variable_type
    {
        UNDEFINED       = 0xffffff,

        NUMBER          = 0x1000,
        BOOLEAN         = 0x2000,
        STRING          = 0x3000,
        VOID            = 0x4000,
        ANY             = 0x5000,


        // types for array
        NUMBER_ARRAY    = 0x10000,
        BOOLEAN_ARRAY   = 0x20000,
        STRING_ARRAY    = 0x30000,
        VOID_ARRAY      = 0x40000,
    };

    class variable
    {
    private:
        string _variable_name;
        variable_type _variable_type;
        variable_value _variable_value;

        bool _is_const;
        size_t _block_id;


    public:
        variable(const string& variable_name_, variable_type variable_type_, const variable_value& variable_value_,
                 bool is_const_ = false);


    public:
        bool has_equal_type(const variable& rhs_);

    public:
        void print() const;

        [[nodiscard]] string name() const;
        [[nodiscard]] variable_type type() const;

        [[nodiscard]] string name_with_postfix() const;

        bool is_const();
        bool is_array();

        void block_id(size_t block_id);
        size_t block_id() const;

        static bool is_array_type(variable_type type);

    public:
        static variable_value default_value(variable_type variable_type_);
        static variable_type variable_type_from_token_type(token_type token_type_);

        static bool is_types_reducible(variable_type type1, variable_type type2);
        static string variable_type_to_string(variable_type type);

        static variable_type type_of_array_type(variable_type type);
        static variable_type type_variable_value(variable_value value);
    };


}