#include "Ast.h"
#include "../../ICM/icm.h"

stc::Ast::Ast(const path& filePath)
{
    this->m_countScopes = 1;
    this->m_filePath = filePath;
}

void stc::Ast::print(stc::Node* currentNode, size_t level)
{
    if (currentNode == nullptr)
        return;

    for (size_t i = 0; i < level; ++i)
        Log::write("  ");



    Log::write("+-");

    switch (currentNode->type)
    {
        case NodeType::VARIABLE_DECLARATION:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("new var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::USING_VARIABLE:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("use var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::CONSTANT_DECLARATION:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("new var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::USING_CONSTANT:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("use var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::DECLARATION_TYPE:
        {
            Log::write("var type ");
            Log::write("'" + any_cast<GenericType>(currentNode->value).toString() + "'");
            break;
        }
        case NodeType::NUMBER_CONST:
        {
            Log::write("number const ");
            Log::write(to_string(any_cast<number>(currentNode->value)));
            break;
        }
        case NodeType::BOOLEAN_CONST:
        {
            Log::write("boolean const ");
            Log::write(to_string(any_cast<int>(currentNode->value)));
            break;
        }
        case NodeType::ADD:
        {
            Log::write("add ");
            break;
        }
        case NodeType::SUB:
        {
            Log::write("sub ");
            break;
        }
        case NodeType::MUL:
        {
            Log::write("mul ");
            break;
        }
        case NodeType::DIV:
        {
            Log::write("div ");
            break;
        }
        case NodeType::LESS:
        {
            Log::write("less ");
            break;
        }
        case NodeType::GREATER:
        {
            Log::write("greater ");
            break;
        }
        case NodeType::EQUAL:
        {
            Log::write("equal ");
            break;
        }
        case NodeType::NOT_EQUAL:
        {
            Log::write("not equal ");
            break;
        }
        case NodeType::LESS_EQUAL:
        {
            Log::write("less equal ");
            break;
        }
        case NodeType::GREATER_EQUAL:
        {
            Log::write("greater equal ");
            break;
        }
        case NodeType::FOR:
        {
            Log::write("for ");
            break;
        }
        case NodeType::WHILE:
        {
            Log::write("while ");
            break;
        }
        case NodeType::BREAK:
        {
            Log::write("break ");
            break;
        }
        case NodeType::CONTINUE:
        {
            Log::write("continue ");
            break;
        }
        case NodeType::IF:
        {
            Log::write("if ");
            break;
        }
        case NodeType::IF_ELSE:
        {
            Log::write("if else ");
            break;
        }
        case NodeType::IDENTIFIER:
        {
            Log::write("identifier ");

            Log::write(any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::BEFORE_INC:
        {
            Log::write("before inc ");
            break;
        }
        case NodeType::BEFORE_DEC:
        {
            Log::write("before dec ");
            break;
        }
        case NodeType::AFTER_INC:
        {
            Log::write("after inc ");
            break;
        }
        case NodeType::AFTER_DEC:
        {
            Log::write("after dec ");
            break;
        }
        case NodeType::UNARY_PLUS:
        {
            Log::write("unary + ");
            break;
        }
        case NodeType::UNARY_MINUS:
        {
            Log::write("unary - ");
            break;
        }
        case NodeType::UNARY_EXCLAMATION:
        {
            Log::write("unary ! ");
            break;
        }
        case NodeType::LOGICAL_AND:
        {
            Log::write("AND ");
            break;
        }
        case NodeType::LOGICAL_OR:
        {
            Log::write("OR ");
            break;
        }
        case NodeType::SET:
        {
            Log::write("set ");
            break;
        }
        case NodeType::INDEX_CAPTURE:
        {
            Log::write("index capture ");
            break;
        }
        case NodeType::FUNCTION_CALL:
        {
            Log::write("function call ");
            Log::write(any_cast<Function*>(currentNode->value)->toString());
            break;
        }
        case NodeType::FUNCTION_ARG:
        {
            Log::write("function arg ");
            break;
        }
        case NodeType::EXPRESSION:
        {
            Log::write("expr { Type: '");
            Log::write(any_cast<GenericType>(currentNode->value).toString() + "' } ");
            break;
        }
        case NodeType::CONST_EXPRESSION:
        {
            Log::write("const expr ");
            break;
        }
        case NodeType::STATEMENT:
        {
            Log::write("stmt ");
            break;
        }
        case NodeType::SEQ_STATEMENT:
        {
            Log::write("seq ");
            break;
        }
        case NodeType::STATEMENT_LIST:
        {
            Log::write("seq ");
            break;
        }
        case NodeType::PROGRAM:
        {
            Log::write("prog ");
            break;
        }
        case NodeType::DO_WHILE:
        {
            Log::write("do (while) ");
            break;
        }
        case NodeType::INITIALIZER:
        {
            Log::write("initializer ");
            break;
        }
        case NodeType::INITIALIZER_LIST:
        {
            Log::write("initializer list ");
            break;
        }
        case NodeType::NEW:
        {
            Log::write("new ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION:
        {
            Log::write("function impl ");
            Log::write(any_cast<Function*>(currentNode->value)->toString());
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARG:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("function impl arg ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
        {
            Log::write("function impl return type ");
            Log::write("'" + any_cast<GenericType>(currentNode->value).toString() + "'");
            break;
        }
        case NodeType::RETURN:
        {
            Log::write("return { ");
            Log::write(to_string(any_cast<size_t>(currentNode->value)) + " }");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARGS:
        {
            Log::write("function impl args ");
            break;
        }
        case NodeType::FUNCTION_ARGS:
        {
            Log::write("function args ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_DEFAULT_ARG_VALUE:
        {
            Log::write("function impl default arg value ");
            break;
        }
        case NodeType::STRING_CONST:
        {
            Log::write("string const ");
            Log::write(any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::IMPORT:
        {
            Log::write("Import ");
            break;
        }
        case NodeType::EXPORT:
        {
            Log::write("Export ");
            break;
        }
        case NodeType::IMPORT_LIST:
        {
            Log::write("Import List");
            break;
        }
        case NodeType::IMPORT_LIST_ELEMENT:
        {
            Log::write("Import List Element '");
            Log::write(any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::IMPORT_FILE:
        {
            Log::write("Import File Path '");
            Log::write(any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::EXPORT_LIST:
        {
            Log::write("Export List");
            break;
        }
        case NodeType::EXPORT_LIST_ELEMENT:
        {
            Log::write("Export List Element '");
            Log::write(any_cast<string>(currentNode->value) + "'");
            break;
        }

        case NodeType::CLASS_IMPLEMENTATION:
        {
             Log::write("Class Definition '");
             Log::write(std::any_cast<Class*>(currentNode->value)->toString() + "'");
            break;
        }
        case NodeType::CLASS_IMPLEMENTATION_FIELD:
        {
             Log::write("Class Definition Field '");
             Log::write(std::any_cast<Variable*>(currentNode->value)->toString() + "'");
            break;
        }
        case NodeType::CLASS_IMPLEMENTATION_FUNCTION:
        {
             Log::write("Class Definition Function");
            break;
        }
        case NodeType::CLASS_THIS:
        {
            Log::write("Class Definition This. ");
            Log::write("Class name '" + std::any_cast<Class*>(currentNode->value)->name() + "'");
            break;
        }
        case NodeType::CLASS_FIELD_VISIBILITY:
        {
             Log::write("Class Field Visibility '");
             Log::write(Class::modifierToString(std::any_cast<ClassVisibilityModifier>(currentNode->value)) + "'");
            break;
        }
        case NodeType::CLASS_FIELD_STATIC:
        {
            Log::write("Class Field is Static ");
            break;
        }
        case NodeType::CLASS_ACCESS_TO_FIELD:
        {
             Log::write("Class Access To Field. ");
            Log::write("Class name '" + std::any_cast<Class*>(currentNode->value)->name() + "'");
            break;
        }
        case NodeType::CLASS_ACCESS_TO_STATIC_FIELD:
        {
            Log::write("Class Access To Static Field. ");
            Log::write("Class name '" + std::any_cast<Class*>(currentNode->value)->name() + "'");
            break;
        }
        case NodeType::INTERFACE_IMPLEMENTATION:
        {
             Log::write("Interface Implementation '");
             Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::INTERFACE_FIELD_DEFINITION:
        {
             Log::write("Interface Field Implementation '");
             Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::INTERFACE_FUNCTION_DEFINITION:
        {
             Log::write("Interface Function Definition '");
             Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }


    }

    if (currentNode->scopeId() != 4294967295)
    {
        Log::write(" (scope id: " + to_string(currentNode->scopeId()) + ")");
    }

    Log::write("\n");


    print(currentNode->operand1, level + 1);
    print(currentNode->operand2, level + 1);
    print(currentNode->operand3, level + 1);
    print(currentNode->operand4, level + 1);
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


void stc::Ast::identifyVariables()
{
    m_variableTables.reserve(m_allScopeNodes.size());

    for (auto& [parentScopeNode, thisScopeNode] : m_allScopeNodes)
    {
        auto scopeId = thisScopeNode->scopeId();
        auto newVariableTable = new VariableTable(scopeId);


        m_variableTables.push_back(newVariableTable);


        if (parentScopeNode != nullptr)
        {
            newVariableTable->setParent(parentScopeNode->variables);
        }

        auto className = string("Class1");
        if (parentScopeNode != nullptr && parentScopeNode->operand1->type == NodeType::CLASS_IMPLEMENTATION)
        {
            className = any_cast<string>(parentScopeNode->operand1);
        }

        thisScopeNode->variables = newVariableTable;

        identifyVariablesRecursive(thisScopeNode->operand1, newVariableTable, className);
    }
}

void stc::Ast::identifyGlobalVariables()
{
    identifyGlobalVariablesRecursive(m_root, m_globalVariables);
}

void stc::Ast::identifyVariablesRecursive(stc::Node* currentNode, stc::VariableTable* table, const string& className)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
        return;


    if (currentNode->type == NodeType::VARIABLE_DECLARATION || currentNode->type == NodeType::CONSTANT_DECLARATION ||
        currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto variableName = any_cast<string>(currentNode->value);


        if (table->contains(variableName))
        {
            error("The variable '" + variableName + "' has already been declared!");
        }


        auto isConst = currentNode->type == NodeType::CONSTANT_DECLARATION;



        auto variableType = any_cast<GenericType>(currentNode->operand1->value);
        auto scopeId = table->scopeId();


        auto newVariable = new Variable
        (
            variableName,
            variableType,
            scopeId,
            isConst
        );


        currentNode->value = newVariable;


        table->add(newVariable);
        m_allVariables.add(newVariable);

        return;
    }
    else if (currentNode->type == NodeType::USING_VARIABLE)
    {
        auto variableName = any_cast<string>(currentNode->value);


        if (m_classTable.contains(variableName))
            return;
        if (variableName == className)
            return;



        if (!table->containsGlobally(variableName) && !m_importVariables.contains(variableName))
        {
            error("The name '" + variableName + "' is not declared!");
        }


        auto [scopeId, variable] = !table->containsGlobally(variableName) ?
                                   m_importVariables.getVariableAndScopeIdWhereItDeclared(variableName)
                                                                          : table->getVariableAndScopeIdWhereItDeclared(variableName);

        currentNode->value = variable;
    }
    else if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;

        if (objectNode->type == NodeType::USING_VARIABLE)
        {
            identifyVariablesRecursive(objectNode, table, className);
        }

        return;
    }


    identifyVariablesRecursive(currentNode->operand1, table, className);
    identifyVariablesRecursive(currentNode->operand2, table, className);
    identifyVariablesRecursive(currentNode->operand3, table, className);
    identifyVariablesRecursive(currentNode->operand4, table, className);
}

void stc::Ast::checkConstant()
{
    checkConstantsRecursive(m_root);
}

void stc::Ast::checkConstantsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::SET)
    {
        const auto op1 = currentNode->operand1;
        const auto op2 = currentNode->operand2;

        if (op1->type == NodeType::USING_VARIABLE)
        {
            const auto variable = any_cast<Variable*>(op1->value);

            if (variable->isConst())
            {
                error("Assignment to constant '" + variable->name() + "' after declaration!");
            }
        }
    }

    if (currentNode->type == NodeType::EXPRESSION &&
        currentNode->operand1 != nullptr &&
        currentNode->operand1->type == NodeType::CONSTANT_DECLARATION)
    {
        error("The constant '" + any_cast<string>(currentNode->operand1->value) +
              "' must be initialized when defining!");
    }


    checkConstantsRecursive(currentNode->operand1);
    checkConstantsRecursive(currentNode->operand2);
    checkConstantsRecursive(currentNode->operand3);
    checkConstantsRecursive(currentNode->operand4);
}

void stc::Ast::checkArray()
{
    for (auto& [_, thisScopeNode] : m_allScopeNodes)
    {
        checkArrayRecursive(thisScopeNode->operand1);
    }
}

void stc::Ast::checkArrayRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STATEMENT)
        return;


    if (currentNode->type == NodeType::SET)
    {
        Node* op1 = currentNode->operand1;
        Node* op2 = currentNode->operand2;

        if (op1->type == NodeType::VARIABLE_DECLARATION)
        {
            auto op1Type = any_cast<GenericType>(op1->operand1->value);


//            if (op1Type.isArray() && !op1Type.is(FundamentalType::SYMBOL, true))
//            {
//                bool isInitializerList = op2->type == NodeType::INITIALIZER;
//                bool isOperatorNewArray = op2->type == NodeType::NEW &&
//                                             any_cast<string>(op2->operand1->value) == "Array";
//
//                if (!isInitializerList && !isOperatorNewArray)
//                {
//                    error("Invalid assignment to '" + any_cast<string>(op1->value) +
//                    "'! You can only assign a value of the form [...] or new Array(const_number) to an array!");
//                }
//            }

//        }

//        if (op1->type == NodeType::USING_VARIABLE)
//        {
//            auto variableName = any_cast<string>(op1->value);
//            auto variableScopeId = op1->scopeId();
//            auto variable = m_allVariables.getByNameAndScopeId(variableName, variableScopeId);
//            auto variableType = variable->type();
//
//            if (variableType.isArray() && !variableType.is(FundamentalType::SYMBOL, true))
//            {
//                error("Explicit array assignment is prohibited!");
//            }
//        }
    }


//    if (currentNode->type == NodeType::EXPRESSION && currentNode->operand1 != nullptr &&
//        currentNode->operand1->type == NodeType::VARIABLE_DECLARATION)
//    {
//        bool isArray = any_cast<GenericType>(currentNode->operand1->operand1->value).isArray();
//
//        if (isArray)
//        {
//            error("ERROR: The array '" + any_cast<string>(currentNode->operand1->value) +
//                  "' must be initialized when defining!");
//        }
    }


    checkArrayRecursive(currentNode->operand1);
    checkArrayRecursive(currentNode->operand2);
    checkArrayRecursive(currentNode->operand3);
    checkArrayRecursive(currentNode->operand4);
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


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        const auto functionName = any_cast<string>(currentNode->value);
        const auto returnType = any_cast<GenericType>(currentNode->operand1->value);


        vector<GenericType> argumentTypes;
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

void stc::Ast::identifyFunctionArgumentsRecursive(stc::Node* currentNode, vector<GenericType>& argumentTypes,
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



void stc::Ast::checkFunctionsCall()
{
    checkFunctionsCallRecursive(m_root);
}

void stc::Ast::checkFunctionsCallRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    // не проверяем вызовы функций через доступ к объекту класса
    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD || currentNode->type == NodeType::CLASS_ACCESS_TO_STATIC_FIELD)
        return;


    if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        const auto& functionName = any_cast<string>(currentNode->value);
        const auto& types = getFunctionCallArguments(currentNode);


        if (GlobalFunctions::contains(functionName))
        {
            const auto function = GlobalFunctions::get(functionName, types);
            currentNode->value = function;
        }
        else
        {
            const auto function = m_functions.get(functionName, types);
            currentNode->value = function;
        }


    }

    checkFunctionsCallRecursive(currentNode->operand1);
    checkFunctionsCallRecursive(currentNode->operand2);
    checkFunctionsCallRecursive(currentNode->operand3);
    checkFunctionsCallRecursive(currentNode->operand4);
}

void stc::Ast::identifyFunctionCallArgumentsRecursive(stc::Node* currentNode, vector<stc::GenericType>& arguments)
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

stc::vector<stc::GenericType> stc::Ast::getFunctionCallArguments(stc::Node* currentNode)
{
    vector<GenericType> types;

    if (currentNode->type == NodeType::FUNCTION_CALL)
        currentNode = currentNode->operand1;

    identifyFunctionCallArgumentsRecursive(currentNode, types);
    return types;
}


stc::GenericType stc::Ast::checkAndGiveExpressionType(stc::Node* currentNode)
{
    if (currentNode->type == NodeType::ADD ||
        currentNode->type == NodeType::SUB ||
        currentNode->type == NodeType::MUL ||
        currentNode->type == NodeType::DIV)
    {
        const auto op1 = currentNode->operand1;
        const auto op2 = currentNode->operand2;

        auto op1Type = checkAndGiveExpressionType(op1);
        auto op2Type = checkAndGiveExpressionType(op2);

        if (op1Type != op2Type)
        {
            const auto& op1TypeString = op1Type.toString();
            const auto& op2TypeString = op2Type.toString();

            const auto& action = Node::nodeTypeToString(currentNode->type);

            error("Operator " + action + " cannot be applied to type '" + op1TypeString + "' and '" + op2TypeString + "'!");
        }

        return op1Type;
    }
    else if (currentNode->type == NodeType::UNARY_MINUS ||
             currentNode->type == NodeType::UNARY_PLUS)
    {
        const auto op1 = currentNode->operand1;
        auto op1Type = checkAndGiveExpressionType(op1);

//        if (!op1Type.is(FundamentalType::NUMBER))
//        {
//            auto op1TypeString = op1Type.toString();
//            error("Unary plus and minus can only be used for type number, however, the type '" + op1TypeString + "' is passed");
//        }

        return op1Type;
    }
    else if (currentNode->type == NodeType::USING_VARIABLE ||
             currentNode->type == NodeType::NUMBER_CONST ||
             currentNode->type == NodeType::BOOLEAN_CONST ||
             currentNode->type == NodeType::STRING_CONST)
    {
        return variableTypeOfNode(currentNode);
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        const auto function = any_cast<Function*>(currentNode->value);

        return function->returnType();
    }
    else if (currentNode->type == NodeType::NEW)
    {
        const auto functionForNewNode = currentNode->operand1;
        const auto function = any_cast<Function*>(functionForNewNode->value);

        return function->returnType();
    }
    else if (currentNode->type == NodeType::INITIALIZER)
    {
        return GenericType("any");
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        const auto arrayVariable = any_cast<Variable*>(currentNode->operand1->value);
        auto& arrayType = arrayVariable->type();

//        if (!arrayType.isArray())
//        {
//            error("Attempting to access an element of a variable '" + arrayName + "' that is not an array!");
//        }
//
//        if (arrayType.is(FundamentalType::SYMBOL, true))
//        {
//            return arrayType;
//        }

//        return arrayType.nonArrayType();
        return arrayType;
    }
    else if (Node::isComparisonOperator(currentNode->type))
    {
        return GenericType("boolean");
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        return checkAndGiveExpressionType(currentNode->operand1);
    }


    return variableTypeOfNode(currentNode);
}

void stc::Ast::error(const string& message)
{
    throw std::logic_error("Semantic error! " + message);
}


stc::GenericType stc::Ast::variableTypeOfNode(stc::Node* currentNode)
{
    if (currentNode->type == NodeType::NUMBER_CONST)
    {
        return GenericType("number");
    }
    else if (currentNode->type == NodeType::BOOLEAN_CONST)
    {
        return GenericType("boolean");
    }
    else if (currentNode->type == NodeType::STRING_CONST)
    {
        return GenericType("string");
    }
    else if (currentNode->type == NodeType::USING_VARIABLE)
    {
        const auto variable = any_cast<Variable*>(currentNode->value);

        return variable->type();
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        const auto variable = any_cast<Variable*>(currentNode->operand1->value);

//        return variable->type().nonArrayType();
        return variable->type();
    }
    else if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
            currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        return any_cast<GenericType>(currentNode->operand1->value);
    }
    else if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto subjectNode = currentNode->operand2;

        if (subjectNode->type == NodeType::FUNCTION_CALL)
        {
            const auto function = any_cast<Function*>(subjectNode->value);
            auto functionReturnType = function->returnType();

            return functionReturnType;
        }
        else if (subjectNode->type == NodeType::USING_VARIABLE)
        {
            const auto variable = any_cast<Variable*>(subjectNode->value);
            auto variableType = variable->type();

            return variableType;
        }
        else
        {
            error("Something go wrong. Access to undefined!");
        }
    }
    else if (currentNode->type == NodeType::CLASS_ACCESS_TO_STATIC_FIELD)
    {
        const auto subjectNode = currentNode->operand1;

        if (subjectNode->type == NodeType::FUNCTION_CALL)
        {
            const auto function = any_cast<Function*>(subjectNode->value);
            auto functionReturnType = function->returnType();

            return functionReturnType;
        }
        else if (subjectNode->type == NodeType::USING_VARIABLE)
        {
            const auto variable = any_cast<Variable*>(subjectNode->value);
            auto variableType = variable->type();

            return variableType;
        }
        else
        {
            error("Something go wrong. Access to undefined!");
        }
    }

    return GenericType();
}

void stc::Ast::checkAssignment()
{
    checkAssignmentRecursive(m_root);
}

void stc::Ast::checkAssignmentRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::EXPRESSION)
    {
        const auto op1Node = currentNode->operand1;

        if (op1Node != nullptr && op1Node->type == NodeType::SET)
        {
            const auto setNode = op1Node;
            const auto lvalueNode = setNode->operand1;

            if (!Node::isLvalueNodeType(lvalueNode->type))
            {
                error("Non-correct assignment, can only assign to variables, constants (only when declaring)"
                      " and element of an array, however, the '" + Node::nodeTypeToString(lvalueNode->type) + "' is passed.");
            }

            const auto lvalueType = variableTypeOfNode(lvalueNode);


            const auto rvalueNode = setNode->operand2;
            const auto rvalueType = checkAndGiveExpressionType(rvalueNode);


            if (lvalueType != rvalueType)
            {
                const auto& lvalueTypeString = lvalueType.toString();
                const auto& rvalueTypeString = rvalueType.toString();

                error("Cannot assign a variable of type '" + lvalueTypeString + "' to '" + rvalueTypeString + "'!");
            }
        }


    }


    checkAssignmentRecursive(currentNode->operand1);
    checkAssignmentRecursive(currentNode->operand2);
    checkAssignmentRecursive(currentNode->operand3);
    checkAssignmentRecursive(currentNode->operand4);
}

void stc::Ast::printVariableTable()
{
    Log::write("-- Started print variable table\n");
    Log::write("{\n");
    m_allVariables.print();
    if (m_allVariables.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printFunctionsTable()
{
    Log::write("-- Started print function table\n");
    Log::write("{\n");
    m_functions.print();
    if (m_functions.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printImportVariableTable()
{
    Log::write("-- Started print import variable table\n");
    Log::write("{\n");
    m_importVariables.print();
    if (m_importVariables.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printImportFunctionsTable()
{
    Log::write("-- Started print import functions table\n");
    Log::write("{\n");
    m_importFunctions.print();
    if (m_importFunctions.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printClassesTable()
{
    Log::write("-- Started print classes table\n");
    Log::write("{\n");
    m_classTable.print();
    if (m_classTable.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::print() const noexcept
{
    Log::write("-- Started print AST\n");

    print(m_root, 0);

    Log::write("\n\n");
}

void stc::Ast::checkImports()
{
    checkImportsRecursive(m_root);
}

void stc::Ast::checkImportsRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        auto importFilePath = any_cast<string>(currentNode->operand2->value);

        importFilePath.pop_back();
        importFilePath.erase(importFilePath.begin());

        auto path = m_filePath.remove_filename();
        path = path / importFilePath;
        path = path.lexically_normal();
        path.replace_extension(".ts");


        if (!fs::exists(path))
        {
            error("Cannot open file: \"" + importFilePath + "\", full path: " + path.string());
        }
    }

    checkImportsRecursive(currentNode->operand1);
    checkImportsRecursive(currentNode->operand2);
    checkImportsRecursive(currentNode->operand3);
    checkImportsRecursive(currentNode->operand4);
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

        auto ast = icm->ast();
        const auto& astExportTables = ast->exportTable();

        vector<string> extendedImportNames;
        for (const auto& importName : importNames)
        {
            if (!astExportTables.contains(importName))
            {
                error("Module '\"" + importFilePath + "\"' not exported '" + (importName + "'."));
            }

            auto exportElement = astExportTables.get(importName);
            auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                auto newFunction = new Function("", ReturnType("void"), {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);


                auto functionNode = newFunction->implementationNode();
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
            auto exportElement = astExportTables.get(importName);
            auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                auto newVariable = new Variable("", GenericType("void"), -1);
                *newVariable = *ast->m_allVariables.getByName(importName);

                m_importVariables.add(newVariable);
            }
            else if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                auto newFunction = new Function("", ReturnType("void"), {}, nullptr);
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

void stc::Ast::checkExports()
{
    checkExportsRecursive(m_root);
}

void stc::Ast::checkExportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPORT)
    {
        vector<string> exportNames;
        identifyAllExportName(currentNode, exportNames);

        for (const auto& exportName : exportNames)
        {
            const auto isFunction = m_functions.contains(exportName);
            const auto isVariable = m_allVariables.contains(exportName);


            if (!isFunction && !isVariable)
            {
                error("Cannot find name \'" + exportName + "\"");
            }
        }
    }

    checkExportsRecursive(currentNode->operand1);
    checkExportsRecursive(currentNode->operand2);
    checkExportsRecursive(currentNode->operand3);
    checkExportsRecursive(currentNode->operand4);
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

void stc::Ast::identifyGlobalVariablesRecursive(Node* currentNode, VariableTable& globalVariablesTable)
{
    if (currentNode == nullptr)
        return;

    // не заходим в релизацию функций
    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;

    // не заходим в релизацию класса
    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
        return;


    if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
        currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        auto variable = any_cast<Variable*>(currentNode->value);

        variable->isGlobal(true);

        globalVariablesTable.add(variable);
        return;
    }

    identifyGlobalVariablesRecursive(currentNode->operand1, globalVariablesTable);
    identifyGlobalVariablesRecursive(currentNode->operand2, globalVariablesTable);
    identifyGlobalVariablesRecursive(currentNode->operand3, globalVariablesTable);
    identifyGlobalVariablesRecursive(currentNode->operand4, globalVariablesTable);
}

void stc::Ast::checkExpressions()
{
    checkExpressionsRecursive(m_root);
}

void stc::Ast::checkExpressionsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPRESSION)
    {
        const auto type = checkAndGiveExpressionType(currentNode);
        currentNode->value = type;
        return;
    }

    checkExpressionsRecursive(currentNode->operand1);
    checkExpressionsRecursive(currentNode->operand2);
    checkExpressionsRecursive(currentNode->operand3);
    checkExpressionsRecursive(currentNode->operand4);
}








void stc::Ast::identifyClasses()
{
    identifyClassesRecursive(m_allScopeNodes[0].second);
}

void stc::Ast::identifyClassesRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
    {
        auto className = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->operand1->scopeId();
        auto newClass = new Class(className);

        VariableTable variables;
        identifyClassFieldsRecursive(currentNode, scopeId, variables);
        newClass->fields(variables);

        FunctionTable functions;
        identifyClassFunctionsRecursive(currentNode, scopeId, functions);
        newClass->functions(functions);

        m_classTable.add(newClass);

        m_allClassImplementationNodes.push_back(currentNode);

        currentNode->value = newClass;
        return;
    }

    identifyClassesRecursive(currentNode->operand1);
    identifyClassesRecursive(currentNode->operand2);
}

void stc::Ast::identifyClassFieldsRecursive(stc::Node* currentNode, size_t scopeId, VariableTable& table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION_FIELD)
    {
        auto fieldName = any_cast<string>(currentNode->value);
        auto fieldType = any_cast<GenericType>(currentNode->operand1->value);
        auto visibilityModifier = any_cast<ClassVisibilityModifier>(currentNode->operand2->value);
        auto isStatic = currentNode->operand3 != nullptr;

        auto newField = new Variable(fieldName, fieldType, scopeId);

        newField->setVisibilityModifier(visibilityModifier);
        newField->setIsStatic(isStatic);

        table.add(newField);


        currentNode->value = newField;
        return;
    }

    identifyClassFieldsRecursive(currentNode->operand1, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand2, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand3, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand4, scopeId, table);
}

void stc::Ast::identifyClassFunctionsRecursive(stc::Node* currentNode, size_t scopeId, stc::FunctionTable& table)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION_FUNCTION)
    {
        auto functionNode = currentNode->operand1;

        auto functionName = any_cast<string>(functionNode->value);
        auto functionReturnType = any_cast<GenericType>(functionNode->operand1->value);


        vector<GenericType> argumentTypes;
        vector<Variable*> arguments;
        identifyFunctionArgumentsRecursive(functionNode->operand2, argumentTypes, arguments);


        size_t localVariableSize = 0;
        vector<Variable*> localVariables;
        identifyFunctionLocalVariablesRecursive(functionNode->operand3, localVariableSize, localVariables);


        auto visibilityModifier = any_cast<ClassVisibilityModifier>(currentNode->operand2->value);
        auto isStatic = currentNode->operand3 != nullptr;


        auto newFunction = new Function(functionName, functionReturnType, argumentTypes, functionNode, localVariableSize, arguments, localVariables);

        newFunction->setVisibilityModifier(visibilityModifier);
        newFunction->setIsStatic(isStatic);


        currentNode->operand1->value = newFunction;

        table.add(newFunction);
        return;
    }


    identifyClassFunctionsRecursive(currentNode->operand1, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand2, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand3, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand4, scopeId, table);
}





void stc::Ast::checkClassAccessInImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        checkClassAccessInImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::checkClassAccessInImplementationRecursive(Node* currentNode, Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        auto subjectNode = currentNode->operand2;
        auto subjectNodeIsSelfClass = (currentNode->operand1->type == NodeType::USING_VARIABLE) ? any_cast<string>(currentNode->operand1->value) == a_class->name() : false;


        if (subjectNode->type == NodeType::USING_VARIABLE)
        {
            auto fieldName = any_cast<string>(subjectNode->value);
            auto contains = a_class->fields().contains(fieldName);
            auto variable = a_class->fields().getByName(fieldName);
            auto isStatic = variable->isStatic();


            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a field named '" + fieldName + "'.");
            }

            if (!isStatic && subjectNodeIsSelfClass)
            {
                error("Access to non-static field '" + fieldName + "' at class '" + a_class->name() + "'.");
            }

            if (isStatic && !subjectNodeIsSelfClass)
            {
                error("Field '" + fieldName + "' is a static member of class '" + a_class->name() + "'");
            }

            subjectNode->value = variable;
        }
        else if (subjectNode->type == NodeType::FUNCTION_CALL)
        {
            auto functionName = any_cast<string>(subjectNode->value);
            auto types = getFunctionCallArguments(subjectNode);

            auto searchFunction = new Function(functionName, GenericType("void"), types);
            auto contains = a_class->functions().contains(searchFunction);
            auto function = a_class->functions().get(functionName, types);
            auto isStatic = function->isStatic();
            delete searchFunction;

            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a function named '" + functionName + "' with " + Function::argumentsToString(types) +  " argument list.");
            }

            if (!isStatic && subjectNodeIsSelfClass)
            {
                error("Access to non-static function '" + functionName + "' at class '" + a_class->name() + "'.");
            }

            if (isStatic && !subjectNodeIsSelfClass)
            {
                error("Function '" + functionName + "' is a static member of class '" + a_class->name() + "'");
            }

            subjectNode->value = function;
        }

        return;
    }

    checkClassAccessInImplementationRecursive(currentNode->operand1, a_class);
    checkClassAccessInImplementationRecursive(currentNode->operand2, a_class);
    checkClassAccessInImplementationRecursive(currentNode->operand3, a_class);
    checkClassAccessInImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::transformStaticFunctionCallInClassImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        transformStaticFunctionCallInClassImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::transformStaticFunctionCallInClassImplementationRecursive(stc::Node* currentNode, stc::Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;
        const auto subjectNode = currentNode->operand2;


        if (objectNode->type == NodeType::USING_VARIABLE)
        {
            auto name = any_cast<string>(objectNode->value);
            auto isClassName = a_class->name() == name;

            if (isClassName)
            {
                currentNode->value = a_class;
                currentNode->type = NodeType::CLASS_ACCESS_TO_STATIC_FIELD;

                delete currentNode->operand1;
                currentNode->operand1 = subjectNode;
                currentNode->operand2 = nullptr;
            }
        }
        return;
    }

    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand1, a_class);
    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand2, a_class);
    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand3, a_class);
    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::addPointerToClassForThisInClassImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        addPointerToClassForThisInClassImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::addPointerToClassForThisInClassImplementationRecursive(stc::Node* currentNode, stc::Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_THIS)
    {
        currentNode->value = a_class;
        return;
    }

    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand1, a_class);
    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand2, a_class);
    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand3, a_class);
    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::addPointerToClassForAccessNodesInImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        addPointerToClassForAccessNodesInImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::addPointerToClassForAccessNodesInImplementationRecursive(stc::Node* currentNode, stc::Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        if (currentNode->operand1->type == NodeType::CLASS_THIS)
        {
            currentNode->value = a_class;
            return;
        }
    }

    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand1, a_class);
    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand2, a_class);
    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand3, a_class);
    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::checkOperatorNew()
{
    checkOperatorNewRecursive(m_root);
}

void stc::Ast::checkOperatorNewRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::NEW)
    {
        auto functionNode = currentNode->operand1;

        if (functionNode->type != NodeType::FUNCTION_CALL)
        {
            error("The type '" + Node::nodeTypeToString(functionNode->type) + "' is not constructible.");
        }

        auto functionName = any_cast<string>(functionNode->value);

        auto contains = m_classTable.contains(functionName);

        if (!contains)
        {
            error("The type '" + functionName + "' is not one of the defined classes.");
        }
    }

    checkOperatorNewRecursive(currentNode->operand1);
    checkOperatorNewRecursive(currentNode->operand2);
    checkOperatorNewRecursive(currentNode->operand3);
    checkOperatorNewRecursive(currentNode->operand4);
}


void stc::Ast::transformOperatorNewToConstructorCall()
{
    transformOperatorNewToConstructorCallRecursive(m_root);
}

void stc::Ast::transformOperatorNewToConstructorCallRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::SET)
    {
        auto objectNode = currentNode->operand1;
        auto subjectNode = currentNode->operand2;

        if (subjectNode->type == NodeType::NEW)
        {
            auto newNode = subjectNode;
            auto functionNode = subjectNode->operand1;
            auto functionName = any_cast<string>(functionNode->value);
            auto functionArgsNode = functionNode->operand1;
            auto a_class = m_classTable.get(functionName);


            auto constructorNode = new Node(NodeType::FUNCTION_CALL, string("constructor"), functionArgsNode);
            auto accessNode = Node(NodeType::CLASS_ACCESS_TO_FIELD, a_class, objectNode, constructorNode);

            *currentNode = accessNode;

            return;
        }
    }

    transformOperatorNewToConstructorCallRecursive(currentNode->operand1);
    transformOperatorNewToConstructorCallRecursive(currentNode->operand2);
    transformOperatorNewToConstructorCallRecursive(currentNode->operand3);
    transformOperatorNewToConstructorCallRecursive(currentNode->operand4);
}

void stc::Ast::addPointerToClassForAccessNodesOutImplementation()
{
    addPointerToClassForAccessNodesOutImplementationRecursive(m_root);
}

void stc::Ast::addPointerToClassForAccessNodesOutImplementationRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;

        const auto objectType = checkAndGiveExpressionType(objectNode);

        const auto& className = objectType.toString();

        const auto contains = m_classTable.contains(className);

        if (!contains)
        {
            error("The name '" + className + "' is not a class.");
        }

        const auto a_class = m_classTable.get(className);
        currentNode->value = a_class;

        return;
    }

    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand1);
    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand2);
    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand3);
    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand4);
}

void stc::Ast::identifyVariablesOfClasses()
{
    //identifyVariablesOfClassesRecursive(m_root);
}

void stc::Ast::identifyVariablesOfClassesRecursive(stc::Node* currentNode, stc::VariableTable* table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
        return;


    if (currentNode->type == NodeType::USING_VARIABLE)
    {
        auto variableName = any_cast<string>(currentNode->value);


        if (!table->containsGlobally(variableName) && !m_importVariables.contains(variableName))
        {
            error("The name '" + variableName + "' is not declared!");
        }


        auto [scopeId, variable] = !table->containsGlobally(variableName) ?
                                   m_importVariables.getVariableAndScopeIdWhereItDeclared(variableName)
                                                                          : table->getVariableAndScopeIdWhereItDeclared(variableName);

        currentNode->scopeId(scopeId);
    }



    identifyVariablesOfClassesRecursive(currentNode->operand1, table);
    identifyVariablesOfClassesRecursive(currentNode->operand2, table);
    identifyVariablesOfClassesRecursive(currentNode->operand3, table);
    identifyVariablesOfClassesRecursive(currentNode->operand4, table);
}

void stc::Ast::checkClassAccessOutImplementation()
{
    checkClassAccessOutImplementationRecursive(m_root);
}

void stc::Ast::checkClassAccessOutImplementationRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
        return;

    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;
        const auto subjectNode = currentNode->operand2;


        const auto a_class = any_cast<Class*>(currentNode->value);

        if (subjectNode->type == NodeType::USING_VARIABLE)
        {
            const auto variableName = any_cast<string>(subjectNode->value);
            const auto contains = a_class->fields().contains(variableName);

            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a field named '" + variableName + "'.");
            }

            const auto variable = a_class->fields().getByName(variableName);
            const auto isStatic = variable->isStatic();

            const auto visibilityModifier = variable->visibilityModifier();
            const auto isPublic = visibilityModifier == ClassVisibilityModifier::PUBLIC;


            if (!isPublic)
            {
                if (visibilityModifier == ClassVisibilityModifier::PROTECTED)
                {
                    error("Variable '" + variableName + "' is protected and only accessible within class '" + a_class->name() + "' and its subclasses.");
                }
                else if (visibilityModifier == ClassVisibilityModifier::PRIVATE)
                {
                    error("Variable '" + variableName + "' is private and only accessible within class '" + a_class->name() + "'.");
                }
            }

//            if (!isStatic && subjectNodeIsSelfClass)
//            {
//                error("Access to non-static field '" + fieldName + "' at class '" + a_class->name() + "'.");
//            }
//
//            if (isStatic && !subjectNodeIsSelfClass)
//            {
//                error("Field '" + fieldName + "' is a static member of class '" + a_class->name() + "'");
//            }

            subjectNode->value = variable;
        }
        else if (subjectNode->type == NodeType::FUNCTION_CALL)
        {
            const auto functionName = any_cast<string>(subjectNode->value);
            const auto types = getFunctionCallArguments(subjectNode);

            const auto searchFunction = new Function(functionName, GenericType("void"), types);
            const auto contains = a_class->functions().contains(searchFunction);
            delete searchFunction;

            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a function named '" + functionName + "' with " + Function::argumentsToString(types) +  " argument list.");
            }

            const auto function = a_class->functions().get(functionName, types);
            const auto isStatic = function->isStatic();

            const auto visibilityModifier = function->visibilityModifier();
            const auto isPublic = visibilityModifier == ClassVisibilityModifier::PUBLIC;


            if (!isPublic)
            {
                if (visibilityModifier == ClassVisibilityModifier::PROTECTED)
                {
                    error("Function '" + functionName + "' is protected and only accessible within class '" + a_class->name() + "' and its subclasses.");
                }
                else if (visibilityModifier == ClassVisibilityModifier::PRIVATE)
                {
                    error("Function '" + functionName + "' is private and only accessible within class '" + a_class->name() + "'.");
                }
            }

//            if (!isStatic && subjectNodeIsSelfClass)
//            {
//                error("Access to non-static function '" + functionName + "' at class '" + a_class->name() + "'.");
//            }
//
//            if (isStatic && !subjectNodeIsSelfClass)
//            {
//                error("Function '" + functionName + "' is a static member of class '" + a_class->name() + "'");
//            }

            subjectNode->value = function;
        }

        return;
    }

    checkClassAccessOutImplementationRecursive(currentNode->operand1);
    checkClassAccessOutImplementationRecursive(currentNode->operand2);
    checkClassAccessOutImplementationRecursive(currentNode->operand3);
    checkClassAccessOutImplementationRecursive(currentNode->operand4);
}
