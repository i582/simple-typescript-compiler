#pragma once

#include <iostream>
#include <chrono>
#include "../node/node.h"


namespace compiler
{

    class ast
    {
    public:
        node* _tree;

    public:
        ast();



    public:
        static void print(node* sub, size_t level);
    };

}