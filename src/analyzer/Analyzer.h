#pragma once
#include "../parser/ast/Ast.h"
#include "baseBlock.h"


namespace stc
{

class Analyzer
{
private:
    Ast* m_ast;

    vector<BaseBlock*> m_baseBlocks;

public:
    explicit Analyzer(Ast* ast)
    {
        this->m_ast = ast;
    }

public:
    void identifyBaseBlocks()
    {
        identifyBaseBlocksRecursive(m_ast->m_root);


        for (const auto& baseBlock : m_baseBlocks)
        {
            baseBlock->print();
            cout << "\n\n";
        }
    }

    Node* identifyBaseBlocksRecursive(Node* currentNode)
    {
        if (currentNode == nullptr)
            return nullptr;


        if (currentNode->type == NodeType::STATEMENT_LIST)
        {
            if (currentNode->operand2->type == NodeType::IF_ELSE)
            {
                auto firstBaseBlock = new BaseBlock(currentNode->operand1);
                auto secondBaseBlock = new BaseBlock(currentNode->operand2);

                m_baseBlocks.push_back(firstBaseBlock);
                m_baseBlocks.push_back(secondBaseBlock);

                auto firstBranchNode = identifyBaseBlocksRecursive(currentNode->operand1);
                auto secondBranchNode = identifyBaseBlocksRecursive(currentNode->operand2);

            }
            else
            {
                auto baseBlock = new BaseBlock(currentNode);
                m_baseBlocks.push_back(baseBlock);

                auto firstBranchNode = identifyBaseBlocksRecursive(currentNode->operand1);
                auto secondBranchNode = identifyBaseBlocksRecursive(currentNode->operand2);
            }

            return currentNode;
        }
        else
        {
            return identifyBaseBlocksRecursive(currentNode->operand1);
        }

    }




public:
    _NODISCARD Ast* ast() const
    {
        return m_ast;
    }
};


}