#pragma once

#include <iostream>
#include <chrono>
#include "../node/Node.h"
#include "../class/ClassTable.h"
#include "../interface/InterfaceTable.h"
#include "../types/genericType.h"

namespace stc
{


using std::any_cast;


class Ast
{
private:
    vector<std::pair<Node*, Node*>> m_allScopeNode;

private:
    size_t m_countScopes;

    VariableTable m_allVariables;
    VariableTable m_globalVariables;

    vector<VariableTable*> m_variableTables;

    FunctionTable m_functions;

    ClassTable m_classes;
    InterfaceTable m_interfaces;



public:
    Node* m_root;


public:
    Ast();
    ~Ast();


public:
    void printAllVariables();
    void printAllFunctions();
    void printAllClasses();
    void printAllInterfaces();

public:

    /**
     * @brief Функция задающая каждой границе видимости (scope) порядковый номер
     */
    void markAllScopes();



    /**
     * @brief Функция задающая операторам break и continue идентификатор родительского цикла (блока)
     */
    void markBreakContinueOperators();


    /**
     * @brief Функция задающая оператору return идентификатор родительской функции (блока),
     * а так же устанавливающая значение равное количеству байт, которое занимают аргументы функции
     */
    void markReturnOperators();



    void identifyScopes();

    void identifyVariables();
    void identifyVariablesRecursive(Node* currentNode, VariableTable* variableTable);

    void identifyGlobalVariables();

    void identifyFunctions();
    void identifyFunctionsRecursive(Node* currentNode);
    void identifyFunctionArgumentsRecursive(Node* currentNode, vector<GenericType>& argumentTypes,
                                            vector<Variable*>& arguments);

    void identifyFunctionLocalVariablesRecursive(Node* currentNode, size_t& size);


    void identifyClasses();
    void identifyClassesRecursive(Node* currentNode);
    void identifyClassFieldsRecursive(Node* currentNode, size_t scopeId, VariableTable& table);
    void identifyClassFunctionsRecursive(Node* currentNode, size_t scopeId, FunctionTable& table);


    void identifyInterfaces();
    void identifyInterfacesRecursive(Node* currentNode);
    void identifyInterfaceFunctionsRecursive(Node* currentNode, size_t scopeId, FunctionTable& table);


    void setConnectionTypeClass();


    void checkClassAccess();
    void checkClassAccessRecursive(Node* currentNode, string& className);


    // check functions
    void check_const();

    void check_array();

    void checkFunctionCall();

    void check_expression();


    void checkFunctionsCallRecursive(Node* currentNode);

    void identifyFunctionCallArgumentsRecursive(Node* node, vector<GenericType>* arguments);



    void giveExpressionTypeRecursive(Node* current_node, GenericType& type);

private:
    void markAllScopesRecursive(Node* currentNode);

    void mark_break_continue_operators_recursive(Node* current_node, size_t current_block);

    void mark_return_operator_recursive(Node* current_node, size_t current_block, const string& function_name);

    // designate functions
    void identifyScopesRecursive(Node* currentNode, Node* currentScopeNode);



/*







    void designate_arrays_recursive(Node* node);

    void calculate_array_initialize_list(Node* node, size_t* count);

    void designate_array_initialize_list_recursive(Node* node, vector<VariableValue>& list, VariableType array_type);

    // check functions
    static void check_const_recursive(Node* current_node, Node* current_stmt);

    void check_array_recursive(Node* current_node);




    VariableType variable_type_of_node(Node* current_node);*/

    Node* get_stmt_by_id(size_t stmt_id);

private:
    static void error(const string& message);

    void print(Node* currentNode, size_t level) const;

public:
    void print() const noexcept;
};

}