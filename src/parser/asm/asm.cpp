#include "asm.h"

stc::Asm::Asm(const std::string& file_name, stc::Ast* tree)
{
    m_file.open(file_name);
    m_ast = tree;
    m_current_place_for_writing = &m_main;

    m_byte_on_stack = 4;
}

stc::Asm::~Asm()
{
    m_file.close();
}

void stc::Asm::generate()
{
    init_string_constants();
    init_operands_for_division();
    init_local_variables();
    init_global_variables();
    init_function_arguments();
    init_global_functions();
    blocks_to_asm();

    write(asm_header);

    write(start_data);
    write(m_data);
    write(end_data);


    write(text_start);
    write(m_before_main);
    write(m_function_implementations);


    write(label_start);
    write(proc_prolog + "0, 0");


    write(m_main);
    write(proc_epilogue);
    write(function_return);

    write(text_end);
    write(label_end);
}

void stc::Asm::init_local_variables()
{
    for (const auto& function : m_ast->m_functions.functions())
    {
        for (const auto& local_variable : function->local_variables())
        {
            if (Variable::is_array_type(local_variable->type()))
                continue;

            stack_variable(local_variable);
        }

        m_byte_on_stack = 4;
    }

}

void stc::Asm::init_global_variables()
{

    set_place_for_writing(asm_place_for_writing::DATA);
    raw("\n; Global variable START\n");
    for (const auto& variable : m_ast->m_global_variables)
    {
        global_variable(variable);
    }

    for (const auto& array : m_ast->m_arrays)
    {
        global_array(array);
    }
    raw("; Global variable END\n\n");
    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::init_function_arguments()
{
    for (const auto& function : m_ast->m_functions.functions())
    {
        m_byte_on_stack = 8;

        for (const auto& argument_variable : function->argument_variables())
        {
            stack_argument(argument_variable);
        }
    }
}

void stc::Asm::blocks_to_asm()
{
    blocks_recursive(m_ast->m_root);
}

void stc::Asm::blocks_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::SET)
    {
        Node* op1 = current_node->operand1;
        Node* op2 = current_node->operand2;

        if (op1->type == NodeType::USING_VARIABLE ||
            op1->type == NodeType::VARIABLE_DECLARATION ||
            op1->type == NodeType::CONSTANT_DECLARATION)
        {
            auto variable_name = any_cast<string>(op1->value);
            auto block_id = op1->statement_id();
            auto variable = m_ast->m_all_variables.get_variable(variable_name, block_id);
            auto is_array = variable->is_array();

            variable_name += std::to_string(block_id);


            if (is_array)
                return;

            expression_recursive(op2);

            // pop eax
            pop(eax);

            if (variable->is_global_variable())
            {
                // mov variable, eax
                mov(global_var(variable_name), eax);
            }
            else if (variable->is_argument_variable())
            {
                // mov arg_variable, eax
                mov(argument_var(variable_name), eax);
            }
            else
            {
                // mov variable[ebp], eax
                mov(local_var(variable_name), eax);
            }
        }
        else if (op1->type == NodeType::INDEX_CAPTURE)
        {
            auto variable_node = op1->operand1;
            auto index_node = op1->operand2;

            auto array_name = any_cast<string>(variable_node->value);
            auto block_id = variable_node->statement_id();

            auto variable = m_ast->m_all_variables.get_variable(array_name, block_id);


            auto array_type = m_ast->m_all_variables.get_variable(array_name, block_id)->type();
            string array_item_shift;

            array_name += to_string(block_id);

            switch (array_type)
            {
                case VariableType::NUMBER_ARRAY:
                {
                    array_item_shift = "4";
                    break;
                }
                case VariableType::BOOLEAN_ARRAY:
                {
                    array_item_shift = "1";
                    break;
                }
                case VariableType::STRING_ARRAY:
                {
                    array_item_shift = "4";
                    break;
                }

                case VariableType::UNDEFINED:
                case VariableType::NUMBER:
                case VariableType::BOOLEAN:
                case VariableType::STRING:
                case VariableType::VOID:
                case VariableType::ANY:
                case VariableType::VOID_ARRAY:
                    break;
            }

            expression_recursive(op2);
            pop(edx);

            expression_recursive(index_node->operand1);
            pop(ecx);
            imul(ecx, array_item_shift);


            if (variable->is_argument_variable())
            {
                mov(esi, argument_var(array_name));
            }
            else
            {
                mov(esi, global_var(array_name));
            }



            add(esi, ecx);

            mov("[esi]", edx);
        }

        return;
    }
    else if (Node::is_comparison_operator(current_node->type))
    {
        relation_expression_recursive(current_node);
        return;
    }
    else if (current_node->type == NodeType::IF
             || current_node->type == NodeType::IF_ELSE)
    {
        Node* condition         = current_node->operand1->operand1;
        Node* statement         = current_node->operand2;
        Node* else_statement    = current_node->operand3;

        string start_label_     = "_if_start_" + to_string(statement->statement_id());
        string end_label_       = "_if_end_" + to_string(statement->statement_id());
        string else_label_      = "_if_else_" + to_string(statement->statement_id());


        blocks_recursive(condition);
        pop(eax);
        cmp(eax, null);

        string end_or_else_label = end_label_;
        if (current_node->type == NodeType::IF_ELSE)
        {
            end_or_else_label = else_label_;
        }


        je(end_or_else_label);



        if (current_node->type == NodeType::IF_ELSE)
        {
            // label:
            label(start_label_);
            blocks_recursive(statement);

            // jmp label
            jmp(end_label_);

            // label:
            label(else_label_);
            blocks_recursive(else_statement);

            // label:
            label(end_label_);

        }
        else if (current_node->type == NodeType::IF)
        {
            // label:
            label(start_label_);
            blocks_recursive(statement);

            // label:
            label(end_label_);
        }

        return;
    }
    else if (current_node->type == NodeType::WHILE)
    {
        Node* condition = current_node->operand1->operand1;
        Node* statement = current_node->operand2;

        string start_label_     = "_loop_start_" + std::to_string(statement->statement_id());
        string end_label_       = "_loop_end_" + std::to_string(statement->statement_id());
        string aftereffects_label_       = "_loop_aftereffects_" + std::to_string(statement->statement_id());


        label(start_label_);
        label(aftereffects_label_);


        blocks_recursive(condition);

        pop(eax);
        cmp(eax, null);

        je(end_label_);

        // label:
        blocks_recursive(statement);
        jmp(start_label_);

        // label:
        label(end_label_);

        return;
    }
    else if (current_node->type == NodeType::DO_WHILE)
    {
        Node* condition = current_node->operand1->operand1;
        Node* statement = current_node->operand2;

        string start_label_     = "_loop_start_" + std::to_string(statement->statement_id());
        string end_label_       = "_loop_end_" + std::to_string(statement->statement_id());
        string aftereffects_label_       = "_loop_aftereffects_" + std::to_string(statement->statement_id());


        label(start_label_);
        label(aftereffects_label_);


        // label:
        blocks_recursive(statement);

        blocks_recursive(condition);

        pop(eax);
        cmp(eax, null);

        je(end_label_);

        jmp(start_label_);

        // label:
        label(end_label_);

        return;
    }
    else if (current_node->type == NodeType::FOR)
    {
        Node* prevention = current_node->operand1->operand1;
        Node* condition = current_node->operand2->operand1;
        Node* aftereffects = current_node->operand3->operand1;
        Node* statement = current_node->operand4;

        string start_label_     = "_loop_start_" + std::to_string(statement->statement_id());
        string end_label_       = "_loop_end_" + std::to_string(statement->statement_id());
        string aftereffects_label_       = "_loop_aftereffects_" + std::to_string(statement->statement_id());


        blocks_recursive(prevention);
        label(start_label_);

        blocks_recursive(condition);

        pop(eax);
        cmp(eax, null);

        je(end_label_);


        // label:
        blocks_recursive(statement);
        label(aftereffects_label_);
        blocks_recursive(aftereffects);
        jmp(start_label_);

        // label:
        label(end_label_);
        return;
    }
    else if (current_node->type == NodeType::BREAK)
    {
        auto block_id = current_node->statement_id() + 2;
        string label_value = "_loop_end_" + to_string(block_id);

        jmp(label_value);
        return;
    }
    else if (current_node->type == NodeType::CONTINUE)
    {
        auto block_id = current_node->statement_id() + 2;
        string label_value = "_loop_aftereffects_" + std::to_string(block_id);

        jmp(label_value);
        return;
    }

    else if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

        function_implementation_recursive(current_node);

        set_place_for_writing(asm_place_for_writing::MAIN);

        return;
    }
    else if (current_node->type == NodeType::RETURN)
    {
        if (current_node->operand1->operand1 != nullptr)
        {
            expression_recursive(current_node->operand1);
            pop(eax);
        }

        auto arguments_size = any_cast<size_t>(current_node->value);

        procedure_epilogue();
        ret(to_string(arguments_size));
        return;
    }
    else if (current_node->type == NodeType::FUNCTION_CALL)
    {
        expression_recursive(current_node);
        return;
    }
    else if (current_node->type == NodeType::BEFORE_INC ||
             current_node->type == NodeType::BEFORE_DEC)
    {
        expression_recursive(current_node);
        return;
    }
    else if (current_node->type == NodeType::NUMBER_CONST ||
             current_node->type == NodeType::BOOLEAN_CONST ||
             current_node->type == NodeType::USING_VARIABLE ||
             current_node->type == NodeType::USING_CONSTANT ||
             current_node->type == NodeType::INDEX_CAPTURE ||
             current_node->type == NodeType::UNARY_EXCLAMATION ||
             current_node->type == NodeType::UNARY_MINUS)
    {
        expression_recursive(current_node);
        return;
    }
    else if (current_node->type == NodeType::EXPRESSION)
    {
        blocks_recursive(current_node->operand1);
        return;
    }


    blocks_recursive(current_node->operand1);
    blocks_recursive(current_node->operand2);
    blocks_recursive(current_node->operand3);
    blocks_recursive(current_node->operand4);
}

void stc::Asm::expression_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == NodeType::ADD)
    {
        expression_recursive(current_node->operand1);
        expression_recursive(current_node->operand2);

        // pop eax
        pop(eax);
        // pop ebx
        pop(ebx);
        // add eax, ebx
        add(eax, ebx);
        // push eax
        push(eax);
    }
    else if (current_node->type == NodeType::SUB)
    {
        expression_recursive(current_node->operand1);
        expression_recursive(current_node->operand2);

        // pop ebx
        pop(ebx);
        // pop eax
        pop(eax);
        // sub eax, ebx
        sub(eax, ebx);
        // push eax
        push(eax);
    }
    else if (current_node->type == NodeType::MUL)
    {
        expression_recursive(current_node->operand1);
        expression_recursive(current_node->operand2);

        // pop eax
        pop(eax);
        // pop ebx
        pop(ebx);
        // imul eax, ebx
        imul(eax, ebx);
        // push eax
        push(eax);
    }
    else if (current_node->type == NodeType::DIV)
    {
        expression_recursive(current_node->operand1);
        expression_recursive(current_node->operand2);

        // pop ebx
        pop(ebx);
        // pop eax
        pop(eax);

        mov("div_operand_1", eax);
        mov("div_operand_2", ebx);

        finit();
        fild("div_operand_2");
        fild("div_operand_1");
        fdiv("st(0)", "st(1)");
        fist("div_operand_1");
        push("div_operand_1");
    }
    else if (current_node->type == NodeType::UNARY_MINUS)
    {
        expression_recursive(current_node->operand1);

        // pop eax
        pop(eax);
        // imul div, -1
        imul(eax, minus_one);
        // push eax
        push(eax);
    }
    else if (current_node->type == NodeType::UNARY_EXCLAMATION)
    {
        expression_recursive(current_node->operand1);

        // pop eax
        pop(eax);
        logical_xor(eax, minus_one);
        logical_and(eax, one);
        push(eax);
    }
    else if (current_node->type == NodeType::AFTER_INC ||
             current_node->type == NodeType::AFTER_DEC)
    {
        cout << "Current not supported a++ or a--!" << endl;
    }
    else if (current_node->type == NodeType::BEFORE_INC)
    {
        string variable_name;
        size_t block_id = 0;

        auto value_node = current_node->operand1;

        if (value_node->type == NodeType::USING_VARIABLE ||
            value_node->type == NodeType::USING_CONSTANT)
        {
            variable_name = any_cast<string>(value_node->value);
            block_id = value_node->statement_id();
            auto variable = m_ast->m_all_variables.get_variable(variable_name, block_id);


            variable_name += to_string(block_id);

            push(variable_name);

            // pop eax
            pop(eax);
            add(eax, one);



            if (variable->is_argument_variable())
            {
                // mov arg_variable, eax
                mov(argument_var(variable_name), eax);
                push(argument_var(variable_name));
            }
            else if (variable->is_global_variable() || Variable::is_array_type(variable->type()))
            {
                // mov variable, eax
                mov(global_var(variable_name), eax);
                push(variable_name);
            }
            else
            {
                // mov variable[ebp], eax
                mov(local_var(variable_name), eax);
                push(local_var(variable_name));
            }

        }
        else if (value_node->type == NodeType::INDEX_CAPTURE)
        {
            variable_name = any_cast<string>(value_node->operand1->value);
            block_id = value_node->operand1->statement_id();



            auto number_node = Node(NodeType::NUMBER_CONST, (number)1);
            auto sub_node = Node(NodeType::ADD, "", value_node, &number_node);

            auto set_node = Node(NodeType::SET, "", value_node, &sub_node);

            blocks_recursive(&set_node);
        }

    }
    else if (current_node->type == NodeType::BEFORE_DEC)
    {
        string variable_name;
        size_t block_id = 0;

        auto value_node = current_node->operand1;

        if (value_node->type == NodeType::USING_VARIABLE ||
            value_node->type == NodeType::USING_CONSTANT)
        {
            variable_name = any_cast<string>(value_node->value);
            block_id = value_node->statement_id();
            auto variable = m_ast->m_all_variables.get_variable(variable_name, block_id);

            variable_name += to_string(block_id);

            push(variable_name);

            // pop eax
            pop(eax);
            sub(eax, one);


            if (variable->is_argument_variable())
            {
                // mov arg_variable, eax
                mov(argument_var(variable_name), eax);
                push(argument_var(variable_name));
            }
            else if (variable->is_global_variable() || Variable::is_array_type(variable->type()))
            {
                // mov variable, eax
                mov(global_var(variable_name), eax);
                push(variable_name);
            }
            else
            {
                // mov variable[ebp], eax
                mov(local_var(variable_name), eax);
                push(local_var(variable_name));
            }

        }
        else if (value_node->type == NodeType::INDEX_CAPTURE)
        {
            variable_name = any_cast<string>(value_node->operand1->value);
            block_id = value_node->operand1->statement_id();



            auto number_node = Node(NodeType::NUMBER_CONST, (number)1);
            auto sub_node = Node(NodeType::SUB, "", value_node, &number_node);

            auto set_node = Node(NodeType::SET, "", value_node, &sub_node);

            blocks_recursive(&set_node);
        }

    }
    else if (current_node->type == NodeType::NUMBER_CONST)
    {
        // push const
        auto number_value = to_string((int)any_cast<number>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == NodeType::BOOLEAN_CONST)
    {
        // push const
        auto number_value = to_string((size_t)any_cast<int>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == NodeType::STRING_CONST)
    {
        // push const
        auto value_id = current_node->statement_id();
        auto string_access = "string_const_" + to_string(value_id);
        push(offset(string_access));
    }
    else if (current_node->type == NodeType::USING_VARIABLE ||
             current_node->type == NodeType::USING_CONSTANT)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        auto variable = m_ast->m_all_variables.get_variable(variable_name, block_id);

        variable_name += to_string(block_id);




        if (variable->is_argument_variable())
        {
            push(argument_var(variable_name));
        }
        else if (variable->is_global_variable() || Variable::is_array_type(variable->type()))
        {
            push(variable_name);
        }
        else
        {
            push(local_var(variable_name));
        }

    }
    else if (Node::is_comparison_operator(current_node->type))
    {
        relation_expression_recursive(current_node);
    }
    else if (current_node->type == NodeType::FUNCTION_CALL)
    {
        auto function_name = any_cast<string>(current_node->value);

        raw("\n");
        comment("init stack for " + function_name);

        init_arguments_on_stack_recursive(current_node->operand1);


        auto function = m_ast->m_functions.get_function(function_name);
        auto function_return_void = function->return_type() == VariableType::VOID;


        comment("call " + function_name);
        call(function_name);
        raw("\n");

        if (!function_return_void)
        {
            push(eax);
        }

        return;
    }
    else if (current_node->type == NodeType::INDEX_CAPTURE)
    {
        auto op1 = current_node->operand1;
        auto op2 = current_node->operand2;

        auto array_name = any_cast<string>(op1->value);
        auto block_id = op1->statement_id();

        auto array_type = m_ast->m_all_variables.get_variable(array_name, block_id)->type();
        string array_item_shift;

        auto variable = m_ast->m_all_variables.get_variable(array_name, block_id);


        array_name += to_string(block_id);

        switch (array_type)
        {
            case VariableType::NUMBER_ARRAY:
            {
                array_item_shift = "4";
                break;
            }
            case VariableType::BOOLEAN_ARRAY:
            {
                array_item_shift = "1";
                break;
            }
            case VariableType::STRING_ARRAY:
            {
                array_item_shift = "4";
                break;
            }

            case VariableType::UNDEFINED:
            case VariableType::NUMBER:
            case VariableType::BOOLEAN:
            case VariableType::STRING:
            case VariableType::VOID:
            case VariableType::ANY:
            case VariableType::VOID_ARRAY:
                break;
        }

        expression_recursive(op2->operand1);
        pop(edx);
        imul(edx, array_item_shift);



        if (variable->is_argument_variable())
        {
            mov(esi, argument_var(array_name));
        }
        else if (variable->is_global_variable() || Variable::is_array_type(variable->type()))
        {
            mov(esi, global_var(array_name));
        }
        else
        {
            mov(esi, local_var(array_name));
        }

        push("[esi[edx]]");
    }
    else if (current_node->type == NodeType::EXPRESSION)
    {
        expression_recursive(current_node->operand1);
    }
}

void stc::Asm::relation_expression_recursive(Node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::NUMBER_CONST)
    {
        auto value = any_cast<number>(current_node->value);

        if (value == 0)
        {
            push(null);
        }
        else
        {
            push(one);
        }
    }
    else if (current_node->type == NodeType::BOOLEAN_CONST)
    {
        auto value = any_cast<int>(current_node->value);

        if (value == 0)
        {
            push(null);
        }
        else
        {
            push(one);
        }
    }
    else if (current_node->type == NodeType::USING_VARIABLE ||
             current_node->type == NodeType::USING_CONSTANT)
    {
        auto current_time = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now().time_since_epoch());

        string label_if_equal = "_compare_equal" + std::to_string(current_time.count());
        string label_if_not_equal = "_compare_not_equal" + std::to_string(current_time.count());
        string label_compare_end = "_compare_end" + std::to_string(current_time.count());

        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        auto variable = m_ast->m_all_variables.get_variable(variable_name, block_id);

        variable_name += to_string(block_id);




        if (variable->is_argument_variable())
        {
            cmp(argument_var(variable_name), null);
        }
        else if (variable->is_global_variable() || Variable::is_array_type(variable->type()))
        {
            cmp(global_var(variable_name), null);
        }
        else
        {
            cmp(local_var(variable_name), null);
        }


        // jne (!=) label
        jne(label_if_not_equal);
        push(null);
        jmp(label_compare_end);

        label(label_if_not_equal);
        push(one);

        label(label_compare_end);

    }
    else if (current_node->type == NodeType::LOGICAL_AND)
    {
        Node* op1 = current_node->operand1;
        Node* op2 = current_node->operand2;

        relation_expression_recursive(op1);
        pop(eax);
        relation_expression_recursive(op2);
        pop(ebx);

        logical_and(eax, ebx);
        push(eax);
    }
    else if (current_node->type == NodeType::LOGICAL_OR)
    {
        Node* op1 = current_node->operand1;
        Node* op2 = current_node->operand2;

        relation_expression_recursive(op1);
        pop(eax);
        relation_expression_recursive(op2);
        pop(ebx);

        logical_or(eax, ebx);
        push(eax);
    }
    else if (current_node->type == NodeType::UNARY_EXCLAMATION)
    {
        relation_expression_recursive(current_node->operand1->operand1);


        // pop eax
        pop(eax);
        logical_xor(eax, minus_one);
        logical_and(eax, one);
        push(eax);
    }
    else if (current_node->type == NodeType::EXPRESSION)
    {
        relation_expression_recursive(current_node->operand1);
        return;
    }
    else
    {
        auto current_time = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now().time_since_epoch());

        Node* op1 = current_node->operand1;
        Node* op2 = current_node->operand2;

        expression_recursive(op1);
        pop(ecx);
        expression_recursive(op2);
        pop(edx);

        // cmp ecx, edx
        cmp(ecx, edx);

        string label_if_equal = "_compare_equal" + std::to_string(current_time.count());
        string label_if_not_equal = "_compare_not_equal" + std::to_string(current_time.count());
        string label_compare_end = "_compare_end" + std::to_string(current_time.count());



        if (current_node->type == NodeType::LESS)
        {
            // jge (>=) label
            jge(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == NodeType::LESS_EQUAL)
        {
            // jg (>) label
            jg(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == NodeType::GREATER)
        {
            // jle (<=) label
            jle(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == NodeType::GREATER_EQUAL)
        {
            // jl (<) label
            jl(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == NodeType::EQUAL)
        {
            // jne (!=) label
            jne(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == NodeType::NOT_EQUAL)
        {
            // je (==) label
            je(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }

        return;
    }
}

void stc::Asm::function_implementation_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;


    // if function body is empty
    if (current_node->operand3->type == NodeType::EXPRESSION)
        return;

    auto function_name = any_cast<string>(current_node->value);

    if (m_ast->m_global_functions.has_function(function_name))
        return;

    auto function = m_ast->m_functions.get_function(function_name);
    auto local_variable_size = function->local_variable_size();

    proc(function_name);
    procedure_prolog(0, local_variable_size);



    auto stack_size = function->arguments_size();

    size_t stack_shift = 8;
    function_implementation_args_recursive(current_node->operand2, stack_shift);

    blocks_recursive(current_node->operand3);

    procedure_epilogue();
    ret(to_string(stack_size));
    endp(function_name);

}

void stc::Asm::function_implementation_args_recursive(stc::Node* current_node, size_t& stack_shift)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();

        variable_name += std::to_string(block_id);

        auto variable_type = Variable::variable_type_from_token_type(any_cast<TokenType>(current_node->operand1->value));

        switch (variable_type)
        {
            case VariableType::NUMBER:
            case VariableType::BOOLEAN:
            case VariableType::STRING:
            case VariableType::NUMBER_ARRAY:
            case VariableType::BOOLEAN_ARRAY:
            case VariableType::STRING_ARRAY:
            {


//                mov(edx, "[ebp + " + to_string(stack_shift) + "]");
//                mov(local_var(variable_name), edx);
//
//                stack_shift += 4;
                break;
            }
            case VariableType::UNDEFINED:
            case VariableType::VOID:
            case VariableType::ANY:
            case VariableType::VOID_ARRAY:
                break;
        }

        switch (variable_type)
        {
            case VariableType::NUMBER_ARRAY:
            case VariableType::BOOLEAN_ARRAY:
            case VariableType::STRING_ARRAY:
            {

                break;
            }
            case VariableType::NUMBER:
            case VariableType::BOOLEAN:
            case VariableType::STRING:
            case VariableType::UNDEFINED:
            case VariableType::VOID:
            case VariableType::ANY:
            case VariableType::VOID_ARRAY:
                break;
        }

        return;
    }

    function_implementation_args_recursive(current_node->operand1, stack_shift);
    function_implementation_args_recursive(current_node->operand2, stack_shift);
    function_implementation_args_recursive(current_node->operand3, stack_shift);
    function_implementation_args_recursive(current_node->operand4, stack_shift);
}

void stc::Asm::init_arguments_on_stack_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::FUNCTION_ARGS)
    {
        expression_recursive(current_node->operand1);
    }
    else if (current_node->type == NodeType::FUNCTION_CALL)
    {
        return;
    }

    init_arguments_on_stack_recursive(current_node->operand1);
    init_arguments_on_stack_recursive(current_node->operand2);
    init_arguments_on_stack_recursive(current_node->operand3);
    init_arguments_on_stack_recursive(current_node->operand4);
}

void stc::Asm::init_global_functions()
{
    init_global_functions_recursive(m_ast->m_root);
}

void stc::Asm::init_global_functions_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        auto function_name = any_cast<string>(current_node->value);

        if (function_name == "input")
        {
            init_input_function();
        }
        else if (function_name == "print")
        {
            init_print_function();
        }
        else if (function_name == "println")
        {
            init_println_function();
        }
        else if (function_name == "sqrt")
        {
            init_sqrt_function();
        }
    }

    init_global_functions_recursive(current_node->operand1);
    init_global_functions_recursive(current_node->operand2);
    init_global_functions_recursive(current_node->operand3);
    init_global_functions_recursive(current_node->operand4);
}


void stc::Asm::init_input_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "input_format db \"%d\", 0\n");
    raw(tab + "input_result dd 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("input");
    procedure_prolog(0, 0);

    raw(tab + "invoke crt_scanf, offset input_format, offset input_result\n");
    mov(eax, "input_result");

    procedure_epilogue();
    ret();
    endp("input");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::init_print_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "print_format db \"%d \", 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("print");
    procedure_prolog(0, 0);

    mov(eax, "[ebp + 8]");
    raw(tab + "invoke crt_printf, offset print_format, eax\n");

    procedure_epilogue();
    ret("4");
    endp("print");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::init_println_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "println_format db \"%s\", 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("println");
    procedure_prolog(0, 0);

    mov(eax, "[ebp + 8]");
    raw(tab + "invoke crt_printf, offset println_format, eax\n");

    procedure_epilogue();
    ret("4");
    endp("println");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::init_sqrt_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "sqrt_result dd 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("sqrt");
    procedure_prolog(0, 0);

    mov(eax, "[ebp + 8]");
    mov("sqrt_result", eax);
    finit();
    fild("sqrt_result");
    fsqrt();
    fist("sqrt_result");
    mov(eax, "sqrt_result");

    procedure_epilogue();
    ret("4");
    endp("sqrt");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::init_operands_for_division()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "div_operand_1 dd 0\n");
    raw(tab + "div_operand_2 dd 0\n");
    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::set_place_for_writing(stc::asm_place_for_writing place)
{
    switch (place)
    {
        case asm_place_for_writing::DATA:
        {
            m_current_place_for_writing = &m_data;
            break;
        }
        case asm_place_for_writing::BEFORE_MAIN:
        {
            m_current_place_for_writing = &m_before_main;
            break;
        }
        case asm_place_for_writing::FUNCTION_IMLEMENTATIONS:
        {
            m_current_place_for_writing = &m_function_implementations;
            break;
        }
        case asm_place_for_writing::MAIN:
        {
            m_current_place_for_writing = &m_main;
            break;
        }
    }
}

void stc::Asm::push(const string& value)
{
    m_current_place_for_writing->append(tab + "push " + value + "\n");
}

void stc::Asm::pop(const std::string& value)
{
    m_current_place_for_writing->append(tab + "pop " + value + "\n");
}

void stc::Asm::add(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "add " + value1 + ", " + value2 + "\n");
}

void stc::Asm::sub(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "sub " + value1 + ", " + value2 + "\n");
}

void stc::Asm::imul(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "imul " + value1 + ", " + value2 + "\n");
}

void stc::Asm::mov(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "mov " + value1 + ", " + value2 + "\n");
}

stc::string stc::Asm::offset(const std::string& value)
{
    return "offset " + value;
}

std::string stc::Asm::stack_var(const std::string& value)
{
    return "DWORD PTR " + value + "[ebp]";
}

std::string stc::Asm::local_var(const std::string& value)
{
    return value + "[ebp]";
}

std::string stc::Asm::global_var(const std::string& value)
{
    return value;
}

std::string stc::Asm::argument_var(const std::string& value)
{
    return "arg_" + value + "[ebp]";
}

void stc::Asm::raw(const string& value)
{
    m_current_place_for_writing->append(value);
}

void stc::Asm::stack_variable(const Variable* var)
{
    auto variable_name = var->name_with_postfix();
    auto variable_size = Variable::byte_on_type(var->type());



    m_before_main.append(variable_name + " = " + "-" + to_string(m_byte_on_stack) + " ; size = " + to_string(variable_size) + "\n");

    m_byte_on_stack += variable_size;
}

void stc::Asm::stack_argument(const stc::Variable* var)
{
    auto variable_name = var->name_with_postfix();
    auto variable_size = Variable::byte_on_type(var->type());

    string prefix;

    if (var->is_argument_variable())
    {
        prefix = "arg_";
    }

    m_before_main.append(prefix + variable_name + " = " + to_string(m_byte_on_stack) + " ; size = " + to_string(variable_size) + "\n");

    m_byte_on_stack += variable_size;
}

void stc::Asm::global_variable(const stc::Variable* var)
{
    string variable_type;
    string variable_value;

    switch (var->type())
    {
        case VariableType::NUMBER:
        {
            variable_type = "dd";
            variable_value = "0";
            break;
        }
        case VariableType::BOOLEAN:
        {
            variable_type = "dd";
            variable_value = "0";
            break;
        }
        case VariableType::STRING:
        {
            variable_type = "db";
            variable_value = "\" \",0";
            break;
        }

        case VariableType::UNDEFINED:
        case VariableType::VOID:
        case VariableType::ANY:
        case VariableType::NUMBER_ARRAY:
        case VariableType::BOOLEAN_ARRAY:
        case VariableType::STRING_ARRAY:
        case VariableType::VOID_ARRAY:
            return;
    }

    m_data.append(tab + var->name_with_postfix() + " " +
                  variable_type + " " + variable_value + "\n");
}

void stc::Asm::global_array(const stc::Array& arr)
{
    auto variable = arr.variable();
    auto array_type = variable->type();
    auto array_size = arr.size();
    const auto& array_values = arr.values();

    auto array_name = variable->name_with_postfix();

    string array_type_str;
    string array_values_str;

    switch (array_type)
    {
        case VariableType::NUMBER_ARRAY:
        {
            array_type_str = "dd";

            if (array_values.empty())
            {
                array_values_str = to_string(array_size) + " dup (0)";
            }
            else
            {
                array_values_str = arr.values_to_string();
            }
            break;
        }
        case VariableType::BOOLEAN_ARRAY:
        {
            array_type_str = "dd";

            if (array_values.empty())
            {
                array_values_str = to_string(array_size) + " dup (0)";
            }
            else
            {
                array_values_str = arr.values_to_string();
            }
            break;
        }
        case VariableType::STRING_ARRAY:
        {
            array_type_str = "db";

            if (array_values.empty())
            {
                array_values_str = to_string(array_size) + " dup (0)";
            }
            else
            {
                array_values_str = arr.values_to_string();
            }
            break;
        }

        case VariableType::NUMBER:
        case VariableType::BOOLEAN:
        case VariableType::STRING:
        case VariableType::VOID_ARRAY:
        case VariableType::UNDEFINED:
        case VariableType::VOID:
        case VariableType::ANY:
            return;
    }


    m_data.append(tab + array_name + "_arr" + " " + array_type_str + " " + array_values_str + "\n");
    m_data.append(tab + array_name + " " + array_type_str + " offset " + array_name + "_arr" + "\n");

}

void stc::Asm::logical_or(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "or " + value1 + ", " + value2 + "\n");
}

void stc::Asm::logical_and(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "and " + value1 + ", " + value2 + "\n");
}

void stc::Asm::logical_xor(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "xor " + value1 + ", " + value2 + "\n");
}

void stc::Asm::cmp(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "cmp " + value1 + ", " + value2 + "\n");
}

void stc::Asm::jmp(const std::string& value)
{
    m_current_place_for_writing->append(tab + "jmp " + value + "\n");
}

void stc::Asm::je(const std::string& value)
{
    m_current_place_for_writing->append(tab + "je " + value + "\n");
}

void stc::Asm::jne(const std::string& value)
{
    m_current_place_for_writing->append(tab + "jne " + value + "\n");
}

void stc::Asm::jl(const std::string& value)
{
    m_current_place_for_writing->append(tab + "jl " + value + "\n");
}

void stc::Asm::jle(const std::string& value)
{
    m_current_place_for_writing->append(tab + "jle " + value + "\n");
}

void stc::Asm::jg(const std::string& value)
{
    m_current_place_for_writing->append(tab + "jg " + value + "\n");
}

void stc::Asm::jge(const std::string& value)
{
    m_current_place_for_writing->append(tab + "jge " + value + "\n");
}

void stc::Asm::label(const std::string& value)
{
    m_current_place_for_writing->append(value + ":\n");
}

void stc::Asm::call(const std::string& value)
{
    m_current_place_for_writing->append(tab + "call " + value + "\n");
}

void stc::Asm::ret(const std::string& value)
{
    m_current_place_for_writing->append(tab + "ret " + value + "\n");
}

void stc::Asm::proc(const std::string& value)
{
    m_current_place_for_writing->append(value + " PROC\n");
}

void stc::Asm::endp(const std::string& value)
{
    m_current_place_for_writing->append(value + " ENDP\n");
}

void stc::Asm::procedure_prolog(size_t level, size_t size_local_variable)
{
    m_current_place_for_writing->append(proc_prolog + to_string(level) + ", " + to_string(size_local_variable) + "\n");
}

void stc::Asm::procedure_epilogue()
{
    m_current_place_for_writing->append(proc_epilogue);
}

void stc::Asm::finit()
{
    m_current_place_for_writing->append(tab + "finit\n");
}

void stc::Asm::fild(const std::string& value)
{
    m_current_place_for_writing->append(tab + "fild " + value + "\n");
}

void stc::Asm::fdiv(const std::string& value1, const std::string& value2)
{
    m_current_place_for_writing->append(tab + "fdiv " + value1 + ", " + value2 + "\n");
}

void stc::Asm::fist(const std::string& value)
{
    m_current_place_for_writing->append(tab + "fist " + value + "\n");
}

void stc::Asm::fsqrt()
{
    m_current_place_for_writing->append(tab + "fsqrt\n");
}

void stc::Asm::write(const std::string& text)
{
    m_file << text << "\n";
}

void stc::Asm::init_string_constants()
{
    size_t count_constant = 0;
    init_string_constants_recursive(m_ast->m_root, count_constant);
}

void stc::Asm::init_string_constants_recursive(stc::Node* current_node, size_t& count_constant)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::STRING_CONST)
    {
        auto value = any_cast<string>(current_node->value);
        current_node->statement_id(count_constant);

        m_data += "   string_const_" + std::to_string(count_constant) + " db " + value + ",13,10,0\n";

        ++count_constant;
    }

    init_string_constants_recursive(current_node->operand1, count_constant);
    init_string_constants_recursive(current_node->operand2, count_constant);
    init_string_constants_recursive(current_node->operand3, count_constant);
    init_string_constants_recursive(current_node->operand4, count_constant);
}

void stc::Asm::comment(const std::string& value)
{
    m_current_place_for_writing->append(tab + "; " + value + "\n");
}

