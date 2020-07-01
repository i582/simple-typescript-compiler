#pragma once

#include <cfloat>
#include "../Node.h"

namespace stc
{

// interface Node
class If : public n::Node
{
private:
    Node* m_condition;
    Node* m_body;

public:
    If (Node* condition, Node* body) : Node(NodeType::IF)
    {
        this->m_condition = condition;
        this->m_body = body;
    }

public:
    _NODISCARD Node* condition() const
    {
        return m_condition;
    }

    _NODISCARD Node* body() const
    {
        return m_body;
    }
};

}