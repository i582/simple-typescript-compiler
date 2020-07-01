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
                report(currentNode, ReportLevel::Error, "assignmentToConstant",
                       "Assignment to constant '" + variable->name() + "' after declaration!");
            }
        }
    }

    if (currentNode->type == NodeType::EXPRESSION &&
        currentNode->operand1 != nullptr &&
        currentNode->operand1->type == NodeType::CONSTANT_DECLARATION)
    {
        report(currentNode->operand1, ReportLevel::Error, "constantNotInit",
               "The constant '" + any_cast<Variable*>(currentNode->operand1->value)->name() +
               "' must be initialized when defining!");
    }


    checkConstantsRecursive(currentNode->operand1);
    checkConstantsRecursive(currentNode->operand2);
    checkConstantsRecursive(currentNode->operand3);
    checkConstantsRecursive(currentNode->operand4);
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

        auto function = (Function*) nullptr;
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



    }



}

void stc::Ast::checkFunctionReturnOperator()
{
    for (const auto& function : m_functions.raw())
    {
        checkFunctionReturnOperatorRecursive(function->implementationNode(), function);
    }
}

void stc::Ast::checkFunctionReturnOperatorRecursive(stc::Node* currentNode, Function* function)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::RETURN)
    {
        const auto returnExpressionNode = currentNode->operand1->operand1;
        const auto functionReturnType = function->returnType();

        if (returnExpressionNode == nullptr && !functionReturnType.is(FundamentalType::Void))
        {
            ErrorHandle::report(m_lexer, currentNode, ReportLevel::Error, "emptyReturnInNonVoidFunction",
                                "Non-void function '" + function->name() + "' should return a value");
            return;
        }

        if (returnExpressionNode != nullptr && functionReturnType.is(FundamentalType::Void))
        {
            ErrorHandle::report(m_lexer, currentNode, ReportLevel::Error, "nonEmptyReturnInVoidFunction",
                                "Void function '" + function->name() + "' should not return a value");
            return;
        }

        if (returnExpressionNode == nullptr && functionReturnType.is(FundamentalType::Void))
        {
            return;
        }

        const auto returnExpressionType = Ast::expressionType(returnExpressionNode);

        if (!functionReturnType.isReducibleWith(returnExpressionType))
        {
            ErrorHandle::report(m_lexer, currentNode, ReportLevel::Error, "errorReturnType",
                                "No viable conversion from returned value of type '" + returnExpressionType.toString() +
                                "' to function return type '" + functionReturnType.toString() + "'");
            return;
        }
    }


    checkFunctionReturnOperatorRecursive(currentNode->operand1, function);
    checkFunctionReturnOperatorRecursive(currentNode->operand2, function);
    checkFunctionReturnOperatorRecursive(currentNode->operand3, function);
    checkFunctionReturnOperatorRecursive(currentNode->operand4, function);
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
                report(currentNode, ReportLevel::Error, "errorAssignment",
                       "Non-correct assignment, can only assign to variables, constants (only when declaring)"
                       " and element of an array, however, the '" + Node::nodeTypeToString(lvalueNode->type) +
                       "' is passed.");
            }

            const auto rvalueNode = setNode->operand2;
            const auto rvalueType = checkAndGiveExpressionType(rvalueNode);


            if (!lvalueType.isReducibleWith(rvalueType))
            {
                const auto& lvalueTypeString = lvalueType.toString();
                const auto& rvalueTypeString = rvalueType.toString();

                report(lvalueNode, ReportLevel::Error, "errorAssignmentOperandsType",
                       "Cannot assign a variable of type '" + lvalueTypeString + "' to '" + rvalueTypeString + "'!");
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


