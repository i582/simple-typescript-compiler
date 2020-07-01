#pragma once


#include "NodeType.h"



namespace stc::n
{

// interface Node
class Node
{
private:
    NodeType m_type;

public:
    explicit Node(NodeType type)
    {
        this->m_type = type;
    }


public:
    template<typename T>
    T t() const
    {
        return dynamic_cast<T>(this);
    }

};

}