#include "Ast.h"
#include "../../ICM/icm.h"


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

    for (const auto& aClass : m_classTable.raw())
    {
        for (const auto& function : aClass->functions().raw())
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
