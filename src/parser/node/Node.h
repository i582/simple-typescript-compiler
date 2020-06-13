#pragma once

#include <any>
#include "../../lexer/Lexer2.h"
#include "../variable/VariableTable.h"
#include "NodeType.h"

namespace stc
{
using std::any;
using std::any_cast;

class Node
{
public:
    any value;
    NodeType type;

    Node* operand1;
    Node* operand2;
    Node* operand3;
    Node* operand4;

    VariableTable* variables;

private:
    size_t m_scopeId;

    Position m_position;


public:
    explicit Node(NodeType tType, const any& tValue = 0, Node* tOperand1 = nullptr, Node* tOperand2 = nullptr,
                  Node* tOperand3 = nullptr, Node* tOperand4 = nullptr, VariableTable* tVariables = nullptr);

public:
    void scopeId(size_t id);
    _NODISCARD size_t scopeId() const;

    void position(const Position& position);
    _NODISCARD const Position& position() const;


    bool isComparisonOperator() const;


public:
    static string nodeTypeToString(NodeType type);
    static bool isComparisonOperator(NodeType type);
    static bool isLvalueNodeType(NodeType type);

private:
    void positionFromChilds();
};


}