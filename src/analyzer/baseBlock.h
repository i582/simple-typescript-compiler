#pragma once
#include "../parser/ast/Ast.h"

namespace stc
{

class BaseBlock
{
private:
    Node* m_startNode;

    vector<BaseBlock*> m_connectedBaseBlocks;

public:
    explicit BaseBlock(Node* startNode)
    {
        this->m_startNode = startNode;
    }

public:
    void print() const
    {
        Ast::print(m_startNode, 0);
    }


};

}