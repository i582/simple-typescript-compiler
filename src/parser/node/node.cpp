#include "node.h"

compiler::node::node(compiler::node_type type_, const any& value_, compiler::node* operand1_,
                     compiler::node* operand2_, compiler::node* operand3_, compiler::node* operand4_)
{
    this->_type = type_;
    this->_value = value_;
    this->_operand1 = operand1_;
    this->_operand2 = operand2_;
    this->_operand3 = operand3_;
    this->_operand4 = operand4_;
}
