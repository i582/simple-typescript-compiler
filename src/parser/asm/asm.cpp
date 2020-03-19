#include "asm.h"

compiler::generic_asm::generic_asm(const std::string& file_name, compiler::ast* tree)
{
    _file.open(file_name);
    _ast = tree;
    _current_place_for_writing = &_main;

    _byte_on_stack = 4;
}

compiler::generic_asm::~generic_asm()
{
    _file.close();
}

void compiler::generic_asm::generate()
{
    init_string_constants();
    init_operands_for_division();
    init_variables();
    init_global_functions();
    blocks_to_asm();

    write(asm_header);

    write(start_data);
    write(_data);
    write(end_data);


    write(text_start);
    write(_before_main);
    write(_function_implementations);


    write(label_start);
    write(proc_prolog);
    write(_main);
    write(proc_epilogue);
    write(function_return);

    write(text_end);
    write(label_end);
}

void compiler::generic_asm::init_variables()
{
    for (const auto& variable : _ast->_all_variables.vars())
    {
        local_variable(variable);
    }

    for (const auto& array : _ast->_arrays)
    {
        local_array(array);
    }
}

void compiler::generic_asm::blocks_to_asm()
{
    blocks_recursive(_ast->_tree);
}

void compiler::generic_asm::blocks_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::SET)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        if (op1->type == node_type::USING_VARIABLE ||
            op1->type == node_type::VARIABLE_DECLARATION ||
            op1->type == node_type::CONSTANT_DECLARATION)
        {
            auto variable_name = any_cast<string>(op1->value);
            auto block_id = op1->statement_id();
            auto is_array = _ast->_all_variables.get_variable_by_name(variable_name)->is_array();

            variable_name += std::to_string(block_id);


            if (is_array)
                return;

            expression_recursive(op2);

            // pop eax
            pop(eax);
            // mov variable, eax
            mov(local_var(variable_name), eax);
        }
        else if (op1->type == node_type::INDEX_CAPTURE)
        {
            auto variable_node = op1->operand1;
            auto index_node = op1->operand2;

            auto array_name = any_cast<string>(variable_node->value);
            auto block_id = variable_node->statement_id();

            auto array_type = _ast->_all_variables.get_variable_by_name(array_name)->type();
            string array_item_shift;

            array_name += to_string(block_id);

            switch (array_type)
            {
                case variable_type::NUMBER_ARRAY:
                {
                    array_item_shift = "4";
                    break;
                }
                case variable_type::BOOLEAN_ARRAY:
                {
                    array_item_shift = "1";
                    break;
                }
                case variable_type::STRING_ARRAY:
                {
                    array_item_shift = "4";
                    break;
                }

                case variable_type::UNDEFINED:
                case variable_type::NUMBER:
                case variable_type::BOOLEAN:
                case variable_type::STRING:
                case variable_type::VOID:
                case variable_type::ANY:
                case variable_type::VOID_ARRAY:
                    break;
            }

            expression_recursive(op2);
            pop(edx);

            expression_recursive(index_node->operand1);
            pop(ecx);
            imul(ecx, array_item_shift);

            mov(esi, array_name);
            add(esi, ecx);

            mov("[esi]", edx);
        }

        return;
    }
    else if (node::is_comparison_operator(current_node->type))
    {
        relation_expression_recursive(current_node);
        return;
    }
    else if (current_node->type == node_type::IF
             || current_node->type == node_type::IF_ELSE)
    {
        node* condition         = current_node->operand1->operand1;
        node* statement         = current_node->operand2;
        node* else_statement    = current_node->operand3;

        string start_label_     = "_if_start_" + to_string(statement->statement_id());
        string end_label_       = "_if_end_" + to_string(statement->statement_id());
        string else_label_      = "_if_else_" + to_string(statement->statement_id());


        blocks_recursive(condition);
        pop(eax);
        cmp(eax, null);

        string end_or_else_label = end_label_;
        if (current_node->type == node_type::IF_ELSE)
        {
            end_or_else_label = else_label_;
        }


        je(end_or_else_label);



        if (current_node->type == node_type::IF_ELSE)
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
        else if (current_node->type == node_type::IF)
        {
            // label:
            label(start_label_);
            blocks_recursive(statement);

            // label:
            label(end_label_);
        }

        return;
    }
    else if (current_node->type == node_type::WHILE)
    {
        node* condition = current_node->operand1->operand1;
        node* statement = current_node->operand2;

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
    else if (current_node->type == node_type::FOR)
    {
        node* prevention = current_node->operand1->operand1;
        node* condition = current_node->operand2->operand1;
        node* aftereffects = current_node->operand3->operand1;
        node* statement = current_node->operand4;

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
    else if (current_node->type == node_type::BREAK)
    {
        auto block_id = current_node->statement_id() + 2;
        string label_value = "_loop_end_" + to_string(block_id);

        jmp(label_value);
        return;
    }
    else if (current_node->type == node_type::CONTINUE)
    {
        auto block_id = current_node->statement_id() + 2;
        string label_value = "_loop_aftereffects_" + std::to_string(block_id);

        jmp(label_value);
        return;
    }

    else if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

        function_implementation_recursive(current_node);

        set_place_for_writing(asm_place_for_writing::MAIN);

        return;
    }
    else if (current_node->type == node_type::RETURN)
    {
        expression_recursive(current_node->operand1);
        pop(eax);

        auto arguments_size = any_cast<size_t>(current_node->value);

        procedure_epilogue();
        ret(to_string(arguments_size));
        return;
    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        expression_recursive(current_node);
        return;
    }
    else if (current_node->type == node_type::BEFORE_INC ||
            current_node->type == node_type::BEFORE_DEC)
    {
        expression_recursive(current_node);
        return;
    }
    else if (current_node->type == node_type::NUMBER_CONST ||
            current_node->type == node_type::BOOLEAN_CONST ||
            current_node->type == node_type::USING_VARIABLE ||
            current_node->type == node_type::USING_CONSTANT ||
            current_node->type == node_type::INDEX_CAPTURE ||
            current_node->type == node_type::UNARY_EXCLAMATION ||
            current_node->type == node_type::UNARY_MINUS)
    {
        expression_recursive(current_node);
        return;
    }
    else if (current_node->type == node_type::EXPRESSION)
    {
        blocks_recursive(current_node->operand1);
        return;
    }


    blocks_recursive(current_node->operand1);
    blocks_recursive(current_node->operand2);
    blocks_recursive(current_node->operand3);
    blocks_recursive(current_node->operand4);
}

void compiler::generic_asm::expression_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == node_type::ADD)
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
    else if (current_node->type == node_type::SUB)
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
    else if (current_node->type == node_type::MUL)
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
    else if (current_node->type == node_type::DIV)
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
    else if (current_node->type == node_type::UNARY_MINUS)
    {
        expression_recursive(current_node->operand1);

        // pop eax
        pop(eax);
        // imul div, -1
        imul(eax, to_string(-1));
        // push eax
        push(eax);
    }
    else if (current_node->type == node_type::UNARY_EXCLAMATION)
    {
        expression_recursive(current_node->operand1);

        // pop eax
        pop(eax);
        logical_xor(eax, minus_one);
        logical_and(eax, one);
        push(eax);
    }
    else if (current_node->type == node_type::AFTER_INC ||
            current_node->type == node_type::AFTER_DEC)
    {
        cout << "Current not supported a++ or a--!" << endl;
    }
    else if (current_node->type == node_type::BEFORE_INC)
    {
        string variable_name;
        size_t block_id = 0;

        auto value_node = current_node->operand1;

        if (value_node->type == node_type::USING_VARIABLE ||
            value_node->type == node_type::USING_CONSTANT)
        {
            variable_name = any_cast<string>(value_node->value);
            block_id = value_node->statement_id();

            variable_name += to_string(block_id);

            push(variable_name);

            // pop eax
            pop(eax);
            add(eax, one);

            mov(variable_name, eax);
            push(variable_name);
        }
        else if (value_node->type == node_type::INDEX_CAPTURE)
        {
            variable_name = any_cast<string>(value_node->operand1->value);
            block_id = value_node->operand1->statement_id();



            auto number_node = node(node_type::NUMBER_CONST, (number)1);
            auto sub_node = node(node_type::ADD, "", value_node, &number_node);

            auto set_node = node(node_type::SET, "", value_node, &sub_node);

            blocks_recursive(&set_node);
        }

    }
    else if (current_node->type == node_type::BEFORE_DEC)
    {
        string variable_name;
        size_t block_id = 0;

        auto value_node = current_node->operand1;

        if (value_node->type == node_type::USING_VARIABLE ||
            value_node->type == node_type::USING_CONSTANT)
        {
            variable_name = any_cast<string>(value_node->value);
            block_id = value_node->statement_id();

            variable_name += to_string(block_id);

            push(variable_name);

            // pop eax
            pop(eax);
            sub(eax, one);

            mov(variable_name, eax);
            push(variable_name);
        }
        else if (value_node->type == node_type::INDEX_CAPTURE)
        {
            variable_name = any_cast<string>(value_node->operand1->value);
            block_id = value_node->operand1->statement_id();



            auto number_node = node(node_type::NUMBER_CONST, (number)1);
            auto sub_node = node(node_type::SUB, "", value_node, &number_node);

            auto set_node = node(node_type::SET, "", value_node, &sub_node);

            blocks_recursive(&set_node);
        }

    }
    else if (current_node->type == node_type::NUMBER_CONST)
    {
        // push const
        auto number_value = to_string((int)any_cast<number>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == node_type::BOOLEAN_CONST)
    {
        // push const
        auto number_value = to_string((size_t)any_cast<int>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == node_type::STRING_CONST)
    {
        // push const
        auto value_id = current_node->statement_id();
        auto string_access = "string_const_" + to_string(value_id);
        push(offset(string_access));
    }
    else if (current_node->type == node_type::USING_VARIABLE ||
             current_node->type == node_type::USING_CONSTANT)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();

        variable_name += to_string(block_id);

        push(local_var(variable_name));
    }
    else if (node::is_comparison_operator(current_node->type))
    {
        relation_expression_recursive(current_node);
    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        init_arguments_on_stack_recursive(current_node->operand1);

        auto function_name = any_cast<string>(current_node->value);
        auto function = _ast->_functions.get_function(function_name);
        auto function_return_void = function->return_type() == variable_type::VOID;

        call(function_name);

        if (!function_return_void)
        {
            push(eax);
        }

        return;
    }
    else if (current_node->type == node_type::INDEX_CAPTURE)
    {
        auto op1 = current_node->operand1;
        auto op2 = current_node->operand2;

        auto array_name = any_cast<string>(op1->value);
        auto function_id = op1->in_function_id();
        auto block_id = op1->statement_id();

        auto array_type = _ast->_all_variables.get_variable_by_name(array_name)->type();
        string array_item_shift;

        array_name += to_string(block_id);

        switch (array_type)
        {
            case variable_type::NUMBER_ARRAY:
            {
                array_item_shift = "4";
                break;
            }
            case variable_type::BOOLEAN_ARRAY:
            {
                array_item_shift = "1";
                break;
            }
            case variable_type::STRING_ARRAY:
            {
                array_item_shift = "4";
                break;
            }

            case variable_type::UNDEFINED:
            case variable_type::NUMBER:
            case variable_type::BOOLEAN:
            case variable_type::STRING:
            case variable_type::VOID:
            case variable_type::ANY:
            case variable_type::VOID_ARRAY:
                break;
        }

        expression_recursive(op2->operand1);
        pop(edx);
        imul(edx, array_item_shift);

        mov(esi, array_name);
        push("[esi[edx]]");
    }
    else if (current_node->type == node_type::EXPRESSION)
    {
        expression_recursive(current_node->operand1);
    }
}

void compiler::generic_asm::relation_expression_recursive(node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::NUMBER_CONST)
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
    else if (current_node->type == node_type::BOOLEAN_CONST)
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
    else if (current_node->type == node_type::USING_VARIABLE ||
             current_node->type == node_type::USING_CONSTANT)
    {
        auto current_time = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now().time_since_epoch());

        string label_if_equal = "_compare_equal" + std::to_string(current_time.count());
        string label_if_not_equal = "_compare_not_equal" + std::to_string(current_time.count());
        string label_compare_end = "_compare_end" + std::to_string(current_time.count());

        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        variable_name += to_string(block_id);

        cmp(variable_name, null);

        // jne (!=) label
        jne(label_if_not_equal);
        push(null);
        jmp(label_compare_end);

        label(label_if_not_equal);
        push(one);

        label(label_compare_end);
    }
    else if (current_node->type == node_type::LOGICAL_AND)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        relation_expression_recursive(op1);
        pop(eax);
        relation_expression_recursive(op2);
        pop(ebx);

        logical_and(eax, ebx);
        push(eax);
    }
    else if (current_node->type == node_type::LOGICAL_OR)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        relation_expression_recursive(op1);
        pop(eax);
        relation_expression_recursive(op2);
        pop(ebx);

        logical_or(eax, ebx);
        push(eax);
    }
    else if (current_node->type == node_type::UNARY_EXCLAMATION)
    {
        relation_expression_recursive(current_node->operand1->operand1);


        // pop eax
        pop(eax);
        logical_xor(eax, minus_one);
        logical_and(eax, one);
        push(eax);
    }
    else if (current_node->type == node_type::EXPRESSION)
    {
        relation_expression_recursive(current_node->operand1);
        return;
    }
    else
    {
        auto current_time = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now().time_since_epoch());

        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        expression_recursive(op1);
        pop(ecx);
        expression_recursive(op2);
        pop(edx);

        // cmp ecx, edx
        cmp(ecx, edx);

        string label_if_equal = "_compare_equal" + std::to_string(current_time.count());
        string label_if_not_equal = "_compare_not_equal" + std::to_string(current_time.count());
        string label_compare_end = "_compare_end" + std::to_string(current_time.count());



        if (current_node->type == node_type::LESS)
        {
            // jge (>=) label
            jge(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == node_type::LESS_EQUAL)
        {
            // jg (>) label
            jg(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == node_type::GREATER)
        {
            // jle (<=) label
            jle(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == node_type::GREATER_EQUAL)
        {
            // jl (<) label
            jl(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == node_type::EQUAL)
        {
            // jne (!=) label
            jne(label_if_not_equal);
            push(one);
            jmp(label_compare_end);

            label(label_if_not_equal);
            push(null);

            label(label_compare_end);
        }
        else if (current_node->type == node_type::NOT_EQUAL)
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

void compiler::generic_asm::function_implementation_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;


    // if function body is empty
    if (current_node->operand3->type == node_type::EXPRESSION)
        return;

    auto function_name = any_cast<string>(current_node->value);

    if (_ast->_global_functions.has_function(function_name))
        return;

    proc(function_name);
    procedure_prolog();


    auto function = _ast->_functions.get_function(function_name);
    auto stack_size = function->arguments_size();

    size_t stack_shift = 8;
    function_implementation_args_recursive(current_node->operand2, stack_shift);

    blocks_recursive(current_node->operand3);

    procedure_epilogue();
    ret(to_string(stack_size));
    endp(function_name);

}

void compiler::generic_asm::function_implementation_args_recursive(compiler::node* current_node, size_t& stack_shift)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();

        variable_name += std::to_string(block_id);

        auto variable_type = variable::variable_type_from_token_type(any_cast<token_type>(current_node->operand1->value));

        switch (variable_type)
        {
            case variable_type::NUMBER:
            case variable_type::BOOLEAN:
            case variable_type::STRING:
            case variable_type::NUMBER_ARRAY:
            case variable_type::BOOLEAN_ARRAY:
            case variable_type::STRING_ARRAY:
            {


                mov(edx, "[ebp + " + to_string(stack_shift) + "]");
                mov(local_var(variable_name), edx);

                stack_shift += 4;
                break;
            }
            case variable_type::UNDEFINED:
            case variable_type::VOID:
            case variable_type::ANY:
            case variable_type::VOID_ARRAY:
                break;
        }

        switch (variable_type)
        {
            case variable_type::NUMBER_ARRAY:
            case variable_type::BOOLEAN_ARRAY:
            case variable_type::STRING_ARRAY:
            {

                break;
            }
            case variable_type::NUMBER:
            case variable_type::BOOLEAN:
            case variable_type::STRING:
            case variable_type::UNDEFINED:
            case variable_type::VOID:
            case variable_type::ANY:
            case variable_type::VOID_ARRAY:
                break;
        }

        return;
    }

    function_implementation_args_recursive(current_node->operand1, stack_shift);
    function_implementation_args_recursive(current_node->operand2, stack_shift);
    function_implementation_args_recursive(current_node->operand3, stack_shift);
    function_implementation_args_recursive(current_node->operand4, stack_shift);
}

void compiler::generic_asm::init_arguments_on_stack_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_ARGS)
    {
        expression_recursive(current_node->operand1);
    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        return;
    }

    init_arguments_on_stack_recursive(current_node->operand1);
    init_arguments_on_stack_recursive(current_node->operand2);
    init_arguments_on_stack_recursive(current_node->operand3);
    init_arguments_on_stack_recursive(current_node->operand4);
}

void compiler::generic_asm::init_global_functions()
{
    init_global_functions_recursive(_ast->_tree);
}

void compiler::generic_asm::init_global_functions_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
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


void compiler::generic_asm::init_input_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "input_format db \"%d\", 0\n");
    raw(tab + "input_result dd 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("input");
    procedure_prolog();

    raw(tab + "invoke crt_scanf, offset input_format, offset input_result\n");
    mov(eax, "input_result");

    procedure_epilogue();
    ret();
    endp("input");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void compiler::generic_asm::init_print_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "print_format db \"%d \", 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("print");
    procedure_prolog();

    mov(eax, "[ebp + 8]");
    raw(tab + "invoke crt_printf, offset print_format, eax\n");

    procedure_epilogue();
    ret("4");
    endp("print");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void compiler::generic_asm::init_println_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "println_format db \"%s\", 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("println");
    procedure_prolog();

    mov(eax, "[ebp + 8]");
    raw(tab + "invoke crt_printf, offset println_format, eax\n");

    procedure_epilogue();
    ret("4");
    endp("println");

    set_place_for_writing(asm_place_for_writing::MAIN);
}

void compiler::generic_asm::init_sqrt_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "sqrt_result dd 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMLEMENTATIONS);

    proc("sqrt");
    procedure_prolog();

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

void compiler::generic_asm::init_operands_for_division()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "div_operand_1 dd 0\n");
    raw(tab + "div_operand_2 dd 0\n");
    set_place_for_writing(asm_place_for_writing::MAIN);
}

void compiler::generic_asm::set_place_for_writing(compiler::asm_place_for_writing place)
{
    switch (place)
    {
        case asm_place_for_writing::DATA:
        {
            _current_place_for_writing = &_data;
            break;
        }
        case asm_place_for_writing::BEFORE_MAIN:
        {
            _current_place_for_writing = &_before_main;
            break;
        }
        case asm_place_for_writing::FUNCTION_IMLEMENTATIONS:
        {
            _current_place_for_writing = &_function_implementations;
            break;
        }
        case asm_place_for_writing::MAIN:
        {
            _current_place_for_writing = &_main;
            break;
        }
    }
}

void compiler::generic_asm::push(const string& value)
{
    _current_place_for_writing->append(tab + "push " + value + "\n");
}

void compiler::generic_asm::pop(const std::string& value)
{
    _current_place_for_writing->append(tab + "pop " + value + "\n");
}

void compiler::generic_asm::add(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "add " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::sub(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "sub " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::imul(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "imul " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::mov(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "mov " + value1 + ", " + value2 + "\n");
}

compiler::string compiler::generic_asm::offset(const std::string& value)
{
    return "offset " + value;
}

std::string compiler::generic_asm::stack_var(const std::string& value)
{
    return "DWORD PTR " + value + "[ebp]";
}

std::string compiler::generic_asm::local_var(const std::string& value)
{
    return value;
}

void compiler::generic_asm::raw(const string& value)
{
    _current_place_for_writing->append(value);
}

void compiler::generic_asm::stack_variable(const string& name)
{
    _current_place_for_writing->append(name + " = " + "-" + to_string(_byte_on_stack) + "\n");
}

void compiler::generic_asm::local_variable(const variable* var)
{
    string variable_type;
    string variable_value;

    switch (var->type())
    {
        case variable_type::NUMBER:
        {
            variable_type = "dd";
            variable_value = "0";
            break;
        }
        case variable_type::BOOLEAN:
        {
            variable_type = "dd";
            variable_value = "0";
            break;
        }
        case variable_type::STRING:
        {
            variable_type = "db";
            variable_value = "\" \",0";
            break;
        }

        case variable_type::UNDEFINED:
        case variable_type::VOID:
        case variable_type::ANY:
        case variable_type::NUMBER_ARRAY:
        case variable_type::BOOLEAN_ARRAY:
        case variable_type::STRING_ARRAY:
        case variable_type::VOID_ARRAY:
            return;
    }

    _data.append(tab + var->name_with_postfix() + " " +
                                    variable_type + " " + variable_value + "\n");
}

void compiler::generic_asm::local_array(const compiler::array& arr)
{
    auto array_name = arr.name();
    auto variable = _ast->_all_variables.get_variable_by_name(array_name);
    auto array_type = variable->type();
    auto array_size = arr.size();
    auto block_id = variable->block_id();
    const auto& array_values = arr.values();

    array_name = variable->name_with_postfix();

    string array_type_str;
    string array_values_str;

    switch (array_type)
    {
        case variable_type::NUMBER_ARRAY:
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
        case variable_type::BOOLEAN_ARRAY:
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
        case variable_type::STRING_ARRAY:
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

        case variable_type::NUMBER:
        case variable_type::BOOLEAN:
        case variable_type::STRING:
        case variable_type::VOID_ARRAY:
        case variable_type::UNDEFINED:
        case variable_type::VOID:
        case variable_type::ANY:
            return;
    }


    _data.append(tab + array_name + "_arr" + " " + array_type_str + " " + array_values_str + "\n");
    _data.append(tab + array_name + " " + array_type_str + " offset " + array_name + "_arr" + "\n");

}

void compiler::generic_asm::logical_or(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "or " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::logical_and(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "and " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::logical_xor(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "xor " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::cmp(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "cmp " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::jmp(const std::string& value)
{
    _current_place_for_writing->append(tab + "jmp " + value + "\n");
}

void compiler::generic_asm::je(const std::string& value)
{
    _current_place_for_writing->append(tab + "je " + value + "\n");
}

void compiler::generic_asm::jne(const std::string& value)
{
    _current_place_for_writing->append(tab + "jne " + value + "\n");
}

void compiler::generic_asm::jl(const std::string& value)
{
    _current_place_for_writing->append(tab + "jl " + value + "\n");
}

void compiler::generic_asm::jle(const std::string& value)
{
    _current_place_for_writing->append(tab + "jle " + value + "\n");
}

void compiler::generic_asm::jg(const std::string& value)
{
    _current_place_for_writing->append(tab + "jg " + value + "\n");
}

void compiler::generic_asm::jge(const std::string& value)
{
    _current_place_for_writing->append(tab + "jge " + value + "\n");
}

void compiler::generic_asm::label(const std::string& value)
{
    _current_place_for_writing->append(value + ":\n");
}

void compiler::generic_asm::call(const std::string& value)
{
    _current_place_for_writing->append(tab + "call " + value + "\n");
}

void compiler::generic_asm::ret(const std::string& value)
{
    _current_place_for_writing->append(tab + "ret " + value + "\n");
}

void compiler::generic_asm::proc(const std::string& value)
{
    _current_place_for_writing->append(value + " PROC\n");
}

void compiler::generic_asm::endp(const std::string& value)
{
    _current_place_for_writing->append(value + " ENDP\n");
}

void compiler::generic_asm::procedure_prolog()
{
    _current_place_for_writing->append(proc_prolog);
}

void compiler::generic_asm::procedure_epilogue()
{
    _current_place_for_writing->append(proc_epilogue);
}

void compiler::generic_asm::finit()
{
    _current_place_for_writing->append(tab + "finit\n");
}

void compiler::generic_asm::fild(const std::string& value)
{
    _current_place_for_writing->append(tab + "fild " + value + "\n");
}

void compiler::generic_asm::fdiv(const std::string& value1, const std::string& value2)
{
    _current_place_for_writing->append(tab + "fdiv " + value1 + ", " + value2 + "\n");
}

void compiler::generic_asm::fist(const std::string& value)
{
    _current_place_for_writing->append(tab + "fist " + value + "\n");
}

void compiler::generic_asm::fsqrt()
{
    _current_place_for_writing->append(tab + "fsqrt\n");
}

void compiler::generic_asm::write(const std::string& text)
{
    _file << text << "\n";
}

void compiler::generic_asm::init_string_constants()
{
    size_t count_constant = 0;
    init_string_constants_recursive(_ast->_tree, count_constant);
}

void compiler::generic_asm::init_string_constants_recursive(compiler::node* current_node, size_t& count_constant)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::STRING_CONST)
    {
        auto value = any_cast<string>(current_node->value);
        current_node->statement_id(count_constant);

        _data += "   string_const_" + std::to_string(count_constant) + " db " + value + ",13,10,0\n";

        ++count_constant;
    }

    init_string_constants_recursive(current_node->operand1, count_constant);
    init_string_constants_recursive(current_node->operand2, count_constant);
    init_string_constants_recursive(current_node->operand3, count_constant);
    init_string_constants_recursive(current_node->operand4, count_constant);
}

