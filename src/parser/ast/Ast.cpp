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

    identifyGlobalVariablesRecursive(m_root);

    identifyInitializers();

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




    Log::write("-- Started functions call verification\n");
    checkFunctionsCall();
    Log::write("-- Functions call verification done\n");

    replaceStringOperatorsToMethod(m_root);

    checkFunctionReturnOperator();

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


