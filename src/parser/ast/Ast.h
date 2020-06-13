#pragma once

#include <iostream>
#include <filesystem>
#include <chrono>

#include "../node/Node.h"
#include "../function/GlobalFunctions.h"
#include "../array/Array.h"
#include "exportTable/ExportTable.h"
#include "../../log/Log.h"
#include "../class/ClassTable.h"

#include "../initializer/initializer.h"

#include "../../report/reports.h"

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
    Lexer2* m_lexer;

private:
    vector<std::pair<Node*, Node*>> m_allScopeNodes;

    vector<Node*> m_allClassImplementationNodes;

private:
    size_t m_countScopes;

    VariableTable m_allVariables;
    VariableTable m_globalVariables;
    VariableTable m_importVariables;

    vector<VariableTable*> m_variableTables;

    FunctionTable m_functions;
    FunctionTable m_importFunctions;

    vector<Array> m_arrays;

    ExportTable m_exportTable;

    ClassTable m_classTable;

    path m_filePath;


public:
    Node* m_root;

public:
    explicit Ast(Lexer2* lexer, const path& filePath);

public:
    friend Asm;

public:
    void analyze();


    void report(Node* node, ReportLevel level, const string& name, const string& message);


public:
    void printVariableTable();
    void printFunctionsTable();

    void printImportVariableTable();
    void printImportFunctionsTable();


    void printClassesTable();

public:

    // mark functions
    void markAllScopes();
    void markBreakContinueOperators();
    void markReturnOperator();


    // identify functions
    void identifyBlocks();


    void identifyVariables();
    void identifyArrays();


    void identifyFunctions();



    // check functions AstChecks.cpp
    void checkConstant();
    void checkArray();
    void checkFunctionsCall();
    void checkAssignment();
    void checkExpressions();




private:
    // mark functions
    void markAllScopesRecursive(Node* currentNode);
    void markBreakContinueOperatorsRecursive(Node* currentNode, size_t currentScopeId);
    void markReturnOperatorRecursive(Node* currentNode, size_t functionSizeOfArguments);


    // identify functions
    void identifyBlocksRecursive(Node* currentNode, Node* currentScopeNode);
    void identifyVariablesRecursive(Node* currentNode, VariableTable* table, const string& className);


    void identifyFunctionsRecursive(Node* currentNode);
    void identifyFunctionArgumentsRecursive(Node* currentNode, vector<Type>& argumentTypes, vector<Variable*>& arguments);
    void identifyFunctionLocalVariablesRecursive(Node* currentNode, size_t& size, vector<Variable*>& variables);


    void identifyInitializerRecursive(Node* currentNode);

    //void identifyArraysRecursive(Node* currentNode);



    /**
     * @brief Функция возвращает тип инициализатора вида [...]
     * @param currentNode Указатель на поддерево
     * @return Type Тип элементов
     */
    _NODISCARD Type giveInitializerType(Node* currentNode);
    void giveInitializerTypeRecursive(Node* currentNode, Type& initializerType, bool begin);

    _NODISCARD size_t giveInitializerCountElement(Node* currentNode);
    void giveInitializerCountElementRecursive(Node* currentNode, size_t& size);



    // check functions AstChecks.cpp
    void checkFunctionsCallRecursive(Node* currentNode);
    void identifyFunctionCallArgumentsRecursive(Node* currentNode, vector<Type>& arguments);
    _NODISCARD vector<Type> getFunctionCallArguments(Node* currentNode);




    void checkExpressionsRecursive(Node* currentNode);
    void checkAssignmentRecursive(Node* currentNode);





    void checkConstantsRecursive(Node* currentNode);
    void checkArrayRecursive(Node* currentNode);

    _NODISCARD Type checkAndGiveExpressionType(Node* currentNode);
    _NODISCARD Type expressionType(Node* node);


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

    static Node* copySubTree(Node* currentNode);
    static Node* copySubTreeRecursive(Node* currentNode);

// classes
public:
    void identifyClasses();
    void identifyClassesRecursive(Node* currentNode);
    void identifyClassFieldsRecursive(Node* currentNode, size_t scopeId, VariableTable& table);
    void identifyClassFunctionsRecursive(Node* currentNode, size_t scopeId, FunctionTable& table);


    void transformStaticFunctionCallInClassImplementation();
    void transformStaticFunctionCallInClassImplementationRecursive(Node* currentNode, Class* a_class);

    void addPointerToClassForThisInClassImplementation();
    void addPointerToClassForThisInClassImplementationRecursive(Node* currentNode, Class* a_class);

    void addPointerToClassForAccessNodesInImplementation();
    void addPointerToClassForAccessNodesInImplementationRecursive(Node* currentNode, Class* a_class);

    void checkClassAccessInImplementation();
    void checkClassAccessInImplementationRecursive(Node* currentNode, Class* a_class);



    void identifyVariablesOfClasses();
    void identifyVariablesOfClassesRecursive(Node* currentNode, VariableTable* table);

    void checkOperatorNew();
    void checkOperatorNewRecursive(Node* currentNode);

    void transformOperatorNewToConstructorCall();
    void transformOperatorNewToConstructorCallRecursive(Node* currentNode);


    void addPointerToClassForAccessNodesOutImplementation();
    void addPointerToClassForAccessNodesOutImplementationRecursive(Node* currentNode);

    void checkClassAccessOutImplementation();
    void checkClassAccessOutImplementationRecursive(Node* currentNode);



// interfaces
public:
    void identifyInterfaces();
    void identifyInterfacesRecursive(Node* currentNode);
    void identifyInterfaceFieldsRecursive(Node* currentNode, size_t scopeId, VariableTable& table);
    void identifyInterfaceFunctionsRecursive(Node* currentNode, size_t scopeId, FunctionTable& table);

};

}