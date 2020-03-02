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


    init_global_functions();
    init_variable();
    to_asm();

    write(data_start);
    write("   fmt db \"%d %d\",10,0");
    // start data
    write(_data);
    write(data_end);


    write(text_start);
    write(_pre_main);


    //variables_to_asm();



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
    _data += "   print_format db \"%d\", 0\n";

    _pre_main += "print PROC\n";
    _pre_main += "   push ebp\n";
    _pre_main += "   mov ebp, esp\n";
    _pre_main += "   mov eax, [ebp + 8]\n";
    _pre_main += "   invoke crt_printf, offset print_format, eax\n";
    _pre_main += "   pop ebp\n";
    _pre_main += "   ret 4\n";
    _pre_main += "print ENDP\n\n";
}

void compiler::assembler::to_asm()
{
    to_asm_recursive(_ast->_tree);
}

void compiler::assembler::to_asm_recursive(compiler::node* current_node)
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


            expression_recursive(op2);

            // mov variable, eax
            mov(op1, eax);
        }
        return;
    }
    else
    {
        expression_recursive(current_node);
    }

    to_asm_recursive(current_node->operand1);
    to_asm_recursive(current_node->operand2);
    to_asm_recursive(current_node->operand3);
    to_asm_recursive(current_node->operand4);
}

void compiler::assembler::init_arguments_on_stack_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_ARGS)
    {
        init_argument_on_stack(current_node->operand1);
    }

    init_arguments_on_stack_recursive(current_node->operand1);
    init_arguments_on_stack_recursive(current_node->operand2);
    init_arguments_on_stack_recursive(current_node->operand3);
    init_arguments_on_stack_recursive(current_node->operand4);
}

void compiler::assembler::init_argument_on_stack(compiler::node* current_node)
{
    expression_recursive(current_node);
}

void compiler::assembler::call_input_function()
{
    _main += "   call input\n";
    _main += "   push eax\n";
}

void compiler::assembler::call_print_function()
{
    _main += "   call print\n";
}

void compiler::assembler::expression_recursive(node* current_node)
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

        // pop eax
        pop(eax);
        // pop ebx
        pop(ebx);
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

        // pop eax
        pop(eax);
        // pop ebx
        pop(ebx);
        // imul div, ebx
        div(eax, ebx);
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
        auto number_value = std::to_string((size_t)any_cast<bool>(current_node->value));
        push(number_value);
    }
    else if (current_node->type == node_type::USING_VARIABLE || current_node->type == node_type::USING_CONSTANT)
    {
        // push const
        auto variable_name = any_cast<string>(current_node->value);
        push(variable_name);
    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        init_arguments_on_stack_recursive(current_node->operand1);

        auto function_name = any_cast<string>(current_node->value);

        if (function_name == "input")
        {
            call_input_function();
        }
        else
        {
            call(function_name);
        }
    }
}

void compiler::assembler::init_variable()
{
    init_variable_recursive(_ast->_tree);
}

void compiler::assembler::init_variable_recursive(node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::VARIABLE_DECLARATION)
    {
        auto var_type = (variable_type)any_cast<token_type>(current_node->operand1->value);

        switch (var_type)
        {
            case variable_type::UNDEFINED:
                break;
            case variable_type::NUMBER:
            {
                auto variable_name = any_cast<string>(current_node->value);

                _data += "   " + variable_name + " dd 0\n";
                break;
            }
            case variable_type::BOOLEAN:
                break;
            case variable_type::STRING:
                break;
            case variable_type::VOID:
                break;
            case variable_type::ANY:
                break;
            case variable_type::NUMBER_ARRAY:
                break;
            case variable_type::BOOLEAN_ARRAY:
                break;
            case variable_type::STRING_ARRAY:
                break;
            case variable_type::VOID_ARRAY:
                break;
        }
    }

    init_variable_recursive(current_node->operand1);
    init_variable_recursive(current_node->operand2);
    init_variable_recursive(current_node->operand3);
    init_variable_recursive(current_node->operand4);
}