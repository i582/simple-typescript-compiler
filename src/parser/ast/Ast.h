#pragma once

#include <iostream>
#include <filesystem>
#include <chrono>

#include "../node/Node.h"
#include "../function/GlobalFunctions.h"
#include "exportTable/ExportTable.h"
#include "../../log/Log.h"
#include "../class/ClassTable.h"

#include "../initializer/initializer.h"

#include "../../report/reports.h"

namespace stc
{
namespace fs = std::filesystem;

class Icm;

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

    ExportTable m_exportTable;

    ClassTable m_classTable;

    path m_filePath;


    vector<string> m_alreadyImportedFunctions;

public:
    Node* m_root;

public:
    explicit Ast(Lexer2* lexer, const path& filePath);

public:
    friend Asm;

public:
    /**
     * @brief Основной метод для запуска анализа
     */
    void analyze();

    /**
     * @brief Функция для добавление репорта об ошибке
     * @param node Указатель на текущий узел
     * @param level Уровень ошибки
     * @param name Имя ошибки
     * @param message Сообщение ошибки
     */
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
    void identifyInitializers();
    void identifyFunctions();



    // check functions AstChecks.cpp
    void checkConstant();
    void checkFunctionReturnOperator();
    void checkFunctionsCall();
    void checkAssignment();
    void checkExpressions();




private:
    // mark functions
    /**
     * @brief Функция присваивающая всем блокам порядковый номер
     * @param currentNode Указатель на поддерево
     */
    void markAllScopesRecursive(Node* currentNode);

    /**
     * @brief Функция присваивающая break/continue операторам номера равные порядковому номеру родительского цикла
     * @param currentNode Указатель на поддерево
     * @param currentScopeId
     */
    void markBreakContinueOperatorsRecursive(Node* currentNode, size_t currentScopeId);

    /**
     * @brief Функция присвавающая return оператору значение равное количеству байт, которое занимают
     * все локальные переменные функции
     * @param currentNode
     * @param functionSizeOfArguments
     */
    void markReturnOperatorRecursive(Node* currentNode, size_t functionSizeOfArguments);



    // identify functions
    /**
     * @brief Функция выделяющая все блоки видимости
     * @param currentNode Указатель на поддерево
     * @param currentScopeNode
     */
    void identifyBlocksRecursive(Node* currentNode, Node* currentScopeNode);

    /**
     * @brief Функция выделяющая все переменные
     * @param currentNode Указатель на поддерево
     * @param table
     * @param className
     */
    void identifyVariablesRecursive(Node* currentNode, VariableTable* table, const string& className);


    /**
     * @brief Функция выделяющая все глобальные переменные
     * @param currentNode Указатель на поддерево
     * @param table
     * @param className
     */
    void identifyGlobalVariablesRecursive(Node* currentNode);

    /**
     * @brief Функция находит все функции и добавляет их в таблицу функций
     * @param currentNode Указатель на поддерево
     */
    void identifyFunctionsRecursive(Node* currentNode);

    /**
     * @brief Функция выделяющая аргументы у функции
     * @param currentNode Указатель на поддерево
     * @param argumentTypes
     * @param arguments
     */
    void identifyFunctionArgumentsRecursive(Node* currentNode, vector<Type>& argumentTypes, vector<Variable*>& arguments);

    /**
     * @brief Функция выделяющая все локальные переменные в функции
     * @param currentNode Указатель на поддерево
     * @param size
     * @param variables
     */
    void identifyFunctionLocalVariablesRecursive(Node* currentNode, size_t& size, vector<Variable*>& variables);


    /**
     * @brief Функция обрабатывающая инициализаторы и добавляющая указатель на класс в значение родительского узла
     * @param currentNode Указатель на поддерево
     */
    void identifyInitializerRecursive(Node* currentNode);



    /**
     * @brief Функция возвращающая тип инициализатора
     * @param currentNode Указатель на поддерево
     * @param initializerType
     * @param begin Флаг указывающий на то, что нужно определить тип при обработке первого элемента
     */
    void giveInitializerTypeRecursive(Node* currentNode, Type& initializerType, bool begin);


    /**
     * @brief Функция возвращающая количество элементов в инициализаторе
     * @param currentNode Указатель на поддерево
     * @param size
     */
    void giveInitializerCountElementRecursive(Node* currentNode, size_t& size);



    // check functions AstChecks.cpp
    /**
     * @brief Вспомогательная функция для checkFunctionsCall
     * @param currentNode Указатель на поддерево
     */
    void checkFunctionsCallRecursive(Node* currentNode);

    /**
     * @brief Вспомогательная функция для getFunctionCallArguments
     * @param currentNode Указатель на поддерево
     * @param arguments Массив типов
     */
    void identifyFunctionCallArgumentsRecursive(Node* currentNode, vector<Type>& arguments);




    /**
     * @brief Функция проверяющая корректность операторов return
     * @param currentNode Указатель на поддерево
     * @param function Указатель на функцию, которая в данный омент обрабатывается
     */
    void checkFunctionReturnOperatorRecursive(Node* currentNode, Function* function);

    /**
    * @brief Функция проверяющая корректность выражений
    * @param currentNode Указатель на поддерево
    */
    void checkExpressionsRecursive(Node* currentNode);

    /**
     * @brief Функция проверяющая корректность присваиваний
     * @param currentNode Указатель на поддерево
     */
    void checkAssignmentRecursive(Node* currentNode);

    /**
     * @brief Функция проверяющая константную корректность
     * @param currentNode Указатель на поддерево
     */
    void checkConstantsRecursive(Node* currentNode);


public:
    /**
     * @brief Функция возвращает тип инициализатора вида [...]
     * @param currentNode Указатель на поддерево
     * @return Type Тип элементов
     */
    _NODISCARD Type giveInitializerType(Node* currentNode);

    /**
     * @brief Функция возвращает количество элементов в инициализаторе
     * @param currentNode Указатель на поддерево
     * @return
     */
    _NODISCARD size_t giveInitializerCountElement(Node* currentNode);

    /**
     * @brief Функция возвращающая массив типов аргументов с которыми она вызывается
     * @param currentNode Указатель на поддерево
     * @return
     */
    _NODISCARD vector<Type> getFunctionCallArguments(Node* currentNode);

    /**
     * @brief Функция возвращающая тип выражения и проверяющая это выражение на корректность
     * @param currentNode Указатель на поддерево
     * @return
     */
    _NODISCARD Type checkAndGiveExpressionType(Node* currentNode);

    /**
     * @brief Алиас для checkAndGiveExpressionType
     * @param node Указатель на поддерево
     * @return
     */
    _NODISCARD Type expressionType(Node* node);


public:
    /**
     * @brief Функция заменяет в дереве все вхождение оператора + для строк на вызовы функции concat
     * @param currentNode Указатель на поддерево
     */
    void replaceStringOperatorsToMethod(Node* currentNode);


private:
    /**
     * @brief Функция для возбуждения ошибки
     * @param message Сообщение ошибки
     */
    static void error(const string& message);

public:
    /**
     * @brief Функция распечатывающая рекурсивно дерева
     * @param currentNode Указатель на текущий узел для распечатки
     * @param level Текущий уровень узла
     */
    static void print(Node* currentNode, size_t level);

    /**
     * @brief Функция распечатывающая дерево
     */
    void print() const;





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


    void identifyAllImportNames(Node* currentNode, vector<string>& importNames);

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