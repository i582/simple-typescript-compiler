#include "Node.h"

stc::Node::Node(stc::NodeType type_, const any& value_, stc::Node* operand1_,
                stc::Node* operand2_, stc::Node* operand3_, stc::Node* operand4_,
                VariableTable* vars_)
{
    this->type = type_;
    this->value = value_;
    this->operand1 = operand1_;
    this->operand2 = operand2_;
    this->operand3 = operand3_;
    this->operand4 = operand4_;
    this->m_scopeId = -1;
    this->variables = vars_;

}

void stc::Node::scopeId(size_t id)
{
    m_scopeId = id;
}

size_t stc::Node::scopeId() const
{
    return m_scopeId;
}

std::string stc::Node::nodeTypeToString(stc::NodeType type)
{
    switch (type)
    {
        case NodeType::VARIABLE_DECLARATION:
        {
            return "var decl";
        }
        case NodeType::USING_VARIABLE:
        {
            return "var use";
        }
        case NodeType::VARIABLE_TYPE:
        {
            return "var type";
        }
        case NodeType::CONSTANT_DECLARATION:
        {
            return "const decl";
        }
        case NodeType::USING_CONSTANT:
        {
            return "const use";
        }
        case NodeType::NUMBER_CONST:
        {
            return "number const";
        }
        case NodeType::BOOLEAN_CONST:
        {
            return "boolean const";
        }
        case NodeType::ADD:
        {
            return "add (+)";
        }
        case NodeType::SUB:
        {
            return "sub (-)";
        }
        case NodeType::MUL:
        {
            return "mul (*)";
        }
        case NodeType::DIV:
        {
            return "div (/)";
        }
        case NodeType::LESS:
        {
            return "less (<)";
        }
        case NodeType::GREATER:
        {
            return "greater (>)";
        }
        case NodeType::EQUAL:
        {
            return "equal (==)";
        }
        case NodeType::NOT_EQUAL:
        {
            return "not equal (!=)";
        }
        case NodeType::LESS_EQUAL:
        {
            return "less equal (<=)";
        }
        case NodeType::GREATER_EQUAL:
        {
            return "greater equal (>)";
        }
        case NodeType::FOR:
        {
            return "for";
        }
        case NodeType::WHILE:
        {
            return "while";
        }
        case NodeType::BREAK:
        {
            return "break";
        }
        case NodeType::CONTINUE:
        {
            return "continue";
        }
        case NodeType::IF:
        {
            return "if";
        }
        case NodeType::IF_ELSE:
        {
            return "if else";
        }
        case NodeType::IDENTIFIER:
        {
            return "non terminal name";
        }
        case NodeType::BEFORE_INC:
        {
            return "postfix inc (a++)";
        }
        case NodeType::BEFORE_DEC:
        {
            return "postfix dec (a--)";
        }
        case NodeType::AFTER_INC:
        {
            return "prefix inc (++a)";
        }
        case NodeType::AFTER_DEC:
        {
            return "prefix dec (--a)";
        }
        case NodeType::UNARY_PLUS:
        {
            return "unary + (+a)";
        }
        case NodeType::UNARY_MINUS:
        {
            return "unary - (-a)";
        }
        case NodeType::UNARY_EXCLAMATION:
        {
            return "unary ! (!a)";
        }
        case NodeType::LOGICAL_AND:
        {
            return "logic and (&&)";
        }
        case NodeType::LOGICAL_OR:
        {
            return "logic or (||)";
        }
        case NodeType::SET:
        {
            return "set";
        }
        case NodeType::INDEX_CAPTURE:
        {
            return "index capture";
        }
        case NodeType::FUNCTION_CALL:
        {
            return "function call";
        }
        case NodeType::FUNCTION_ARG:
        {
            return "function arg";
        }
        case NodeType::EXPRESSION:
        {
            return "expr";
        }
        case NodeType::CONST_EXPRESSION:
        {
            return "const expr";
        }
        case NodeType::STATEMENT:
        {
            return "stmt";
        }
        case NodeType::SEQ_STATEMENT:
        {
            return "stmt seq";
        }
        case NodeType::STATEMENT_LIST:
        {
            return "stmt list";
        }
        case NodeType::PROGRAM:
        {
            return "program";
        }
        case NodeType::DO_WHILE:
        {
            return " do (while)";
        }
        case NodeType::INITIALIZER:
        {
            return "initializer";
        }
        case NodeType::INITIALIZER_LIST:
        {
            return "initializer list";
        }
        case NodeType::NEW:
        {
            return "new";
        }
        case NodeType::FUNCTION_IMPLEMENTATION:
        {
            return "function impl";
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARG:
        {
            return "function impl arg";
        }
        case NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
        {
            return "function impl return type";
        }
        case NodeType::RETURN:
        {
            return "return";
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARGS:
        {
            return "function impl args";
        }
        case NodeType::FUNCTION_ARGS:
        {
            return "function args";
        }
        case NodeType::STRING_CONST:
        {
            return "string const";
        }

        default:
            return "";
    }
}


bool stc::Node::isComparisonOperator(NodeType type)
{
    return type == NodeType::LESS ||
           type == NodeType::GREATER ||
           type == NodeType::LESS_EQUAL ||
           type == NodeType::GREATER_EQUAL ||
           type == NodeType::EQUAL ||
           type == NodeType::NOT_EQUAL ||
           type == NodeType::LOGICAL_AND ||
           type == NodeType::LOGICAL_OR ||
           type == NodeType::UNARY_EXCLAMATION;
}

bool stc::Node::isLvalueNodeType(stc::NodeType type)
{
    return  type == NodeType::USING_VARIABLE ||
            type == NodeType::VARIABLE_DECLARATION ||
            type == NodeType::CONSTANT_DECLARATION ||
            type == NodeType::INDEX_CAPTURE ||
            type == NodeType::CLASS_ACCESS_TO_FIELD ||
            type == NodeType::CLASS_ACCESS_TO_STATIC_FIELD;
}
