#pragma once

#include <iostream>
#include <chrono>
#include "../node/node.h"


namespace compiler
{

    class ast
    {
    private:
        vector<std::pair<node*, node*>> _stmts;

    private: // count blocks
        size_t _count_blocks;


    public:
        node* _tree;

    public:
        ast();


    public:
        void mark_block();
        void mark_break_continue_operators();
        void mark_return_operator();


        void designate_blocks();


    private:
        void mark_block_recursive(node* current_node);
        void mark_break_continue_operators_recursive(node* current_node, size_t current_block);
        void mark_return_operator_recursive(node* current_node, size_t current_block);
        void designate_blocks_recursive(node* current_node, node* current_stmt);

    public:
        static void print(node* sub, size_t level);
    };

}