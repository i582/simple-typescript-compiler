#include "assembler.h"

compiler::assembler::assembler(const std::string& file_name, ast* tree)
{
    file.open(file_name);

    this->_ast = tree;
}

compiler::assembler::~assembler()
{
    file.close();
}

void compiler::assembler::init_variable_on_stack(const std::string& name_, size_t size_)
{
    string result;

    result += "   _var_" + name_ + " = -" + std::to_string(_byte_on_stack) + "\n";

    file << result;

    _byte_on_stack += size_;
}

void compiler::assembler::write(const string& text, bool tab)
{
    if (tab)
        file << "   ";
    file << text << "\n";
}

void compiler::assembler::init_stack()
{
    file << "   push ebp\n"
            "   mov ebp, esp\n";
}

void compiler::assembler::init()
{
    string asm_header = ".586\n"
                        ".model flat, stdcall\n\n"
                        "include c:\\masm32\\include\\msvcrt.inc\n"
                        "include c:\\masm32\\include\\kernel32.inc\n"
                        "includelib c:\\masm32\\lib\\msvcrt.lib\n"
                        "includelib c:\\masm32\\lib\\kernel32.lib\n";

    write(asm_header);
}

void compiler::assembler::generate()
{
    init();

    const string data_start =   "data segment";
    const string data_end =     "data ends\n";

    const string text_start =   "text segment";
    const string text_end =     "text ends";

    const string start_label =     "__start:";
    const string end_label =       "end __start";

    const string start_stack =  "   push ebp\n"
                                "   mov ebp, esp";

    const string end_stack =    "   mov esp, ebp\n"
                                "   pop ebp";

    const string ret =          "   ret";

    _data += "   div_operand_1 dd 0\n"
             "   div_operand_2 dd 0\n";


    init_string_constants();
    function_implementation();
    string functions_implementations = _main;
    _main.clear();

    init_global_functions();
    init_variable();


    to_asm();

    write(data_start);
    write(_data);
    write(data_end);


    write(text_start);
    write(_pre_main);
    write(functions_implementations);

    write(start_label);

    init_stack();

    // start main
    write(_main);

    write(end_stack);
    write(ret);
    write(text_end);
    write(end_label);


}

void compiler::assembler::init_global_functions()
{
    init_global_functions_recursive(_ast->_tree);
}

void compiler::assembler::init_global_functions_recursive(node* current_node)
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

void compiler::assembler::init_input_function()
{
    _data += "   input_format db \"%d\", 0\n";
    _data += "   input_result dword 0\n";

    _pre_main += "input PROC\n";
    _pre_main += "   push ebp\n";
    _pre_main += "   mov ebp, esp\n";
    _pre_main += "   invoke crt_scanf, offset input_format, offset input_result\n";
    _pre_main += "   mov eax, input_result\n";
    _pre_main += "   pop ebp \n";
    _pre_main += "   ret\n";
    _pre_main += "input ENDP\n\n";
}

void compiler::assembler::init_print_function()
{
    _data += "   print_format db \"%d \", 0\n";

    _pre_main += "print PROC\n";
    _pre_main += "   push ebp\n";
    _pre_main += "   mov ebp, esp\n";
    _pre_main += "   mov eax, [ebp + 8]\n";
    _pre_main += "   invoke crt_printf, offset print_format, eax\n";
    _pre_main += "   pop ebp\n";
    _pre_main += "   ret 4\n";
    _pre_main += "print ENDP\n\n";
}

void compiler::assembler::init_println_function()
{
    _data += "   println_format db \"%s\", 0\n";

    _pre_main += "println PROC\n";
    _pre_main += "   push ebp\n";
    _pre_main += "   mov ebp, esp\n";
    _pre_main += "   mov eax, [ebp + 8]\n";
    _pre_main += "   invoke crt_printf, offset println_format, eax\n";
    _pre_main += "   pop ebp\n";
    _pre_main += "   ret 4\n";
    _pre_main += "println ENDP\n\n";
}

void compiler::assembler::init_sqrt_function()
{
    _data += "   sqrt_result dd 0\n";

    _pre_main += "sqrt PROC\n";
    _pre_main += "   push ebp\n";
    _pre_main += "   mov ebp, esp\n";
    _pre_main += "   mov eax, [ebp + 8]\n";
    _pre_main += "   mov sqrt_result, eax\n";
    _pre_main += "   finit\n";
    _pre_main += "   fild sqrt_result\n";
    _pre_main += "   fsqrt\n";
    _pre_main += "   fist sqrt_result\n";
    _pre_main += "   mov eax, sqrt_result\n";
    _pre_main += "   pop ebp\n";
    _pre_main += "   ret 4\n";
    _pre_main += "sqrt ENDP\n\n";
}

void compiler::assembler::to_asm()
{
    to_asm_recursive(_ast->_tree, false);
}

void compiler::assembler::function_implementation()
{
    function_implementation_recursive(_ast->_tree);
}

void compiler::assembler::function_implementation_recursive(node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        if (current_node->operand3->type == node_type::EXPRESSION)
            return;

        auto function_name = any_cast<string>(current_node->value);

        if (_ast->_global_functions.has_function(function_name))
            return;


        _main += function_name + " PROC \n";
        _main += "   push ebp\n"
                 "   mov ebp, esp\n";

        size_t stack_shift = 8;
        function_implementation_args_recursive(current_node->operand2, stack_shift);


        to_asm_recursive(current_node->operand3, true);

        _main += "   pop ebp\n";
        _main += "   ret " + std::to_string(stack_shift - 8) + "\n";
        _main += function_name + " ENDP \n";
        return;
    }

    function_implementation_recursive(current_node->operand1);
    function_implementation_recursive(current_node->operand2);
    function_implementation_recursive(current_node->operand3);
    function_implementation_recursive(current_node->operand4);
}

void compiler::assembler::function_implementation_args_recursive(compiler::node* current_node, size_t& stack_shift)
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
                _main += "   mov edx, [ebp + " + std::to_string(stack_shift) + "]\n";
                _main += "   mov " + variable_name + ", edx\n";
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
                _data += "   " + variable_name + " dd 0\n";
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

void compiler::assembler::to_asm_recursive(compiler::node* current_node, bool in_function)
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


            auto var_type = _ast->_all_variables.get_variable_by_name(variable_name)->type();
            if (variable::is_array_type(var_type))
                return;

            auto block_id = op1->statement_id();

            variable_name += std::to_string(block_id);

            expression_recursive(op2, in_function);

            // pop eax
            pop(eax);
            // mov variable, eax
            mov(variable_name, eax);
        }
        else if (op1->type == node_type::INDEX_CAPTURE)
        {
            auto variable_node = op1->operand1;
            auto index_node = op1->operand2;

            auto array_name = any_cast<string>(variable_node->value);
            auto block_id = variable_node->statement_id();

            auto array_type = _ast->_all_variables.get_variable_by_name(array_name)->type();
            string array_item_shift;

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

            auto parent_stmt = _ast->get_stmt_by_id(block_id);
            auto stmt_vars = parent_stmt->vars;

            auto defined_in_this_function = stmt_vars->has_variable_in_current_function(array_name);


            array_name += std::to_string(block_id);

            auto array_name_with_index = array_name + "[" + eax + "]";


            expression_recursive(op2, in_function);
            pop(ebx);

            expression_recursive(index_node->operand1, in_function);
            pop(eax);
            imul(eax, array_item_shift);


            if (defined_in_this_function)
            {
                _main += "   mov edx, offset " + array_name + "\n";
            }
            else
            {
                _main += "   mov edx, " + array_name + "\n";
            }


            //mov(edx, array_name);
            add(edx, array_item_shift);
            _main += "   mov [edx], ebx\n";
        }
        return;
    }

    else if (current_node->type == node_type::LESS ||
            current_node->type == node_type::GREATER ||
            current_node->type == node_type::LESS_EQUAL ||
            current_node->type == node_type::GREATER_EQUAL ||
            current_node->type == node_type::EQUAL ||
            current_node->type == node_type::NOT_EQUAL ||
            current_node->type == node_type::LOGICAL_AND ||
            current_node->type == node_type::LOGICAL_OR ||
            current_node->type == node_type::UNARY_EXCLAMATION)
    {
        relation_expression_recursive(current_node, in_function);
        return;
    }


    else if (current_node->type == node_type::IF
            || current_node->type == node_type::IF_ELSE)
    {
        node* condition         = current_node->operand1->operand1;
        node* statement         = current_node->operand2;
        node* else_statement    = current_node->operand3;

        string start_label_     = "_if_start_" + std::to_string(statement->statement_id());
        string end_label_       = "_if_end_" + std::to_string(statement->statement_id());
        string else_label_      = "_if_else_" + std::to_string(statement->statement_id());


        to_asm_recursive(condition, in_function);

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
            to_asm_recursive(statement, in_function);

            // jmp label
            jmp(end_label_);

            // label:
            label(else_label_);
            to_asm_recursive(else_statement, in_function);

            // label:
            label(end_label_);

        }
        else if (current_node->type == node_type::IF)
        {
            // label:
            label(start_label_);
            to_asm_recursive(statement, in_function);

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


        label(start_label_);

        to_asm_recursive(condition, in_function);

        pop(eax);
        cmp(eax, null);

        je(end_label_);

        // label:
        to_asm_recursive(statement, in_function);
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


        to_asm_recursive(prevention, in_function);
        label(start_label_);

        to_asm_recursive(condition, in_function);

        pop(eax);
        cmp(eax, null);

        je(end_label_);


        // label:
        to_asm_recursive(statement, in_function);
        to_asm_recursive(aftereffects, in_function);
        jmp(start_label_);

        // label:
        label(end_label_);


        return;
    }
    else if (current_node->type == node_type::BREAK)
    {
        auto block_id = current_node->statement_id() + 2;
        string label_value = "_loop_end_" + std::to_string(block_id);

        jmp(label_value);
        return;
    }
    else if (current_node->type == node_type::CONTINUE)
    {
        auto block_id = current_node->statement_id() + 2;
        string label_value = "_loop_start_" + std::to_string(block_id);

        jmp(label_value);
        return;
    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        expression_recursive(current_node, in_function);
    }
    else if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        return;
    }
    else if (current_node->type == node_type::RETURN)
    {
        expression_recursive(current_node->operand1, in_function);
        pop(eax);

        auto arguments_size = std::to_string(any_cast<size_t>(current_node->value));

        _main += "   pop ebp\n";
        _main += "   ret " + arguments_size + "\n";
        return;
    }

    to_asm_recursive(current_node->operand1, in_function);
    to_asm_recursive(current_node->operand2, in_function);
    to_asm_recursive(current_node->operand3, in_function);
    to_asm_recursive(current_node->operand4, in_function);
}

void compiler::assembler::init_arguments_on_stack_recursive(compiler::node* current_node, bool in_function)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_ARGS)
    {
        init_argument_on_stack(current_node->operand1, in_function);
    }

    init_arguments_on_stack_recursive(current_node->operand1, in_function);
    init_arguments_on_stack_recursive(current_node->operand2, in_function);
    init_arguments_on_stack_recursive(current_node->operand3, in_function);
    init_arguments_on_stack_recursive(current_node->operand4, in_function);
}

void compiler::assembler::init_argument_on_stack(compiler::node* current_node, bool in_function)
{
    expression_recursive(current_node, in_function);
}

void compiler::assembler::call_input_function()
{
    _main += "   call input\n";
    _main += "   push eax\n";
}

void compiler::assembler::call_sqrt_function()
{
    _main += "   call sqrt\n";
    _main += "   push eax\n";
}

void compiler::assembler::expression_recursive(node* current_node, bool in_function)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::ADD)
    {
        expression_recursive(current_node->operand1, in_function);
        expression_recursive(current_node->operand2, in_function);

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
        expression_recursive(current_node->operand1, in_function);
        expression_recursive(current_node->operand2, in_function);

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
        expression_recursive(current_node->operand1, in_function);
        expression_recursive(current_node->operand2, in_function);

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
        expression_recursive(current_node->operand1, in_function);
        expression_recursive(current_node->operand2, in_function);

        // pop ebx
        pop(ebx);
        // pop eax
        pop(eax);

        _main += "   mov div_operand_1, eax\n"
                 "   mov div_operand_2, ebx\n";

        _main += "   finit\n"
                 "   fild div_operand_2\n"
                 "   fild div_operand_1\n"
                 "   fdiv st(0), st(1)\n"
                 "   fist div_operand_1\n"
                 "   push div_operand_1\n";

    }
    else if (current_node->type == node_type::UNARY_MINUS)
    {
        expression_recursive(current_node->operand1, in_function);
        // pop eax
        pop(eax);
        // imul div, ebx
        string minus = std::to_string(-1);
        imul(eax, minus);
        // push eax
        push(eax);
    }
    else if (current_node->type == node_type::NUMBER_CONST)
    {
        // push const
        auto number_value = std::to_string((size_t)any_cast<number>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == node_type::BOOLEAN_CONST)
    {
        // push const
        auto number_value = std::to_string((size_t)any_cast<int>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == node_type::STRING_CONST)
    {
        // push const
        auto value_id = current_node->statement_id();
        auto string_access = "offset string_const_" + std::to_string(value_id);
        push(string_access);
    }
    else if (current_node->type == node_type::USING_VARIABLE ||
             current_node->type == node_type::USING_CONSTANT)
    {
        auto variable_name = any_cast<string>(current_node->value);

        auto is_array = variable::is_array_type(_ast->_all_variables.get_variable_by_name(variable_name)->type());

        auto block_id = current_node->statement_id();

        auto parent_stmt = _ast->get_stmt_by_id(block_id);
        auto stmt_vars = parent_stmt->vars;

        auto defined_in_this_function = stmt_vars->has_variable_in_current_function(variable_name);

        variable_name += std::to_string(block_id);

        if (is_array)
        {
            // push const
            if (in_function && !defined_in_this_function)
            {
                _main += "   push " + variable_name + "\n";
            }
            else
            {
                _main += "   push offset " + variable_name + "\n";
            }
        }
        else
        {
            // push const
            push(variable_name);
        }

    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        init_arguments_on_stack_recursive(current_node->operand1, in_function);

        auto function_name = any_cast<string>(current_node->value);

        auto function = _ast->_functions.get_function(function_name);

        auto function_return_void = function->return_type() == variable_type::VOID;

        if (function_name == "input")
        {
            call_input_function();
        }
        else if (function_name == "sqrt")
        {
            call_sqrt_function();
        }
        else
        {
            call(function_name);

            if (!function_return_void)
            {
                _main += "   push eax\n";
            }

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

        auto parent_stmt = _ast->get_stmt_by_id(function_id);
        auto stmt_vars = parent_stmt->vars;

        auto defined_in_this_function = stmt_vars->has_variable_in_current_function(array_name);


        array_name += std::to_string(block_id);

        auto array_name_with_index = array_name + "[" + eax + "]";

        expression_recursive(op2->operand1, in_function);
        pop(eax);

        imul(eax, array_item_shift);

        //_main += "   mov edx, offset " + array_name + "\n";

        if (in_function && !defined_in_this_function)
        {
            _main += "   mov edx, " + array_name + "\n";
        }
        else
        {
            _main += "   mov edx, offset " + array_name + "\n";
        }

        _main += "   mov eax, [edx[eax]]\n";
        push(eax);
    }
    else if (current_node->type == node_type::EXPRESSION)
    {
        expression_recursive(current_node->operand1, in_function);
    }
}

void compiler::assembler::relation_expression_recursive(node* current_node, bool in_function)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == node_type::NUMBER_CONST)
    {
        auto value = any_cast<number>(current_node->value);
        auto value_str = std::to_string(value);

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
        auto value_str = std::to_string(value);

        if (value == 0)
        {
            push(null);
        }
        else
        {
            push(one);
        }
    }
    else if (current_node->type == node_type::USING_VARIABLE)
    {
        auto current_time = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now().time_since_epoch());

        string label_if_equal = "_compare_equal" + std::to_string(current_time.count());
        string label_if_not_equal = "_compare_not_equal" + std::to_string(current_time.count());
        string label_end = "_compare_end" + std::to_string(current_time.count());


        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();

        variable_name += std::to_string(block_id);

        cmp(variable_name, null);


        // jne (!=) label
        jne(label_if_not_equal);
        push(one);
        jmp(label_end);

        label(label_if_not_equal);
        push(null);

        label(label_end);

    }
    else if (current_node->type == node_type::LOGICAL_AND)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        relation_expression_recursive(op1, in_function);
        pop(eax);
        relation_expression_recursive(op2, in_function);
        pop(ebx);

        _main += "   and eax, ebx\n";
        push(eax);
    }
    else if (current_node->type == node_type::LOGICAL_OR)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        relation_expression_recursive(op1, in_function);
        pop(eax);
        relation_expression_recursive(op2, in_function);
        pop(ebx);

        _main += "   or eax, ebx\n";
        push(eax);
    }
    else if (current_node->type == node_type::UNARY_EXCLAMATION)
    {
        relation_expression_recursive(current_node->operand1->operand1, in_function);

        pop(eax);
        _main += "   not eax\n";
        push(eax);
    }
    else
    {
        auto current_time = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now().time_since_epoch());

        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        expression_recursive(op1, in_function);
        pop(ecx);
        expression_recursive(op2, in_function);
        pop(edx);

        // cmp ecx, edx
        cmp(ecx, edx);

        string label_if_equal = "_compare_equal" + std::to_string(current_time.count());
        string label_if_not_equal = "_compare_not_equal" + std::to_string(current_time.count());
        string label_end = "_compare_end" + std::to_string(current_time.count());



        if (current_node->type == node_type::LESS)
        {
            // jge (>=) label
            jge(label_if_not_equal);
            push(one);
            jmp(label_end);

            label(label_if_not_equal);
            push(null);

            label(label_end);
        }
        else if (current_node->type == node_type::LESS_EQUAL)
        {
            // jg (>) label
            jg(label_if_not_equal);
            push(one);
            jmp(label_end);

            label(label_if_not_equal);
            push(null);

            label(label_end);
        }
        else if (current_node->type == node_type::GREATER)
        {
            // jle (<=) label
            jle(label_if_not_equal);
            push(one);
            jmp(label_end);

            label(label_if_not_equal);
            push(null);

            label(label_end);
        }
        else if (current_node->type == node_type::GREATER_EQUAL)
        {
            // jl (<) label
            jl(label_if_not_equal);
            push(one);
            jmp(label_end);

            label(label_if_not_equal);
            push(null);

            label(label_end);
        }
        else if (current_node->type == node_type::EQUAL)
        {
            // jne (!=) label
            jne(label_if_not_equal);
            push(one);
            jmp(label_end);

            label(label_if_not_equal);
            push(null);

            label(label_end);
        }
        else if (current_node->type == node_type::NOT_EQUAL)
        {
            // je (==) label
            je(label_if_not_equal);
            push(one);
            jmp(label_end);

            label(label_if_not_equal);
            push(null);

            label(label_end);
        }

        return;
    }



}

void compiler::assembler::init_variable()
{
    for (const auto& variable : _ast->_all_variables.vars())
    {
        auto var_type = variable->type();
        auto variable_name = variable->name_with_postfix();

        auto block_id = variable->block_id();


        switch (var_type)
        {
            case variable_type::NUMBER:
            {
                _data += "   " + variable_name + " dd 0\n";
                break;
            }
            case variable_type::BOOLEAN:
            {
                _data += "   " + variable_name + " dd 0\n";
                break;
            }
            case variable_type::STRING:
            {
                _data += "   " + variable_name + " db \" \",0\n";

                break;
            }
            case variable_type::NUMBER_ARRAY:
            case variable_type::BOOLEAN_ARRAY:
            case variable_type::STRING_ARRAY:
            case variable_type::VOID_ARRAY:
            case variable_type::UNDEFINED:
            case variable_type::VOID:
            case variable_type::ANY:
                break;
        }
    }

    for (const auto& array : _ast->_arrays)
    {
        auto array_name = array.name();
        auto variable = _ast->_all_variables.get_variable_by_name(array_name);
        auto array_type = variable->type();
        auto array_size = array.size();
        auto block_id = variable->block_id();
        const auto& array_values = array.values();

        array_name = variable->name_with_postfix();



        switch (array_type)
        {
            case variable_type::NUMBER_ARRAY:
            {
                if (array_values.empty())
                {
                    _data += "   " + array_name + " dd " + std::to_string(array_size) + " dup (0)\n";
                }
                else
                {
                    _data += "   " + array_name + " dd " + array.values_to_string() + "\n";
                }
                break;
            }
            case variable_type::BOOLEAN_ARRAY:
            {
                if (array_values.empty())
                {
                    _data += "   " + array_name + " dd " + std::to_string(array_size) + " dup (0)\n";
                }
                else
                {
                    _data += "   " + array_name + " dd " + array.values_to_string() + "\n";
                }
                break;
            }
            case variable_type::STRING_ARRAY:
            {
                if (array_values.empty())
                {
                    _data += "   " + array_name + " db " + std::to_string(array_size) + " dup (0)\n";
                }
                else
                {
                    _data += "   " + array_name + " db " + array.values_to_string() + "\n";
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
                break;
        }

    }
}

void compiler::assembler::init_string_constants()
{
    size_t count_constant = 0;
    init_string_constants_recursive(_ast->_tree, count_constant);
}

void compiler::assembler::init_string_constants_recursive(node* current_node, size_t& count_constant)
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




