#pragma once

#include <any>
#include "../../lexer/Lexer.h"
#include "../variable/VariableTable.h"

namespace stc
{
using std::any;
using std::any_cast;

enum class NodeType
{
    IDENTIFIER,

    // variables
    VARIABLE_DECLARATION,
    USING_VARIABLE,
    VARIABLE_TYPE,

    // const
    CONSTANT_DECLARATION,
    USING_CONSTANT,
    NUMBER_CONST,
    BOOLEAN_CONST,
    STRING_CONST,

    // math
    ADD,
    SUB,
    MUL,
    DIV,

    BEFORE_INC,
    BEFORE_DEC,

    AFTER_INC,
    AFTER_DEC,

    UNARY_PLUS,
    UNARY_MINUS,
    UNARY_EXCLAMATION,

    // logical
    LOGICAL_AND,
    LOGICAL_OR,

    // setter
    SET,

    // relationship operators
    LESS, // <
    GREATER, // >
    EQUAL, // ==
    NOT_EQUAL, // !=
    LESS_EQUAL, // <=
    GREATER_EQUAL, // >=

    // cycles
    DO_WHILE,
    FOR,
    WHILE,
    // cycles addition
    BREAK,
    CONTINUE,

    // conditions
    IF,
    IF_ELSE,

    // index capture
    INDEX_CAPTURE,

    // function
    FUNCTION_CALL,
    FUNCTION_ARGS,
    FUNCTION_ARG,

    RETURN,

    // function implement
    FUNCTION_IMPLEMENTATION,
    FUNCTION_IMPLEMENTATION_ARG,
    FUNCTION_IMPLEMENTATION_ARGS,
    FUNCTION_IMPLEMENTATION_RETURN_TYPE,
    FUNCTION_IMPLEMENTATION_DEFAULT_ARG_VALUE,

    // expression
    EXPRESSION,
    CONST_EXPRESSION,

    STATEMENT,
    SEQ_STATEMENT,
    STATEMENT_LIST,


    INITIALIZER,
    INITIALIZER_LIST,

    // operator new
    NEW,

    PROGRAM,


    IMPORT,
    EXPORT,

    IMPORT_LIST,
    IMPORT_LIST_ELEMENT,
    IMPORT_FILE,

    EXPORT_LIST,
    EXPORT_LIST_ELEMENT,


    CLASS_IMPLEMENTATION,
    CLASS_IMPLEMENTATION_FIELD,
    CLASS_IMPLEMENTATION_FUNCTION,

    CLASS_THIS,

    CLASS_FIELD_STATIC,

    CLASS_FIELD_VISIBILITY,
    CLASS_ACCESS_TO_FIELD,

    CLASS_ACCESS_TO_STATIC_FIELD,

    INTERFACE_IMPLEMENTATION,
    INTERFACE_FIELD_DEFINITION,
    INTERFACE_FUNCTION_DEFINITION,
};

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


public:
    explicit Node(NodeType type_, const any& value_ = 0, Node* operand1_ = nullptr, Node* operand2_ = nullptr,
                  Node* operand3_ = nullptr, Node* operand4_ = nullptr, VariableTable* vars_ = nullptr);

public:
    void scopeId(size_t id);
    _NODISCARD size_t scopeId() const;

public:
    static string nodeTypeToString(NodeType type);
    static bool isComparisonOperator(NodeType type);
    static bool isLvalueNodeType(NodeType type);
};


}