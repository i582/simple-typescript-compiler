#pragma once

#include <iostream>
#include <chrono>
#include "../node/Node.h"
#include "../function/GlobalFunctions.h"
#include "../array/Array.h"
#include "exportTable/ExportTable.h"
#include <filesystem>



namespace stc
{
namespace fs = std::filesystem;

class ICM;

class Asm;

using std::any_cast;
using fs::path;

class Ast
{
private:
    vector<std::pair<Node*, Node*>> m_allScopeNodes;

private:
    size_t m_countScopes;

    VariableTable m_allVariables;
    VariableTable m_globalVariables;
    VariableTable m_importVariables;

    vector<VariableTable*> m_variableTables;

    FunctionTable m_functions;
    FunctionTable m_importFunctions;
    GlobalFunctions m_globalFunctions;

    vector<Array> m_arrays;


    ExportTable m_exportTable;


    path m_filePath;

public:
    Node* m_root;

public:
    Ast(const path& filePath);

public:
    friend Asm;

public:
    void printVariableTable();
    void printFunctionsTable();

    void printImportVariableTable();
    void printImportFunctionsTable();

public:

    // mark functions
    void markAllScopes();
    void markBreakContinueOperators();
    void markReturnOperator();


    // deduce variable type function
    void deduceVariableType();
    void deduceVariableTypeRecursive(Node* currentNode);


    // identify functions
    void identifyBlocks();
    void identifyVariables();
    void identifyGlobalVariables();
    void identifyFunctions();
    void identifyArrays();


    // check functions
    void checkConstant();
    void checkArray();
    void checkFunctionsCall();
    void checkExpression();




private:
    // mark functions
    void markAllScopesRecursive(Node* currentNode);
    void mark_break_continue_operators_recursive(Node* current_node, size_t current_block);
    void mark_return_operator_recursive(Node* current_node, size_t current_block, const string& function_name, const vector<VariableType>& arguments);

    // designate functions
    void identifyBlocksRecursive(Node* currentNode, Node* currentScopeNode);
    void identifyVariablesRecursive(Node* currentNode, VariableTable* table);

    void identifyGlobalVariablesRecursive(Node* currentNode, VariableTable& globalVariablesTable);

    void designate_functions_recursive(Node* current_node);
    void designate_function_arguments_recursive(Node* node, vector<VariableType>& argument_types, vector<Variable*>& arguments);
    void designateFunctionLocalVariablesRecursive(Node* currentNode, size_t& size, vector<Variable*>& variables);


    void check_functions_call_recursive(Node* node);
    void designateFunctionCallArgumentsRecursive(Node* currentNode, vector<VariableType>* arguments);

    void check_expression_recursive(Node* currentNode);

    void designate_arrays_recursive(Node* currentNode);

    void calculate_array_initialize_list(Node* node, size_t* count);
    void designateArrayInitializeListRecursive(Node* node, vector<VariableValue>& list, VariableType array_type);

    // check functions
    static void check_const_recursive(Node* current_node, Node* current_stmt);
    void check_array_recursive(Node* currentNode);
    void giveExpressionTypeRecursive(Node* currentNode, VariableType& type);



    VariableType variableTypeOfNode(Node* currentNode);


private:
    static void error(const string& message);
    static void print(Node* currentNode, size_t level);

public:
    void print() const noexcept;





//export
public:
    void checkExports();
    void checkExportsRecursive(Node* currentNode);

    void handleExports();
    void identifyAllExportName(Node* currentNode, vector<string>& exportNames);
    void handleExportsRecursive(Node* currentNode);

    void identifyAllCallFunctionsNameInFunction(Node* currentNode, vector<string>& functions);

    _NODISCARD const ExportTable& exportTable() const;

// import
public:
    void checkImports();
    void checkImportsRecursive(Node* currentNode);



    void handleImports();
    void identifyAllImportName(Node* currentNode, vector<string>& importNames);
    void handleImportsRecursive(Node* currentNode);

    void addImportVariables();
    void addImportFunctionsInTree();

    Node* copySubTree(Node* currentNode);
    Node* copySubTreeRecursive(Node* currentNode);

};

}