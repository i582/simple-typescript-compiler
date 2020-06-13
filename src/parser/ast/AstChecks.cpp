#include "Ast.h"
#include "../../ICM/icm.h"


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
                report(currentNode, ReportLevel::Error, "assignmentToConstant", "Assignment to constant '" + variable->name() + "' after declaration!");
            }
        }
    }

    if (currentNode->type == NodeType::EXPRESSION &&
        currentNode->operand1 != nullptr &&
        currentNode->operand1->type == NodeType::CONSTANT_DECLARATION)
    {
        report(currentNode->operand1, ReportLevel::Error, "constantNotInit", "The constant '" + any_cast<Variable*>(currentNode->operand1->value)->name() +
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
            auto op1Type = any_cast<Type>(op1->operand1->value);


//            if (op1Type.isArray() && !op1Type.is(FundamentalType::SYMBOL, true))
//            {
//                bool isInitializerList = op2->type == NodeType::INITIALIZER;
//                bool isOperatorNewArray = op2->type == NodeType::NEW &&
//                                             any_cast<string>(op2->operand1->value) == "Array";
//
//                if (!isInitializerList && !isOperatorNewArray)
//                {
//                    report(op1, ReportLevel::Error, "invalidAssignmentToArray", "Invalid assignment to '" + any_cast<Variable*>(op1->value)->name() +
//                                                                                        "'! You can only assign a value of the form [...] or new Array(const_number) to an array!");
//                }
//            }
        }

//        if (op1->type == NodeType::USING_VARIABLE)
//        {
//            const auto variable = any_cast<Variable*>(op1->value);
//            const auto variableName = variable->name();
//            const auto variableType = variable->type();
//
//            if (variableType.isArray() && !variableType.is(FundamentalType::Symbol, true))
//            {
//                report(currentNode, ReportLevel::Error, "invalidExplicitAssignmentToArray", "Explicit array assignment is prohibited!");
//            }
//        }
    }


    if (currentNode->type == NodeType::EXPRESSION && currentNode->operand1 != nullptr &&
        currentNode->operand1->type == NodeType::VARIABLE_DECLARATION)
    {
        bool isArray = any_cast<Type>(currentNode->operand1->operand1->value).isArray();

        if (isArray)
        {
            report(currentNode->operand1, ReportLevel::Error, "arrayNotInit", "The array '" + any_cast<Variable*>(currentNode->operand1->value)->name() +
                                                                              "' must be initialized when defining!");
        }
    }


    checkArrayRecursive(currentNode->operand1);
    checkArrayRecursive(currentNode->operand2);
    checkArrayRecursive(currentNode->operand3);
    checkArrayRecursive(currentNode->operand4);
}



void stc::Ast::checkFunctionsCall()
{
    checkFunctionsCallRecursive(m_root);
}

void stc::Ast::checkFunctionsCallRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    checkFunctionsCallRecursive(currentNode->operand1);
    checkFunctionsCallRecursive(currentNode->operand2);
    checkFunctionsCallRecursive(currentNode->operand3);
    checkFunctionsCallRecursive(currentNode->operand4);

    // не проверяем вызовы функций через доступ к объекту класса
    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD || currentNode->type == NodeType::CLASS_ACCESS_TO_STATIC_FIELD)
        return;



    if (currentNode->type == NodeType::FUNCTION_CALL)
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


        const auto& types = getFunctionCallArguments(currentNode);

        auto function = (Function*)nullptr;
        if (GlobalFunctions::contains(functionName))
        {
            function = GlobalFunctions::get(functionName, types);
            currentNode->value = function;
        }
        else
        {
            function = m_functions.get(functionName, types);
            currentNode->value = function;
        }


        currentNode->value = function;
        return;
    }

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
            const auto lvalueType = checkAndGiveExpressionType(lvalueNode);

            if (!Node::isLvalueNodeType(lvalueNode->type))
            {
                report(currentNode, ReportLevel::Error, "errorAssignment", "Non-correct assignment, can only assign to variables, constants (only when declaring)"
                                                                           " and element of an array, however, the '" + Node::nodeTypeToString(lvalueNode->type) + "' is passed.");
            }

            const auto rvalueNode = setNode->operand2;
            const auto rvalueType = checkAndGiveExpressionType(rvalueNode);


            if (!lvalueType.isReducibleWith(rvalueType))
            {
                const auto& lvalueTypeString = lvalueType.toString();
                const auto& rvalueTypeString = rvalueType.toString();

                report(lvalueNode, ReportLevel::Error, "errorAssignmentOperandsType", "Cannot assign a variable of type '" + lvalueTypeString + "' to '" + rvalueTypeString + "'!");
            }
        }


    }


    checkAssignmentRecursive(currentNode->operand1);
    checkAssignmentRecursive(currentNode->operand2);
    checkAssignmentRecursive(currentNode->operand3);
    checkAssignmentRecursive(currentNode->operand4);
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
        const auto type = Ast::expressionType(currentNode);
        currentNode->value = type;
        return;
    }

    checkExpressionsRecursive(currentNode->operand1);
    checkExpressionsRecursive(currentNode->operand2);
    checkExpressionsRecursive(currentNode->operand3);
    checkExpressionsRecursive(currentNode->operand4);
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
            report(currentNode, ReportLevel::FatalError, "errorPathToImportFile", "Cannot open file: \"" + importFilePath + "\", full path: " + path.string());
        }
    }

    checkImportsRecursive(currentNode->operand1);
    checkImportsRecursive(currentNode->operand2);
    checkImportsRecursive(currentNode->operand3);
    checkImportsRecursive(currentNode->operand4);
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
                report(currentNode, ReportLevel::FatalError, "errorExportName", "Cannot find name \'" + exportName + "\"");
            }
        }
    }

    checkExportsRecursive(currentNode->operand1);
    checkExportsRecursive(currentNode->operand2);
    checkExportsRecursive(currentNode->operand3);
    checkExportsRecursive(currentNode->operand4);
}
