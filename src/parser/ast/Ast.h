#pragma once

#include <iostream>
#include <filesystem>
#include <chrono>

#include "../node/Node.h"
#include "../function/GlobalFunctions.h"
#include "../array/Array.h"
#include "exportTable/ExportTable.h"
#include "../../log/Log.h"


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
    bool m_debugMode;

public:
    Node* m_root;

public:
    Ast(const path& filePath, bool debugMode = false);

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
    void markBreakContinueOperatorsRecursive(Node* currentNode, size_t currentScopeId);
    void markReturnOperatorRecursive(Node* currentNode, size_t currentScopeId, const string& currentFunctionName, const vector<VariableType>& arguments);


    // identify functions
    void identifyBlocksRecursive(Node* currentNode, Node* currentScopeNode);
    void identifyVariablesRecursive(Node* currentNode, VariableTable* table);

    void identifyGlobalVariablesRecursive(Node* currentNode, VariableTable& globalVariablesTable);

    void identifyFunctionsRecursive(Node* currentNode);
    void identifyFunctionArgumentsRecursive(Node* currentNode, vector<VariableType>& argumentTypes, vector<Variable*>& arguments);
    void identifyFunctionLocalVariablesRecursive(Node* currentNode, size_t& size, vector<Variable*>& variables);


    void identifyArraysRecursive(Node* currentNode);
    void identifyArrayInitializerListRecursive(Node* currentNode, vector<VariableValue>& list, VariableType arrayType);


    // check functions
    void checkFunctionsCallRecursive(Node* currentNode);
    void identifyFunctionCallArgumentsRecursive(Node* currentNode, vector<VariableType>& arguments);
    void checkExpressionRecursive(Node* currentNode);

    static void checkConstantsRecursive(Node* currentNode, Node* currentScopeNode);
    void check_array_recursive(Node* currentNode);
    void giveExpressionTypeRecursive(Node* currentNode, VariableType& type);


    VariableType variableTypeOfNode(Node* currentNode);


private:
    static void error(const string& message);


public:
    void print() const noexcept;

    static void print(Node* currentNode, size_t level);




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
    static Node* copySubTreeRecursive(Node* currentNode);

};

}