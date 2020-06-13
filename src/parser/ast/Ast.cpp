#include "Ast.h"
#include "../../ICM/icm.h"

stc::Ast::Ast(Lexer2* lexer, const path& filePath)
{
    this->m_root = nullptr;

    this->m_lexer = lexer;
    this->m_countScopes = 1;
    this->m_filePath = filePath;
}

void stc::Ast::identifyBlocks()
{
    identifyBlocksRecursive(m_root, nullptr);
}

void stc::Ast::identifyBlocksRecursive(Node* currentNode, Node* currentScopeNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
    {
        m_allScopeNodes.emplace_back(currentScopeNode, currentNode);
        currentScopeNode = currentNode;
    }

    identifyBlocksRecursive(currentNode->operand1, currentScopeNode);
    identifyBlocksRecursive(currentNode->operand2, currentScopeNode);
    identifyBlocksRecursive(currentNode->operand3, currentScopeNode);
    identifyBlocksRecursive(currentNode->operand4, currentScopeNode);
}

void stc::Ast::markAllScopes()
{
    markAllScopesRecursive(m_root);
}

void stc::Ast::markAllScopesRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STATEMENT)
    {
        currentNode->scopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::IF ||
             currentNode->type == NodeType::IF_ELSE ||
             currentNode->type == NodeType::WHILE ||
             currentNode->type == NodeType::WHILE ||
             currentNode->type == NodeType::DO_WHILE)
    {
        currentNode->operand2->scopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::FOR)
    {
        currentNode->operand4->scopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        currentNode->operand3->scopeId(m_countScopes);
        ++m_countScopes;
    }


    markAllScopesRecursive(currentNode->operand1);
    markAllScopesRecursive(currentNode->operand2);
    markAllScopesRecursive(currentNode->operand3);
    markAllScopesRecursive(currentNode->operand4);
}

void stc::Ast::markBreakContinueOperators()
{
    for (auto& [parentScopeNode, thisScopeNode] : m_allScopeNodes)
    {
        if (thisScopeNode->operand1 != nullptr &&
            (thisScopeNode->operand1->type == NodeType::FOR ||
             thisScopeNode->operand1->type == NodeType::WHILE ||
             thisScopeNode->operand1->type == NodeType::DO_WHILE))
        {
            if (thisScopeNode->operand1->type == NodeType::WHILE ||
                thisScopeNode->operand1->type == NodeType::DO_WHILE)
            {
                markBreakContinueOperatorsRecursive(thisScopeNode->operand1->operand2, thisScopeNode->scopeId());
            }
            else if (thisScopeNode->operand1->type == NodeType::FOR)
            {
                markBreakContinueOperatorsRecursive(thisScopeNode->operand1->operand4, thisScopeNode->scopeId());
            }
        }
    }
}

void stc::Ast::markBreakContinueOperatorsRecursive(stc::Node* currentNode, size_t currentScopeId)
{
    if (currentNode == nullptr)
        return;

    // if there is another cycle in the cycle, then you do not need to enter it
    if (currentNode->type == NodeType::FOR ||
        currentNode->type == NodeType::WHILE ||
        currentNode->type == NodeType::DO_WHILE)
    {
        return;
    }


    if (currentNode->type == NodeType::BREAK ||
        currentNode->type == NodeType::CONTINUE)
    {
        currentNode->scopeId(currentScopeId);
    }


    markBreakContinueOperatorsRecursive(currentNode->operand1, currentScopeId);
    markBreakContinueOperatorsRecursive(currentNode->operand2, currentScopeId);
    markBreakContinueOperatorsRecursive(currentNode->operand3, currentScopeId);
    markBreakContinueOperatorsRecursive(currentNode->operand4, currentScopeId);
}

void stc::Ast::markReturnOperator()
{
    for (const auto& function : m_functions.raw())
    {
        const auto functionSizeOfArguments = function->argumentsSize();
        const auto functionNode = function->implementationNode();

        markReturnOperatorRecursive(functionNode, functionSizeOfArguments);
    }

    for (const auto& a_class : m_classTable.raw())
    {
        for (const auto& function : a_class->functions().raw())
        {
            const auto functionSizeOfArguments = function->argumentsSize();
            const auto functionNode = function->implementationNode();

            markReturnOperatorRecursive(functionNode, functionSizeOfArguments);
        }
    }
}

void stc::Ast::markReturnOperatorRecursive(stc::Node* currentNode, size_t functionSizeOfArguments)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::RETURN)
    {
        currentNode->value = functionSizeOfArguments;
        return;
    }


    markReturnOperatorRecursive(currentNode->operand1, functionSizeOfArguments);
    markReturnOperatorRecursive(currentNode->operand2, functionSizeOfArguments);
    markReturnOperatorRecursive(currentNode->operand3, functionSizeOfArguments);
    markReturnOperatorRecursive(currentNode->operand4, functionSizeOfArguments);
}


void stc::Ast::identifyFunctions()
{
    identifyFunctionsRecursive(m_allScopeNodes[0].second->operand1);
}

void stc::Ast::identifyFunctionsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    // не обходим дерево для классов
    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
        return;

    // не обходим дерево для интерфейсов
    if (currentNode->type == NodeType::INTERFACE_IMPLEMENTATION)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        string functionName;

        try
        {
            functionName = any_cast<string>(currentNode->value);
        }
        catch (...)
        {
            const auto function = any_cast<Function*>(currentNode->value);
            functionName = function->name();
        }



        const auto returnType = any_cast<Type>(currentNode->operand1->value);


        vector<Type> argumentTypes;
        vector<Variable*> arguments;
        identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);

        size_t localVariableSize = 0;
        vector<Variable*> variables;
        identifyFunctionLocalVariablesRecursive(currentNode->operand3, localVariableSize, variables);

        const auto newFunction = new Function(functionName, returnType, argumentTypes, currentNode, localVariableSize, arguments, variables);

        m_functions.add(newFunction);


        currentNode->value = newFunction;
    }

    identifyFunctionsRecursive(currentNode->operand1);
    identifyFunctionsRecursive(currentNode->operand2);
}

void stc::Ast::identifyFunctionArgumentsRecursive(stc::Node* currentNode, vector<Type>& argumentTypes,
                                                  vector<Variable*>& arguments)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        const auto variable = any_cast<Variable*>(currentNode->value);

        const auto argumentName = variable->name();
        const auto argumentType = variable->type();


        argumentTypes.push_back(argumentType);

        variable->isArgument(true);

        arguments.push_back(variable);
    }

    identifyFunctionArgumentsRecursive(currentNode->operand1, argumentTypes, arguments);
    identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);
}

void stc::Ast::identifyFunctionLocalVariablesRecursive(stc::Node* currentNode, size_t& size,
                                                       vector<Variable*>& variables)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
        currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        const auto variable = any_cast<Variable*>(currentNode->value);

        const auto& variableType = variable->type();
        const auto& variableSize = variableType.size();


        size += variableSize;


        variables.push_back(variable);
        return;
    }


    identifyFunctionLocalVariablesRecursive(currentNode->operand1, size, variables);
    identifyFunctionLocalVariablesRecursive(currentNode->operand2, size, variables);
    identifyFunctionLocalVariablesRecursive(currentNode->operand3, size, variables);
    identifyFunctionLocalVariablesRecursive(currentNode->operand4, size, variables);
}



void stc::Ast::identifyFunctionCallArgumentsRecursive(stc::Node* currentNode, vector<stc::Type>& arguments)
{
    if (currentNode == nullptr)
        return;

    // если в аргументах функции вызывается другая функция, то ее обрабатывать не надо
    if (currentNode->type == NodeType::FUNCTION_CALL)
        return;


    if (currentNode->type == NodeType::FUNCTION_ARGS)
    {
        const auto& type = checkAndGiveExpressionType(currentNode->operand1);
        arguments.push_back(type);
    }

    identifyFunctionCallArgumentsRecursive(currentNode->operand1, arguments);
    identifyFunctionCallArgumentsRecursive(currentNode->operand2, arguments);
}

stc::vector<stc::Type> stc::Ast::getFunctionCallArguments(stc::Node* currentNode)
{
    vector<Type> types;

    if (currentNode->type == NodeType::FUNCTION_CALL)
        currentNode = currentNode->operand1;

    identifyFunctionCallArgumentsRecursive(currentNode, types);
    return types;
}


void stc::Ast::error(const string& message)
{
    throw std::logic_error("Semantic error! " + message);
}



void stc::Ast::handleImports()
{
    handleImportsRecursive(m_root);
}

void stc::Ast::handleImportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        vector<string> importNames;
        identifyAllImportName(currentNode, importNames);

        if (importNames.empty())
            return;


        auto importFilePath = any_cast<string>(currentNode->operand2->value);

        importFilePath.pop_back();
        importFilePath.erase(importFilePath.begin());

        auto path = m_filePath.remove_filename();
        path = path / importFilePath;
        path = path.lexically_normal();
        path.replace_extension(".ts");


        auto icm = new ICM(path.string(), "");

        icm->compile(false, false, false, true);

        const auto ast = icm->ast();
        const auto& astExportTables = ast->exportTable();

        vector<string> extendedImportNames;
        for (const auto& importName : importNames)
        {
            if (!astExportTables.contains(importName))
            {
                report(currentNode, ReportLevel::FatalError, "notExportedModule", "Module '\"" + importFilePath + "\"' not exported '" + (importName + "'."));
            }

            const auto exportElement = astExportTables.get(importName);
            const auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                const auto newFunction = new Function("", ReturnType(), {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);


                const auto functionNode = newFunction->implementationNode();
                vector<string> callFunctionNamesInFunction;
                identifyAllCallFunctionsNameInFunction(functionNode, callFunctionNamesInFunction);

                extendedImportNames.push_back(importName);

                for (const auto& functionName : callFunctionNamesInFunction)
                {
                    if (find(extendedImportNames.begin(), extendedImportNames.end(), functionName)
                        == extendedImportNames.end())
                    {
                        extendedImportNames.push_back(functionName);
                    }
                }
            }
            else if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                extendedImportNames.push_back(importName);
            }
        }

        for (const auto& importName : extendedImportNames)
        {
            const auto exportElement = astExportTables.get(importName);
            const auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                const auto newVariable = new Variable("", Type(), -1);
                *newVariable = *ast->m_allVariables.getByName(importName);

                m_importVariables.add(newVariable);
            }
            else if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                const auto newFunction = new Function("", ReturnType(), {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);

                m_importFunctions.add(newFunction);
            }
        }

        addImportFunctionsInTree();

        delete icm;
    }

    handleImportsRecursive(currentNode->operand1);
    handleImportsRecursive(currentNode->operand2);
    handleImportsRecursive(currentNode->operand3);
    handleImportsRecursive(currentNode->operand4);
}

void stc::Ast::identifyAllImportName(stc::Node* currentNode, vector<string>& importNames)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT_LIST_ELEMENT)
    {
        const auto importElementName = any_cast<string>(currentNode->value);
        importNames.push_back(importElementName);
    }

    identifyAllImportName(currentNode->operand1, importNames);
    identifyAllImportName(currentNode->operand2, importNames);
    identifyAllImportName(currentNode->operand3, importNames);
    identifyAllImportName(currentNode->operand4, importNames);
}

void stc::Ast::identifyAllExportName(stc::Node* currentNode, vector<string>& exportNames)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPORT_LIST_ELEMENT)
    {
        const auto exportElementName = any_cast<string>(currentNode->value);
        exportNames.push_back(exportElementName);
    }

    identifyAllExportName(currentNode->operand1, exportNames);
    identifyAllExportName(currentNode->operand2, exportNames);
    identifyAllExportName(currentNode->operand3, exportNames);
    identifyAllExportName(currentNode->operand4, exportNames);
}

void stc::Ast::handleExports()
{
    handleExportsRecursive(m_root);
}

void stc::Ast::handleExportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPORT)
    {
        vector<string> exportNames;
        identifyAllExportName(currentNode, exportNames);

        vector<string> extendedExportNames;
        for (const auto& exportName : exportNames)
        {
            auto isFunction = m_functions.contains(exportName);

            if (isFunction)
            {
                auto function = m_functions.get(exportName);
                auto functionNode = function->implementationNode();

                vector<string> callFunctionNamesInFunction;
                identifyAllCallFunctionsNameInFunction(functionNode, callFunctionNamesInFunction);

                extendedExportNames.push_back(exportName);

                for (const auto& functionName : callFunctionNamesInFunction)
                {
                    if (find(extendedExportNames.begin(), extendedExportNames.end(), functionName)
                        == extendedExportNames.end())
                    {
                        extendedExportNames.push_back(functionName);
                    }
                }
            }
            else
            {
                extendedExportNames.push_back(exportName);
            }
        }


        for (const auto& exportName : extendedExportNames)
        {
            const auto isFunction = m_functions.contains(exportName);
            const auto isVariable = m_allVariables.contains(exportName);

            if (isFunction)
            {
                const auto function = m_functions.get(exportName);
                m_exportTable.add(exportName, function);
            }
            else if (isVariable)
            {
                const auto variable = m_allVariables.getByName(exportName);
                m_exportTable.add(exportName, variable);
            }
        }
    }

    handleExportsRecursive(currentNode->operand1);
    handleExportsRecursive(currentNode->operand2);
    handleExportsRecursive(currentNode->operand3);
    handleExportsRecursive(currentNode->operand4);
}

const stc::ExportTable& stc::Ast::exportTable() const
{
    return m_exportTable;
}

void stc::Ast::addImportVariables()
{
    for (const auto& variable : m_importVariables.raw())
    {
        m_allVariables.add(variable);
        m_globalVariables.add(variable);
    }
}

void stc::Ast::addImportFunctionsInTree()
{
    auto statementListNode = (Node*)nullptr;

    for (const auto& function : m_importFunctions.raw())
    {
        const auto functionNode = function->implementationNode();

        const auto functionNewNode = copySubTree(functionNode);
        const auto statementNode = new Node(NodeType::STATEMENT, 0, functionNewNode);
        statementListNode = new Node(NodeType::STATEMENT_LIST, 0, statementListNode, statementNode);
    }

    const auto nodeForInsert = m_root->operand1->operand1;
    statementListNode = new Node(NodeType::STATEMENT_LIST, 0, statementListNode, nodeForInsert);

    const auto statementNode = new Node(NodeType::STATEMENT, 0, statementListNode);
    m_root->operand1 = statementNode;


    m_importFunctions.clear();
}

stc::Node* stc::Ast::copySubTree(stc::Node* currentNode)
{
    return copySubTreeRecursive(currentNode);
}

stc::Node* stc::Ast::copySubTreeRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return nullptr;

    const auto operand1 = copySubTreeRecursive(currentNode->operand1);
    const auto operand2 = copySubTreeRecursive(currentNode->operand2);
    const auto operand3 = copySubTreeRecursive(currentNode->operand3);
    const auto operand4 = copySubTreeRecursive(currentNode->operand4);

    auto returnNode = new Node(NodeType::IDENTIFIER);

    *returnNode = *currentNode;

    returnNode->operand1 = operand1;
    returnNode->operand2 = operand2;
    returnNode->operand3 = operand3;
    returnNode->operand4 = operand4;

    return returnNode;
}

void stc::Ast::identifyAllCallFunctionsNameInFunction(stc::Node* currentNode, vector<string>& functions)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        const auto function = any_cast<Function*>(currentNode->value);
        const auto functionName = function->name();
        functions.push_back(functionName);
        return;
    }

    identifyAllCallFunctionsNameInFunction(currentNode->operand1, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand2, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand3, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand4, functions);
}






void stc::Ast::analyze()
{
    Log::write("-- Started semantic correctness checks\n");
    Log::write("-- Started import processing\n");
    checkImports();
    handleImports();
    Log::write("-- Import processing done\n");

    Log::write("-- Started analysis preparation\n");
    identifyBlocks();

    markAllScopes();


    identifyVariables();
    identifyArrays();

    addImportVariables();


    identifyFunctions();
    markBreakContinueOperators();


    identifyClasses();


    identifyInterfaces();

    checkClassAccessInImplementation();
    addPointerToClassForAccessNodesInImplementation();
    addPointerToClassForThisInClassImplementation();
    transformStaticFunctionCallInClassImplementation();

    checkOperatorNew();
    transformOperatorNewToConstructorCall();


    addPointerToClassForAccessNodesOutImplementation();
    checkClassAccessOutImplementation();


    markReturnOperator();


    Log::write("-- Analysis preparation done\n");

    Log::write("-- Started constant verification\n");
    checkConstant();
    Log::write("-- Constant verification done\n");

    Log::write("-- Started array verification\n");
    checkArray();
    Log::write("-- Array verification done\n");

    Log::write("-- Started functions call verification\n");
    checkFunctionsCall();
    Log::write("-- Functions call verification done\n");

    Log::write("-- Started expression verification\n");
    checkExpressions();
    Log::write("-- Expression verification done\n");

    Log::write("-- Started assignment verification\n");
    checkAssignment();
    Log::write("-- Expression assignment done\n");

    Log::write("-- Started export verification\n");
    checkExports();
    handleExports();
    Log::write("-- Export verification done\n");

    Log::write("-- Semantic correctness checks done\n");



    if (!ErrorHandle::reports().empty())
    {
        throw std::logic_error("");
    }
}

void stc::Ast::report(Node* node, ReportLevel level, const string& name, const string& message)
{
    ErrorHandle::report(m_lexer, node, level, name, message);
}


void stc::Ast::giveInitializerCountElementRecursive(stc::Node* currentNode, size_t& size)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INITIALIZER_LIST_ELEMENT)
    {
        ++size;
    }


    giveInitializerCountElementRecursive(currentNode->operand1, size);
    giveInitializerCountElementRecursive(currentNode->operand2, size);
    giveInitializerCountElementRecursive(currentNode->operand3, size);
    giveInitializerCountElementRecursive(currentNode->operand4, size);
}

void stc::Ast::identifyInitializerRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INITIALIZER)
    {
        const auto elementType = giveInitializerType(currentNode);
        const auto type = Type(elementType.fundamentalType(), true);
        const auto countElement = giveInitializerCountElement(currentNode);

        const auto newInitializer = new Initializer(countElement, type, elementType);

        currentNode->value = newInitializer;
        return;
    }


    identifyInitializerRecursive(currentNode->operand1);
    identifyInitializerRecursive(currentNode->operand2);
    identifyInitializerRecursive(currentNode->operand3);
    identifyInitializerRecursive(currentNode->operand4);
}


