#include "node.h"

compiler::node::node(compiler::node_type type_, const any& value_, compiler::node* operand1_,
                     compiler::node* operand2_, compiler::node* operand3_, compiler::node* operand4_,
                     variable_table* vars_)
{
    this->_type = type_;
    this->_value = value_;
    this->_operand1 = operand1_;
    this->_operand2 = operand2_;
    this->_operand3 = operand3_;
    this->_operand4 = operand4_;
    this->_statement_id = -1;
    this->_vars = vars_;
}

void compiler::node::statement_id(size_t statement_id)
{
    _statement_id = statement_id;
}

size_t compiler::node::statement_id() const
{
    return _statement_id;
}
