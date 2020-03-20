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

        bool _is_const;
        size_t _block_id;

        bool _is_global_variable;
        bool _is_argument_variable;

    public:
        variable(const string& variable_name, variable_type variable_type, size_t block_id, bool is_const = false);



    public:
        void print() const;

        [[nodiscard]] string name() const;
        [[nodiscard]] variable_type type() const;

        [[nodiscard]] string name_with_postfix() const;

        [[nodiscard]] bool is_const() const;
        [[nodiscard]] bool is_array() const;

        void block_id(size_t block_id);
        [[nodiscard]] size_t block_id() const;

        void is_global_variable(bool is_global_variable);
        [[nodiscard]] bool is_global_variable() const;

        [[nodiscard]] bool is_argument_variable() const;
        void is_argument_variable(bool is_argument_variable);

        /**
         * @brief Возвращает истину, если переданный тип является массивом
         * @param type
         * @return
         */
        static bool is_array_type(variable_type type);

    public:

        /**
         * @brief Возвращает истину, если переданная переменная
         * имеет такой же тип
         * @param rhs_ Переменная, с которой сравнивается
         * @return true | false
         */
        bool has_equal_type(const variable& rhs_);

        /**
         * @brief Возвращает тип переменной, равной типу токена
         * @param token_type_
         * @return
         */
        static variable_type variable_type_from_token_type(token_type token_type_);

        /**
         * @brief Возвращает истину если типы совместимы
         * @param type1
         * @param type2
         * @return true | false
         */
        static bool is_types_reducible(variable_type type1, variable_type type2);


        /**
         * @brief Возвращает строковое представление переданного типа
         * @param type
         * @return string
         */
        static string variable_type_to_string(variable_type type);


        /**
         * @brief Возвращает тип массива
         * @param type
         * @return variable_type
         */
        static variable_type type_of_array_type(variable_type type);

        /**
         * @brief Возвращает тип, хранящийся в переданном значении
         * @param value
         * @return variable_type
         */
        static variable_type type_variable_value(variable_value value);


        /**
         * @brief Возвращает размер в байтах для переданного типа
         * @param type
         * @return
         */
        static size_t byte_on_type(variable_type type);
    };


}