#pragma once

#include <algorithm>
#include <vector>
#include "variable.h"
#include "tuple"

namespace stc
{
    using std::vector;
    using std::tuple;



    class VariableTable
    {
    private:
        size_t m_block_id;

        vector<Variable*> m_variables;
        VariableTable* m_parent;


    public:
        explicit VariableTable(size_t block_id);

        VariableTable();
        ~VariableTable();

    private:
        [[nodiscard]] string generate_prefix() const;


    public:

        /**
         * @brief Функция возвращающая идентификатор блока для которого создана эта таблица
         * @return Идентифкатор блока
         */
        [[nodiscard]] size_t block_id() const;



        /**
         * @brief Функция для установки родительской таблицы
         * @param parent Указатель на родительскую таблицу
         */
        void set_parent(VariableTable* parent);


        /**
         * @brief Функция для добавления новой переменной
         * @param var Указатель на добавляемую переменную
         */
        void add_variable(Variable* var);






        [[nodiscard]] Variable* get_variable_by_name(const string& name_) const;
        
        
        /**
         * @brief Функция возвращающая переменную с переданным именем, а так же идентифкатор
         * блока, в которой она впервые определена
         * @param name 
         * @return
         * @note Функция проходит по текущей таблице, если в ней такой переменной нет, она
         * ищет переменную в родительской таблице
         */
        [[nodiscard]] tuple<size_t, Variable*> get_variable_and_block_id_where_it_defined(const string& name) const;



        /**
         * @brief Функция возвращает истину, если в таблице есть переменная с таким именем
         * @param name Имя переменной
         * @return true | false
         */
        [[nodiscard]] bool has_variable(const string& name) const;

        /**
         * @brief Функция возвращает истину, если в таблице есть переменная с таким именем, в обратном случае
         * поиск продолжается в родительской таблице
         * @param name Имя переменной
         * @return true | false
         */
        [[nodiscard]] bool has_variable_globally(const string& name) const;


        /**
         * @brief Функция возвращающая указатель на переменную с переданным именем объявленную в блоке с
         * идентификатором block_id
         * @note Используется при поиске по таблице всех переменных
         * @param name Имя переменной для поиска
         * @param block_id Идентификатор блока
         * @throw Возбуждает исключение, если переменная не найдена
         * @return Указатель на переменную
         */
        [[nodiscard]] Variable* get_variable(const string& name, size_t block_id) const;


        /**
         * @brief Функция возвращающая указатель на переменную с переданным именем объявленную в блоке с
         * идентификатором block_id. В отличии от предыдущей функции, если переменная не найдена в текущей таблице, то
         * поиск продолжается в родительской
         * @param name Имя переменной для поиска
         * @param block_id Идентификатор блока
         * @throw Возбуждает исключение, если переменная не найдена ни в одной таблице
         * @return Указатель на переменную
         */
        [[nodiscard]] Variable* get_variable_globally(const string& name, size_t block_id) const;




        /**
         * @brief Функция возвращающая константную ссылку на массив переменных
         * @return
         */
        [[nodiscard]] const vector<Variable*>& vars() const;


        [[nodiscard]] string generate_variable_with_prefix(const string& variable_name) const;


    public:
        /**
         * @brief Функция распечатывающая все переменные таблицы
         */
        void print();

    };

}