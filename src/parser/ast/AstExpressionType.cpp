#include "Ast.h"
#include "../../ICM/icm.h"

using namespace stc;

/**
 * @brief Основная функция для определения типа выражения
 * @param currentNode Указатель на корень поддерева выражения
 * @return Тип выражения
 */
Type Ast::checkAndGiveExpressionType(Node* currentNode)
{
    if (currentNode == nullptr)
        return Type();

    if (currentNode->type == NodeType::ADD ||
        currentNode->type == NodeType::SUB ||
        currentNode->type == NodeType::MUL ||
        currentNode->type == NodeType::DIV)
    {
        const auto firstOperandType = checkAndGiveExpressionType(currentNode->operand1);
        const auto secondOperandType = checkAndGiveExpressionType(currentNode->operand2);

        if (!firstOperandType.isReducibleWith(secondOperandType))
        {
            const auto& firstOperandTypeString = firstOperandType.toString();
            const auto& secondOperandTypeString = secondOperandType.toString();

            const auto& action = Node::nodeTypeToString(currentNode->type);

            report(currentNode, ReportLevel::Error, "invalidOperands", "Operator " + action + " cannot be applied to type '" + firstOperandTypeString + "' and '" + secondOperandTypeString + "'!");
        }

        return firstOperandType;
    }
    else if (currentNode->type == NodeType::UNARY_MINUS ||
             currentNode->type == NodeType::UNARY_PLUS)
    {
        const auto operandType = checkAndGiveExpressionType(currentNode->operand1);

        if (!operandType.is(FundamentalType::Number))
        {
            const auto& operandTypeString = operandType.toString();

            report(currentNode, ReportLevel::Error, "invalidOperandsForUnaryPlusOrMinus", "Unary plus and minus can only be used for type number, however, the type '" + operandTypeString + "' is passed");
        }

        return operandType;
    }
    if (currentNode->type == NodeType::NUMBER_CONST)
    {
        return Type("number");
    }
    else if (currentNode->type == NodeType::BOOLEAN_CONST)
    {
        return Type("boolean");
    }
    else if (currentNode->type == NodeType::STRING_CONST)
    {
        return Type("string", true);
    }
    else if (currentNode->type == NodeType::USING_VARIABLE)
    {
        const auto variable = any_cast<Variable*>(currentNode->value);

        return variable->type();
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        const auto variable = any_cast<Variable*>(currentNode->operand1->value);

        return variable->type().nonArrayType();
    }
    else if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
             currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        const auto typeNode = currentNode->operand1;
        return any_cast<Type>(typeNode->value);
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
        const auto initializer = any_cast<Initializer*>(currentNode->value);
        return initializer->type();
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        const auto type = expressionType(currentNode->operand1);


        if (!type.isArray())
        {
            report(currentNode, ReportLevel::Error, "accessForNonArray", "Attempting to access an element of a type '" + type.toString() + "' that is not an array!");
        }

        if (type.is(FundamentalType::Symbol, true))
        {
            return type;
        }

        return type.nonArrayType();
    }
    else if (Node::isComparisonOperator(currentNode->type))
    {
        return Type(FundamentalType::Boolean);
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        return checkAndGiveExpressionType(currentNode->operand1);
    }
    else if (currentNode->type == NodeType::INITIALIZER_LIST_ELEMENT)
    {
        return checkAndGiveExpressionType(currentNode->operand2);
    }
    else if (currentNode->type == NodeType::SET)
    {
        const auto lvalueType = checkAndGiveExpressionType(currentNode->operand1);
        const auto rvalueType = checkAndGiveExpressionType(currentNode->operand2);

        return lvalueType;
    }

        // Big TODO:
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



    throw std::logic_error("");
}



/**
 * @brief Функция возвращает тип списка инициализатора вида [...]
 * @param currentNode
 * @param initializerType
 * @param begin Флаг указывающий, что нужно определить первоначальный тип инициализатора
 */
void Ast::giveInitializerTypeRecursive(Node* currentNode, Type& initializerType, bool begin)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INITIALIZER_LIST_ELEMENT)
    {
        const auto elementNode = currentNode->operand2;
        const auto elementType = Ast::expressionType(elementNode);


        // Если обрабатывается первый элемент
        if (begin)
        {
            begin = false;
            initializerType = elementType;
        }
        else
        {
            if (!elementType.isReducibleWith(initializerType))
            {
                const auto& lvalueTypeString = elementType.toString();
                const auto& rvalueTypeString = initializerType.toString();

                report(currentNode, ReportLevel::Error, "initializerDifferentTypes", "The initializer is of type \"" + lvalueTypeString + "\", but contains an element of type \"" + rvalueTypeString +"\".");
            }
        }

    }


    giveInitializerTypeRecursive(currentNode->operand1, initializerType, begin);
    giveInitializerTypeRecursive(currentNode->operand2, initializerType, begin);
    giveInitializerTypeRecursive(currentNode->operand3, initializerType, begin);
    giveInitializerTypeRecursive(currentNode->operand4, initializerType, begin);
}