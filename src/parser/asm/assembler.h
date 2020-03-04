#pragma once
#include <iostream>
#include <string>
#include "../../lexer/token/token.h"
#include "../node/node.h"
#include "../ast/ast.h"

namespace compiler
{
    using std::string;

    constexpr const char* eax = "eax";
    constexpr const char* ebx = "ebx";
    constexpr const char* ecx = "ecx";
    constexpr const char* edx = "edx";
    constexpr const char* null = "0";


    class assembler
    {
    private:
        std::ofstream file;
        ast* _ast;

        string _data;
        string _pre_main;
        string _main;

    public:

        size_t _byte_on_stack;
        size_t _byte_on_stack_for_function;

    public:
        explicit assembler(const string& file_name, ast* tree);
        ~assembler();


    public:
        void init();
        void generate();

        void write(const string& text, bool tab = false);

        void init_stack();


        void init_global_functions();

    public:
        void init_input_function();
        void init_print_function();
        void init_println_function();

        void init_sqrt_function();

        void init_variable();


        void init_string_constants();



        void to_asm();

        void call_input_function();
        void call_sqrt_function();




    private: // recursive functions
        void init_global_functions_recursive(node* current_node);

        void init_arguments_on_stack_recursive(node* current_node);
        void init_argument_on_stack(node* current_node);

        void init_string_constants_recursive(node* current_node, size_t& count_constant);

        void to_asm_recursive(node* current_node);

        void expression_recursive(node* current_node);




        void init_variable_on_stack(const string& name_, size_t pos_on_stack_);



        void call(const string& value)
        {
            _main += "   call " + value + "\n";
        }

        template<class T1, class T2>
        string add(T1& op1_, T2& op2_)
        {
            string result = "   add ";

            if constexpr (std::is_same<T1, node*>::value)
            {
                result += op1_->_value;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                result += op1_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += ", ";

            if constexpr (std::is_same<T2, node*>::value)
            {
                result += op2_->_value;
            }
            else if constexpr (std::is_same<T2, string>::value || std::is_same<T2, const char*const>::value)
            {
                result += op2_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += "\n";

            _main += result;
            return result;
        }

        template<class T1, class T2>
        string sub(T1& op1_, T2& op2_)
        {
            string result = "   sub ";

            if constexpr (std::is_same<T1, node*>::value)
            {
                result += op1_->_value;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                result += op1_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += ", ";

            if constexpr (std::is_same<T2, node*>::value)
            {
                result += op2_->_value;
            }
            else if constexpr (std::is_same<T2, string>::value || std::is_same<T2, const char*const>::value)
            {
                result += op2_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += "\n";

            _main += result;
            return result;
        }

        template<class T1, class T2>
        string imul(T1& op1_, T2& op2_)
        {
            string result = "   imul ";

            if constexpr (std::is_same<T1, node*>::value)
            {
                result += op1_->_value;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                result += op1_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += ", ";

            if constexpr (std::is_same<T2, node*>::value)
            {
                result += op2_->_value;
            }
            else if constexpr (std::is_same<T2, string>::value || std::is_same<T2, const char*const>::value)
            {
                result += op2_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += "\n";

            _main += result;
            return result;
        }

        template<class T1, class T2>
        string div(T1& op1_, T2& op2_)
        {
            string result = "   div ";

            if constexpr (std::is_same<T1, node*>::value)
            {
                result += op1_->_value;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                result += op1_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += ", ";

            if constexpr (std::is_same<T2, node*>::value)
            {
                result += op2_->_value;
            }
            else if constexpr (std::is_same<T2, string>::value || std::is_same<T2, const char*const>::value)
            {
                result += op2_;
            }
            else
            {
                throw std::logic_error("");
            }

            result += "\n";

            _main += result;
            return result;
        }


        template<class T1, class T2>
        string mov(T1& op1_, T2& op2_)
        {
            string result = "   mov ";

            string operand1;
            bool op1_is_variable = false;

            string operand2;
            bool op2_is_variable = false;
            bool op2_is_const = false;

            if constexpr (std::is_same<T1, node*>::value)
            {
                string variable = any_cast<string>(op1_->value);

                operand1 = variable;
                op1_is_variable = true;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                operand1 = op1_;
                op1_is_variable = false;
            }
            else
            {
                throw std::logic_error("");
            }

            if constexpr (std::is_same<T2, node*>::value)
            {
                string variable = any_cast<string>(op1_->value);

                operand2 = variable;
                op2_is_variable = true;
            }
            else if constexpr (std::is_same<T2, string>::value || std::is_same<T2, const char*const>::value)
            {
                operand2 = op2_;

                if (token::is_number(op2_))
                {
                    op2_is_const = true;
                }

                op2_is_variable = false;
            }
            else
            {
                throw std::logic_error("");
            }

            if (op1_is_variable && op2_is_const)
            {
                result += "DWORD PTR " + operand1 + ", ";
            }
            else
            {
                result += operand1 + ", ";
            }


            result += operand2;


            result += "\n";

            _main += result;
            return result;
        }



        template<class T1>
        string push(T1& op1_)
        {
            string result = "   push ";


            if constexpr (std::is_same<T1, node*>::value)
            {
                string variable = "_var_" + op1_->_value + "[ebp]";

                result += variable;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                result += op1_;
            }
            else
            {
                throw std::logic_error("");
            }


            result += "\n";

            _main += result;
            return result;
        }

        template<class T1>
        string pop(T1& op1_)
        {
            string result = "   pop ";


            if constexpr (std::is_same<T1, node*>::value)
            {
                string variable = "_var_" + op1_->_value + "[ebp]";

                result += variable;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                result += op1_;
            }
            else
            {
                throw std::logic_error("");
            }


            result += "\n";

            _main += result;
            return result;
        }



        template<class T1, class T2>
        string cmp(T1& op1_, T2& op2_)
        {
            string result = "   cmp ";

            string operand1;
            bool op1_is_variable = false;

            string operand2;
            bool op2_is_variable = false;
            bool op2_is_const = false;

            if constexpr (std::is_same<T1, node*>::value)
            {
                string variable = "_var_" + op1_->_value + "[ebp]";

                operand1 = variable;
                op1_is_variable = true;
            }
            else if constexpr (std::is_same<T1, string>::value || std::is_same<T1, const char*const>::value)
            {
                operand1 = op1_;
                op1_is_variable = false;
            }
            else
            {
                throw std::logic_error("");
            }

            if constexpr (std::is_same<T2, node*>::value)
            {
                string variable = "_var_" + op1_->_value + "[ebp]";

                operand2 = variable;
                op2_is_variable = true;
            }
            else if constexpr (std::is_same<T2, string>::value || std::is_same<T2, const char*const>::value)
            {
                operand2 = op2_;

                if (token::is_number(op2_))
                {
                    op2_is_const = true;
                }

                op2_is_variable = false;
            }
            else
            {
                throw std::logic_error("");
            }

            if (op1_is_variable && op2_is_const)
            {
                result += "DWORD PTR " + operand1 + ", ";
            }
            else
            {
                result += operand1 + ", ";
            }


            result += operand2;


            result += "\n";

            _main += result;
            return result;
        }

        void label(const string& label_)
        {
            _main += "\n" + label_ + ":\n";
        }

        void jmp(const string& label_)
        {
            _main += "   jmp " + label_ + "\n";
        }

        void je(const string& label_)
        {
            _main += "   je " + label_ + "\n";
        }

        void jne(const string& label_)
        {
            _main += "   jne " + label_ + "\n";
        }

        void jl(const string& label_)
        {
            _main += "   jl " + label_ + "\n";
        }

        void jle(const string& label_)
        {
            _main += "   jle " + label_ + "\n";
        }

        void jg(const string& label_)
        {
            _main += "   jg " + label_ + "\n";
        }

        void jge(const string& label_)
        {
            _main += "   jge " + label_ + "\n";
        }
    };

}