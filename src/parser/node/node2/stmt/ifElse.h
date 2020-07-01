#pragma once

#include <cfloat>
#include "../Node.h"

namespace stc
{


class IfElse : public n::Node
{
private:
    Node* m_condition;
    Node* m_body;
    Node* m_elseBody;

public:
    IfElse (Node* condition, Node* body, Node* elseBody) : Node(NodeType::IF_ELSE)
    {
        this->m_condition = condition;
        this->m_body = body;
        this->m_elseBody = elseBody;
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

    _NODISCARD Node* elseBody() const
    {
        return m_elseBody;
    }
};

}