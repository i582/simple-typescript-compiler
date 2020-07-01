#include "Ast.h"
#include "../../ICM/icm.h"

void stc::Ast::replaceStringOperatorsToMethod(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    replaceStringOperatorsToMethod(currentNode->operand1);
    replaceStringOperatorsToMethod(currentNode->operand2);
    replaceStringOperatorsToMethod(currentNode->operand3);
    replaceStringOperatorsToMethod(currentNode->operand4);

    if (currentNode->type == NodeType::ADD)
    {
        const auto firstOperand = currentNode->operand1;
        const auto secondOperand = currentNode->operand2;

        const auto firstOperandType = Ast::expressionType(firstOperand);
        const auto secondOperandType = Ast::expressionType(secondOperand);

        if (firstOperandType.is(FundamentalType::Symbol, true))
        {
            const auto concatFunction = GlobalFunctions::get("concat");
            const auto functionCallNode = Node(NodeType::FUNCTION_CALL, concatFunction, firstOperand, secondOperand);



            const auto secondOperandArgs = new Node(NodeType::FUNCTION_ARGS, concatFunction, firstOperand);
            const auto firstOperandArgs = new Node(NodeType::FUNCTION_ARGS, concatFunction, secondOperand, secondOperandArgs);


            currentNode->type = NodeType::FUNCTION_CALL;
            currentNode->value = concatFunction;

            currentNode->operand1 = firstOperandArgs;
            currentNode->operand2 = nullptr;
        }
    }
    else if (currentNode->type == NodeType::EQUAL || currentNode->type == NodeType::NOT_EQUAL)
    {
        const auto firstOperand = currentNode->operand1;
        const auto secondOperand = currentNode->operand2;

        const auto firstOperandType = Ast::expressionType(firstOperand);

        if (firstOperandType.is(FundamentalType::Symbol, true))
        {
            Function* function;

            if (currentNode->type == NodeType::EQUAL)
            {
                function = GlobalFunctions::get("strEqual");
            }
            else
            {
                function = m_functions.get("strNotEqual");
            }

            const auto functionCallNode = Node(NodeType::FUNCTION_CALL, function, firstOperand, secondOperand);



            const auto secondOperandArgs = new Node(NodeType::FUNCTION_ARGS, function, firstOperand);
            const auto firstOperandArgs = new Node(NodeType::FUNCTION_ARGS, function, secondOperand, secondOperandArgs);


            currentNode->type = NodeType::FUNCTION_CALL;
            currentNode->value = function;

            currentNode->operand1 = firstOperandArgs;
            currentNode->operand2 = nullptr;
        }
    }
}


