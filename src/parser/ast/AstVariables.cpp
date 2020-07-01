#include "Ast.h"
#include "../../ICM/icm.h"


void stc::Ast::identifyVariables()
{
    m_variableTables.reserve(m_allScopeNodes.size());

    for (auto& [parentScopeNode, thisScopeNode] : m_allScopeNodes)
    {
        const auto scopeId = thisScopeNode->scopeId();
        const auto newVariableTable = new VariableTable(scopeId);


        m_variableTables.push_back(newVariableTable);


        if (parentScopeNode != nullptr)
        {
            newVariableTable->setParent(parentScopeNode->variables);
        }


        // TODO:
        auto className = string("Class1");
        if (parentScopeNode != nullptr && parentScopeNode->operand1->type == NodeType::CLASS_IMPLEMENTATION)
        {
            className = any_cast<string>(parentScopeNode->operand1);
        }

        thisScopeNode->variables = newVariableTable;

        identifyVariablesRecursive(thisScopeNode->operand1, newVariableTable, className);
    }
}

void stc::Ast::identifyVariablesRecursive(stc::Node* currentNode, stc::VariableTable* table, const string& className)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
        return;

    // не выделяем переменные в функциях интерфейса
    if (currentNode->type == NodeType::INTERFACE_IMPLEMENTATION)
        return;


    auto forDeduceVariableType = (Node*)nullptr;
    if (currentNode->type == NodeType::SET)
    {
        forDeduceVariableType = currentNode->operand2;
        identifyVariablesRecursive(forDeduceVariableType, table, className);

        currentNode = currentNode->operand1;
    }

    if (currentNode->type == NodeType::VARIABLE_DECLARATION || currentNode->type == NodeType::CONSTANT_DECLARATION ||
        currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        string variableName;

        try
        {
            variableName = any_cast<string>(currentNode->value);
        }
        catch (...)
        {
            const auto variable = any_cast<Variable*>(currentNode->value);
            variableName = variable->name();
        }


        if (table->contains(variableName))
        {
            report(currentNode, ReportLevel::Error, "variableRedeclaration", "The variable '" + variableName + "' has already been declared!");
        }


        const auto isConst = currentNode->type == NodeType::CONSTANT_DECLARATION;


        auto variableType = Type();


        if (currentNode->operand1 == nullptr)
        {
            variableType = Ast::expressionType(forDeduceVariableType);

            const auto variableTypeNode = new Node(NodeType::DECLARATION_TYPE, variableType);
            currentNode->operand1 = variableTypeNode;
        }
        else
        {
            variableType = any_cast<Type>(currentNode->operand1->value);
        }


        const auto scopeId = table->scopeId();


        const auto newVariable = new Variable
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
        string variableName;

        try
        {
            variableName = any_cast<string>(currentNode->value);
        }
        catch (...)
        {
            const auto variable = any_cast<Variable*>(currentNode->value);
            variableName = variable->name();
        }


        if (m_classTable.contains(variableName))
            return;
        if (variableName == className)
            return;


        if (!table->containsGlobally(variableName) && !m_importVariables.contains(variableName))
        {
            report(currentNode, ReportLevel::FatalError, "variableNotDeclared", "The variable '" + variableName + "' is not declared!");
        }


        const auto [scopeId, variable] = !table->containsGlobally(variableName) ?
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


void stc::Ast::identifyGlobalVariablesRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;

    if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
        currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        const auto variable = any_cast<Variable*>(currentNode->value);

        variable->isGlobal(true);

        //globalVariablesTable.add(variable);
        return;
    }


    identifyGlobalVariablesRecursive(currentNode->operand1);
    identifyGlobalVariablesRecursive(currentNode->operand2);
    identifyGlobalVariablesRecursive(currentNode->operand3);
    identifyGlobalVariablesRecursive(currentNode->operand4);
}






void stc::Ast::identifyInitializers()
{
    identifyInitializerRecursive(m_root);

    //identifyArraysRecursive(m_root);
}
//
//void stc::Ast::identifyArraysRecursive(stc::Node* currentNode)
//{
//    if (currentNode == nullptr)
//        return;
//
//
//    if (currentNode->type == NodeType::SET &&
//        currentNode->operand1 != nullptr &&
//        currentNode->operand2 != nullptr)
//    {
//        const auto op1Node = currentNode->operand1;
//        const auto op2Node = currentNode->operand2;
//
//        if (op1Node->type == NodeType::VARIABLE_DECLARATION)
//        {
//            const auto arrayNode = op1Node;
//
//
//            const auto arrayVariable = any_cast<Variable*>(arrayNode->value);
//            const auto arrayType = arrayVariable->type();
//            const auto arrayName = arrayVariable->name();
//
//
//            const auto initializerNode = currentNode->operand2;
//
//            if (arrayType.isArray())
//            {
//                if (initializerNode->type == NodeType::INITIALIZER)
//                {
//                    vector<VariableValue> arrayValues;
//                    const auto arrayValueType = arrayType.nonArrayType();
//                    identifyArrayInitializerListRecursive(initializerNode, arrayValues, arrayValueType);
//
//
//                    m_arrays.emplace_back(arrayName, arrayValues.size(), arrayValues, arrayVariable);
//                }
//                else if (initializerNode->type == NodeType::NEW)
//                {
//                    const auto callingFunctionNode = initializerNode->operand1;
//                    const auto callingFunctionName = any_cast<string>(callingFunctionNode->value);
//
//
//                    if (callingFunctionName == "Array")
//                    {
//                        const auto arraySize = (size_t)any_cast<number>(callingFunctionNode->operand1->operand1->value);
//
//                        m_arrays.push_back(Array(arrayName, arraySize, {}, arrayVariable));
//                    }
//                    else
//                    {
//                        report(currentNode, ReportLevel::Error, "errorNewFunctionForArray", "To initialize an array using the new operator, you must use the Array function!");
//                    }
//                }
//                else
//                {
//
//                }
//            }
//        }
//
//    }
//    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
//    {
//        const auto arrayVariable = any_cast<Variable*>(currentNode->value);
//        const auto arrayType = arrayVariable->type();
//        const auto arrayName = arrayVariable->name();
//
//
//        if (arrayType.isArray())
//        {
//            m_arrays.push_back(Array(arrayName, 0, {}, arrayVariable));
//        }
//    }
//
//
//    identifyArraysRecursive(currentNode->operand1);
//    identifyArraysRecursive(currentNode->operand2);
//    identifyArraysRecursive(currentNode->operand3);
//    identifyArraysRecursive(currentNode->operand4);
//}
