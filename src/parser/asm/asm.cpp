#include "Asm.h"

stc::Asm::Asm(const std::string& outputFilePath, stc::Ast* tree)
{
    this->m_file.open(outputFilePath);
    this->m_ast = tree;
    this->m_current_place_for_writing = &m_main;

    this->m_byteOnStack = 4;
}

stc::Asm::~Asm()
{
    m_file.close();
}

void stc::Asm::generate()
{
    Log::write("-- Started preparation for code generation\n");

    init_string_constants();
    init_operands_for_division();
    init_local_variables();
    init_global_variables();
    init_function_arguments();
    initGlobalFunctions();

    Log::write("-- Preparation for code generation done\n");

    Log::write("-- Started code generation\n");
    blocksToAsm();

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

    Log::write("-- Code generation done\n");
}

void stc::Asm::init_local_variables()
{
    for (const auto& function : m_ast->m_functions.raw())
    {
        for (const auto& localVariable : function->localVariables())
        {
            if (localVariable->type().isArray())
                continue;

            stack_variable(localVariable);
        }

        m_byteOnStack = 4;
    }

}

void stc::Asm::init_global_variables()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw("\n; Global variable START\n");
    for (const auto& variable: m_ast->m_globalVariables.raw())
    {
        global_variable(variable);
    }

    for (const auto& array: m_ast->m_arrays)
    {
        global_array(array);
    }
    raw("; Global variable END\n\n");
    set_place_for_writing(asm_place_for_writing::MAIN);
}

void stc::Asm::init_function_arguments()
{
    for (const auto& function : m_ast->m_functions.raw())
    {
        m_byteOnStack = 8;

        for (const auto& argument_variable : function->argumentVariables())
        {
            stack_argument(argument_variable);
        }
    }
}

void stc::Asm::blocksToAsm()
{
    blockToAsmRecursive(m_ast->m_root);
}

void stc::Asm::blockToAsmRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::SET)
    {
        Node* op1 = currentNode->operand1;
        Node* op2 = currentNode->operand2;

        if (op1->type == NodeType::USING_VARIABLE ||
            op1->type == NodeType::VARIABLE_DECLARATION ||
            op1->type == NodeType::CONSTANT_DECLARATION)
        {
            auto variableName = any_cast<string>(op1->value);
            auto scopeId = op1->scopeId();
            auto variable = m_ast->m_allVariables.getByNameAndScopeId(variableName, scopeId);
            auto isArray = variable->isArray();

            variableName += to_string(scopeId);


            if (variable->isArray() && !variable->type().is(FundamentalType::SYMBOL, true))
                return;

            expressionToAsmRecursive(op2);

            // pop eax
            pop(eax);

            if (variable->isGlobal())
            {
                // mov variable, eax
                mov(global_var(variableName), eax);
            }
            else if (variable->isArgument())
            {
                // mov arg_variable, eax
                mov(argument_var(variableName), eax);
            }
            else
            {
                // mov variable[ebp], eax
                mov(local_var(variableName), eax);
            }
        }
        else if (op1->type == NodeType::INDEX_CAPTURE)
        {
            auto variableNode = op1->operand1;
            auto indexNode = op1->operand2;

            auto arrayName = any_cast<string>(variableNode->value);
            auto scopeId = variableNode->scopeId();

            auto variable = m_ast->m_allVariables.getByNameAndScopeId(arrayName, scopeId);


            auto arrayType = m_ast->m_allVariables.getByNameAndScopeId(arrayName, scopeId)->type();
            string arrayItemShift = "0";

            arrayName += to_string(scopeId);

            switch (arrayType.fundamentalType())
            {
                case FundamentalType::NUMBER:
                {
                    arrayItemShift = "4";
                    break;
                }
                case FundamentalType::BOOLEAN:
                {
                    arrayItemShift = "1";
                    break;
                }
                case FundamentalType::SYMBOL:
                {
                    arrayItemShift = "1";
                    break;
                }
                case FundamentalType::VOID:
                case FundamentalType::ANY:
                    break;
            }

            expressionToAsmRecursive(op2);
            pop(edx);

            expressionToAsmRecursive(indexNode->operand1);
            pop(ecx);
            imul(ecx, arrayItemShift);


            if (variable->isArgument())
            {
                mov(esi, argument_var(arrayName));
            }
            else
            {
                mov(esi, global_var(arrayName));
            }



            add(esi, ecx);

            mov("[esi]", edx);
        }

        return;
    }
    else if (Node::isComparisonOperator(currentNode->type))
    {
        relation_expression_recursive(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::IF
             || currentNode->type == NodeType::IF_ELSE)
    {
        Node* condition         = currentNode->operand1->operand1;
        Node* statement         = currentNode->operand2;
        Node* else_statement    = currentNode->operand3;

        string start_label_     = "_if_start_" + to_string(statement->scopeId());
        string end_label_       = "_if_end_" + to_string(statement->scopeId());
        string else_label_      = "_if_else_" + to_string(statement->scopeId());


        blockToAsmRecursive(condition);
        pop(eax);
        cmp(eax, null);

        string end_or_else_label = end_label_;
        if (currentNode->type == NodeType::IF_ELSE)
        {
            end_or_else_label = else_label_;
        }


        je(end_or_else_label);



        if (currentNode->type == NodeType::IF_ELSE)
        {
            // label:
            label(start_label_);
            blockToAsmRecursive(statement);

            // jmp label
            jmp(end_label_);

            // label:
            label(else_label_);
            blockToAsmRecursive(else_statement);

            // label:
            label(end_label_);

        }
        else if (currentNode->type == NodeType::IF)
        {
            // label:
            label(start_label_);
            blockToAsmRecursive(statement);

            // label:
            label(end_label_);
        }

        return;
    }
    else if (currentNode->type == NodeType::WHILE)
    {
        Node* condition = currentNode->operand1->operand1;
        Node* statement = currentNode->operand2;

        string start_label_     = "_loop_start_" + std::to_string(statement->scopeId());
        string end_label_       = "_loop_end_" + std::to_string(statement->scopeId());
        string aftereffects_label_       = "_loop_aftereffects_" + std::to_string(statement->scopeId());


        label(start_label_);
        label(aftereffects_label_);


        blockToAsmRecursive(condition);

        pop(eax);
        cmp(eax, null);

        je(end_label_);

        // label:
        blockToAsmRecursive(statement);
        jmp(start_label_);

        // label:
        label(end_label_);

        return;
    }
    else if (currentNode->type == NodeType::DO_WHILE)
    {
        Node* condition = currentNode->operand1->operand1;
        Node* statement = currentNode->operand2;

        string start_label_     = "_loop_start_" + std::to_string(statement->scopeId());
        string end_label_       = "_loop_end_" + std::to_string(statement->scopeId());
        string aftereffects_label_       = "_loop_aftereffects_" + std::to_string(statement->scopeId());


        label(start_label_);
        label(aftereffects_label_);


        // label:
        blockToAsmRecursive(statement);

        blockToAsmRecursive(condition);

        pop(eax);
        cmp(eax, null);

        je(end_label_);

        jmp(start_label_);

        // label:
        label(end_label_);

        return;
    }
    else if (currentNode->type == NodeType::FOR)
    {
        Node* prevention = currentNode->operand1->operand1;
        Node* condition = currentNode->operand2->operand1;
        Node* aftereffects = currentNode->operand3->operand1;
        Node* statement = currentNode->operand4;

        string start_label_     = "_loop_start_" + std::to_string(statement->scopeId());
        string end_label_       = "_loop_end_" + std::to_string(statement->scopeId());
        string aftereffects_label_       = "_loop_aftereffects_" + std::to_string(statement->scopeId());


        blockToAsmRecursive(prevention);
        label(start_label_);

        blockToAsmRecursive(condition);

        pop(eax);
        cmp(eax, null);

        je(end_label_);


        // label:
        blockToAsmRecursive(statement);
        label(aftereffects_label_);
        blockToAsmRecursive(aftereffects);
        jmp(start_label_);

        // label:
        label(end_label_);
        return;
    }
    else if (currentNode->type == NodeType::BREAK)
    {
        auto scopeId = currentNode->scopeId() + 2;
        string labelValue = "_loop_end_" + to_string(scopeId);

        jmp(labelValue);
        return;
    }
    else if (currentNode->type == NodeType::CONTINUE)
    {
        auto scopeId = currentNode->scopeId() + 2;
        string labelValue = "_loop_aftereffects_" + std::to_string(scopeId);

        jmp(labelValue);
        return;
    }

    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);

        functionImplementationRecursive(currentNode);

        set_place_for_writing(asm_place_for_writing::MAIN);

        return;
    }
    else if (currentNode->type == NodeType::RETURN)
    {
        if (currentNode->operand1->operand1 != nullptr)
        {
            expressionToAsmRecursive(currentNode->operand1);
            pop(eax);
        }

        auto arguments_size = any_cast<size_t>(currentNode->value);

        procedure_epilogue();
        ret(to_string(arguments_size));
        return;
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        expressionToAsmRecursive(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::BEFORE_INC ||
             currentNode->type == NodeType::BEFORE_DEC)
    {
        expressionToAsmRecursive(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::NUMBER_CONST ||
             currentNode->type == NodeType::BOOLEAN_CONST ||
             currentNode->type == NodeType::USING_VARIABLE ||
             currentNode->type == NodeType::USING_CONSTANT ||
             currentNode->type == NodeType::INDEX_CAPTURE ||
             currentNode->type == NodeType::UNARY_EXCLAMATION ||
             currentNode->type == NodeType::UNARY_MINUS)
    {
        expressionToAsmRecursive(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        blockToAsmRecursive(currentNode->operand1);
        return;
    }


    blockToAsmRecursive(currentNode->operand1);
    blockToAsmRecursive(currentNode->operand2);
    blockToAsmRecursive(currentNode->operand3);
    blockToAsmRecursive(currentNode->operand4);
}

void stc::Asm::expressionToAsmRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::ADD)
    {
        expressionToAsmRecursive(currentNode->operand1);
        expressionToAsmRecursive(currentNode->operand2);

        // pop eax
        pop(eax);
        // pop ebx
        pop(ebx);
        // add eax, ebx
        add(eax, ebx);
        // push eax
        push(eax);
    }
    else if (currentNode->type == NodeType::SUB)
    {
        expressionToAsmRecursive(currentNode->operand1);
        expressionToAsmRecursive(currentNode->operand2);

        // pop ebx
        pop(ebx);
        // pop eax
        pop(eax);
        // sub eax, ebx
        sub(eax, ebx);
        // push eax
        push(eax);
    }
    else if (currentNode->type == NodeType::MUL)
    {
        expressionToAsmRecursive(currentNode->operand1);
        expressionToAsmRecursive(currentNode->operand2);

        // pop eax
        pop(eax);
        // pop ebx
        pop(ebx);
        // imul eax, ebx
        imul(eax, ebx);
        // push eax
        push(eax);
    }
    else if (currentNode->type == NodeType::DIV)
    {
        expressionToAsmRecursive(currentNode->operand1);
        expressionToAsmRecursive(currentNode->operand2);

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
    else if (currentNode->type == NodeType::UNARY_MINUS)
    {
        expressionToAsmRecursive(currentNode->operand1);

        // pop eax
        pop(eax);
        // imul div, -1
        imul(eax, minus_one);
        // push eax
        push(eax);
    }
    else if (currentNode->type == NodeType::UNARY_EXCLAMATION)
    {
        expressionToAsmRecursive(currentNode->operand1);

        // pop eax
        pop(eax);
        logical_xor(eax, minus_one);
        logical_and(eax, one);
        push(eax);
    }
    else if (currentNode->type == NodeType::AFTER_INC ||
             currentNode->type == NodeType::AFTER_DEC)
    {
        ErrorHandle::raise("Current not supported a++ or a--!");
    }
    else if (currentNode->type == NodeType::BEFORE_INC)
    {
        string variable_name;
        size_t block_id = 0;

        auto value_node = currentNode->operand1;

        if (value_node->type == NodeType::USING_VARIABLE ||
            value_node->type == NodeType::USING_CONSTANT)
        {
            variable_name = any_cast<string>(value_node->value);
            block_id = value_node->scopeId();
            auto variable = m_ast->m_allVariables.getByNameAndScopeId(variable_name, block_id);


            variable_name += to_string(block_id);

            push(variable_name);

            // pop eax
            pop(eax);
            add(eax, one);



            if (variable->isArgument())
            {
                // mov arg_variable, eax
                mov(argument_var(variable_name), eax);
                push(argument_var(variable_name));
            }
            else if (variable->isGlobal() || variable->type().isArray())
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
            block_id = value_node->operand1->scopeId();



            auto number_node = Node(NodeType::NUMBER_CONST, (number)1);
            auto sub_node = Node(NodeType::ADD, "", value_node, &number_node);

            auto set_node = Node(NodeType::SET, "", value_node, &sub_node);

            blockToAsmRecursive(&set_node);
        }

    }
    else if (currentNode->type == NodeType::BEFORE_DEC)
    {
        string variable_name;
        size_t block_id = 0;

        auto value_node = currentNode->operand1;

        if (value_node->type == NodeType::USING_VARIABLE ||
            value_node->type == NodeType::USING_CONSTANT)
        {
            variable_name = any_cast<string>(value_node->value);
            block_id = value_node->scopeId();
            auto variable = m_ast->m_allVariables.getByNameAndScopeId(variable_name, block_id);

            variable_name += to_string(block_id);

            push(variable_name);

            // pop eax
            pop(eax);
            sub(eax, one);


            if (variable->isArgument())
            {
                // mov arg_variable, eax
                mov(argument_var(variable_name), eax);
                push(argument_var(variable_name));
            }
            else if (variable->isGlobal() || variable->type().isArray())
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
            block_id = value_node->operand1->scopeId();



            auto number_node = Node(NodeType::NUMBER_CONST, (number)1);
            auto sub_node = Node(NodeType::SUB, "", value_node, &number_node);

            auto set_node = Node(NodeType::SET, "", value_node, &sub_node);

            blockToAsmRecursive(&set_node);
        }

    }
    else if (currentNode->type == NodeType::NUMBER_CONST)
    {
        // push const
        auto number_value = to_string((int)any_cast<number>(currentNode->value));
        push(number_value);
    }
    else if (currentNode->type == NodeType::BOOLEAN_CONST)
    {
        // push const
        auto number_value = to_string((size_t)any_cast<int>(currentNode->value));
        push(number_value);
    }
    else if (currentNode->type == NodeType::STRING_CONST)
    {
        // push const
        auto scopeId = currentNode->scopeId();
        auto string_access = "string_const_" + to_string(scopeId);
        push(offset(string_access));
    }
    else if (currentNode->type == NodeType::USING_VARIABLE ||
             currentNode->type == NodeType::USING_CONSTANT)
    {
        auto variableName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->scopeId();
        auto variable = m_ast->m_allVariables.getByNameAndScopeId(variableName, scopeId);

        variableName += to_string(scopeId);

        if (variable->isArgument())
        {
            push(argument_var(variableName));
        }
        else if (variable->isGlobal() || variable->type().isArray())
        {
            push(variableName);
        }
        else
        {
            push(local_var(variableName));
        }

    }
    else if (Node::isComparisonOperator(currentNode->type))
    {
        relation_expression_recursive(currentNode);
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        auto functionName = any_cast<string>(currentNode->value);

        raw("\n");
        comment("init stack for " + functionName);

        initArgumentsOnStackRecursive(currentNode->operand1);

        vector<Type> types;
        m_ast->identifyFunctionCallArgumentsRecursive(currentNode->operand1, types);


        Function* function = nullptr;

        if (GlobalFunctions::contains(functionName))
        {
            function = GlobalFunctions::get(functionName, types);
        }
        else
        {
            function = m_ast->m_functions.get(functionName, types);
        }


        auto functionReturnVoid = function->returnType().is(FundamentalType::VOID);


        comment("call " + functionName);
        call(functionName);
        raw("\n");

        if (!functionReturnVoid)
        {
            push(eax);
        }

        return;
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        auto op1 = currentNode->operand1;
        auto op2 = currentNode->operand2;

        auto arrayName = any_cast<string>(op1->value);
        auto scopeId = op1->scopeId();

        auto variable = m_ast->m_allVariables.getByNameAndScopeId(arrayName, scopeId);
        auto arrayType = variable->type();

        string arrayItemShift;


        arrayName += to_string(scopeId);

        switch (arrayType.fundamentalType())
        {
            case FundamentalType::NUMBER:
            {
                arrayItemShift = "4";
                break;
            }
            case FundamentalType::BOOLEAN:
            {
                arrayItemShift = "1";
                break;
            }
            case FundamentalType::SYMBOL:
            {
                arrayItemShift = "4";
                break;
            }
            case FundamentalType::VOID:
            case FundamentalType::ANY:
                break;
        }

        expressionToAsmRecursive(op2->operand1);
        pop(edx);
        imul(edx, arrayItemShift);



        if (variable->isArgument())
        {
            mov(esi, argument_var(arrayName));
        }
        else if (variable->isGlobal() || variable->type().isArray())
        {
            mov(esi, global_var(arrayName));
        }
        else
        {
            mov(esi, local_var(arrayName));
        }

        push("[esi[edx]]");
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        expressionToAsmRecursive(currentNode->operand1);
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
        auto block_id = current_node->scopeId();
        auto variable = m_ast->m_allVariables.getByNameAndScopeId(variable_name, block_id);

        variable_name += to_string(block_id);




        if (variable->isArgument())
        {
            cmp(argument_var(variable_name), null);
        }
        else if (variable->isGlobal() || variable->type().isArray())
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

        expressionToAsmRecursive(op1);
        pop(ecx);
        expressionToAsmRecursive(op2);
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

void stc::Asm::functionImplementationRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    // if function body is empty
    if (currentNode->operand3->type == NodeType::EXPRESSION)
        return;

    auto functionName = any_cast<string>(currentNode->value);

    if (GlobalFunctions::contains(functionName))
        return;

    vector<Type> types;
    vector<Variable*> variables;
    m_ast->identifyFunctionArgumentsRecursive(currentNode->operand2, types, variables);

    vector<Type> typesTemp;

    for (int i = types.size() - 1; i >= 0; --i)
    {
        typesTemp.push_back(types[i]);
    }

    auto function = m_ast->m_functions.get(functionName, typesTemp);
    auto localVariableSize = function->localVariableSize();

    proc(functionName);
    procedure_prolog(0, localVariableSize);



    auto stackSize = function->argumentsSize();


    blockToAsmRecursive(currentNode->operand3);

    procedure_epilogue();
    ret(to_string(stackSize));
    endp(functionName);

}

void stc::Asm::initArgumentsOnStackRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_ARGS)
    {
        expressionToAsmRecursive(currentNode->operand1);
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        return;
    }

    initArgumentsOnStackRecursive(currentNode->operand1);
    initArgumentsOnStackRecursive(currentNode->operand2);
    initArgumentsOnStackRecursive(currentNode->operand3);
    initArgumentsOnStackRecursive(currentNode->operand4);
}

void stc::Asm::initGlobalFunctions()
{
    initGlobalFunctionsRecursive(m_ast->m_root);
}

void stc::Asm::initGlobalFunctionsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        auto functionName = any_cast<string>(currentNode->value);

        initGlobalFunction(functionName);
    }

    initGlobalFunctionsRecursive(currentNode->operand1);
    initGlobalFunctionsRecursive(currentNode->operand2);
    initGlobalFunctionsRecursive(currentNode->operand3);
    initGlobalFunctionsRecursive(currentNode->operand4);
}


void stc::Asm::init_input_function()
{
    set_place_for_writing(asm_place_for_writing::DATA);
    raw(tab + "input_format db \"%d\", 0\n");
    raw(tab + "input_result dd 0\n");
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);

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
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);

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
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);

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
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);

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


void stc::Asm::init_concat_function()
{
    set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);
    raw("concat PROC\n"
        "   enter 32, 0\n"
        "\n"
        "   mov ecx, [ebp + 8] ; указатель на первую строку\n"
        "   mov edx, [ebp + 12] ; указатель на вторую строку\n"
        "\n"
        "   push [ebp + 8]\n"
        "   call crt_strlen\n"
        "   push eax ; узнаем длину первой строки и помещаем ее в стек\n"
        "\n"
        "\n"
        "   push [ebp + 12]\n"
        "   call crt_strlen\n"
        "   push eax ; узнаем длину второй строки и помещаем ее в стек\n"
        "\n"
        "\n"
        "   pop ecx\n"
        "   pop edx\n"
        "   add ecx, edx ; узнаем общую длину строк\n"
        "   add ecx, 1 ; добавляем место под нуль-терминатор\n"
        "   push ecx\n"
        "\n"
        "\n"
        "   call crt_calloc ; выделяем память под строку\n"
        "   push eax ; сохраняем указатель на память в стеке\n"
        "\n"
        "\n"
        "   pop eax\n"
        "   push [ebp + 8] ; указатель на строку, которая копируется (1 строка)\n"
        "   push eax ; указатель на начало выделенной памяти\n"
        "   call crt_strcat ; копируем\n"
        "   push eax\n"
        "\n"
        "   pop eax\n"
        "   push [ebp + 12] ; указатель на строку, которая копируется (2 строка)\n"
        "   push eax ; указатель на начало выделенной памяти\n"
        "   call crt_strcat ; копируем\n"
        "   push eax\n"
        "   pop eax\n"
        "\n"
        "   ; теперь в ecx лежит строка содержащая объединенные две входные строки\n"
        "\n"
        "\n"
        "   leave\n"
        "   ret 8\n"
        "concat ENDP\n");

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
        case asm_place_for_writing::FUNCTION_IMPLEMENTATIONS:
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

void stc::Asm::stack_variable(const Variable* variable)
{
    auto variableName = variable->nameWithPostfix();
    auto variableSize = variable->type().size();

    m_before_main.append(variableName + " = " + "-" + to_string(m_byteOnStack) + " ; size = " + to_string(variableSize) + "\n");

    m_byteOnStack += variableSize;
}

void stc::Asm::stack_argument(const stc::Variable* variable)
{
    auto variableName = variable->nameWithPostfix();
    auto variableSize = variable->type().size();

    string prefix;

    if (variable->isArgument())
    {
        prefix = "arg_";
    }

    m_before_main.append(prefix + variableName + " = " + to_string(m_byteOnStack) + " ; size = " + to_string(variableSize) + "\n");

    m_byteOnStack += variableSize;
}

void stc::Asm::global_variable(const stc::Variable* variable)
{
    string variableTypeString;
    string variableValueString;

    auto varialeName = variable->nameWithPostfix();
    auto variableType = variable->type();

    if (variableType.is(FundamentalType::SYMBOL, true))
    {
        m_data.append(tab + varialeName + " dd 0 ; pointer to string\n");
        return;
    }

    switch (variable->type().fundamentalType())
    {
        case FundamentalType::NUMBER:
        {
            variableTypeString = "dd";
            variableValueString = "0";
            break;
        }
        case FundamentalType::BOOLEAN:
        {
            variableTypeString = "dd";
            variableValueString = "0";
            break;
        }
        case FundamentalType::SYMBOL:
        {
            if (variableType.isArray())
            {
                variableTypeString = "db";
                variableValueString = "\" \",0";
            }
            break;
        }
        case FundamentalType::VOID:
        case FundamentalType::ANY:
            break;
    }

    m_data.append(tab + varialeName + " " +
                  variableTypeString + " " + variableValueString + "\n");
}

void stc::Asm::global_array(const stc::Array& array)
{
    auto variable = array.variable();
    auto arrayType = variable->type();
    auto arrayName = variable->nameWithPostfix();

    if (arrayType.is(FundamentalType::SYMBOL, true))
        return;


    auto arraySize = array.size();
    const auto& arrayValues = array.values();



    string arrayTypeString;
    string arrayValuesString;

    switch (arrayType.fundamentalType())
    {
        case FundamentalType::NUMBER:
        {
            arrayTypeString = "dd";

            if (arrayValues.empty())
            {
                arrayValuesString = to_string(arraySize) + " dup (0)";
            }
            else
            {
                arrayValuesString = array.valuesToString();
            }
            break;
        }
        case FundamentalType::BOOLEAN:
        {
            arrayTypeString = "dd";

            if (arrayValues.empty())
            {
                arrayValuesString = to_string(arraySize) + " dup (0)";
            }
            else
            {
                arrayValuesString = array.valuesToString();
            }
            break;
        }
        case FundamentalType::SYMBOL:
        {
            arrayTypeString = "db";

            if (arrayValues.empty())
            {
                arrayTypeString = "dd";
                arrayValuesString = to_string(arraySize) + " dup (0)";
            }
            else
            {
                arrayValuesString = array.valuesToString();
            }
            break;
        }

        case FundamentalType::VOID:
        case FundamentalType::ANY:
            break;
    }


    m_data.append(tab + arrayName + "_arr" + " " + arrayTypeString + " " + arrayValuesString + "\n");
    m_data.append(tab + arrayName + " " + arrayTypeString + " offset " + arrayName + "_arr" + "\n");

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
        current_node->scopeId(count_constant);

        string temp;
        vector<string> strings;

        value.pop_back();
        value.erase(value.begin());

        for (int i = 0; i < value.size(); ++i)
        {
            if (i + 1 < value.size() && value[i] == '\\' && value[i + 1] == 'n')
            {
                if (!temp.empty())
                {
                    strings.push_back(temp);
                    temp.clear();
                }


                temp += "13,10";
                strings.push_back(temp);
                temp.clear();
                ++i;
            }
            else
            {
                temp += value[i];
            }
        }

        if (!temp.empty())
        {
            strings.push_back(temp);
            temp.clear();
        }

        auto changedString = string();
        for (const auto& item : strings)
        {
            if (item == "13,10")
            {
                changedString += item + ",";
            }
            else
            {
                changedString += "\"" + item + "\",";
            }
        }
        changedString.erase(changedString.end() - 1);


        m_data += "   string_const_" + std::to_string(count_constant) + " db " + changedString + ",0\n";

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

void stc::Asm::initGlobalFunction(const std::string& name)
{
    if (name == "input")
    {
        init_input_function();
    }
    else if (name == "print")
    {
        init_print_function();
    }
    else if (name == "println")
    {
        init_println_function();
    }
    else if (name == "sqrt")
    {
        init_sqrt_function();
    }
    else if (name == "concat")
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);
        raw("concat PROC\n"
            "   enter 32, 0\n"
            "\n"
            "   mov ecx, [ebp + 8] ; указатель на первую строку\n"
            "   mov edx, [ebp + 12] ; указатель на вторую строку\n"
            "\n"
            "   push [ebp + 8]\n"
            "   call crt_strlen\n"
            "   push eax ; узнаем длину первой строки и помещаем ее в стек\n"
            "\n"
            "\n"
            "   push [ebp + 12]\n"
            "   call crt_strlen\n"
            "   push eax ; узнаем длину второй строки и помещаем ее в стек\n"
            "\n"
            "\n"
            "   pop ecx\n"
            "   pop edx\n"
            "   add ecx, edx ; узнаем общую длину строк\n"
            "   add ecx, 1 ; добавляем место под нуль-терминатор\n"
            "   push ecx\n"
            "\n"
            "\n"
            "   call crt_calloc ; выделяем память под строку\n"
            "   push eax ; сохраняем указатель на память в стеке\n"
            "\n"
            "\n"
            "   pop eax\n"
            "   push [ebp + 8] ; указатель на строку, которая копируется (1 строка)\n"
            "   push eax ; указатель на начало выделенной памяти\n"
            "   call crt_strcat ; копируем\n"
            "   push eax\n"
            "\n"
            "   pop eax\n"
            "   push [ebp + 12] ; указатель на строку, которая копируется (2 строка)\n"
            "   push eax ; указатель на начало выделенной памяти\n"
            "   call crt_strcat ; копируем\n"
            "   push eax\n"
            "   pop eax\n"
            "\n"
            "   ; теперь в ecx лежит строка содержащая объединенные две входные строки\n"
            "\n"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "concat ENDP\n");

        set_place_for_writing(asm_place_for_writing::MAIN);
    }
    else if (name == "slice")
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);
        raw("slice PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   cmp DWORD PTR [ebp + 8], 0\n"
            "   je _error_end ; передан нулевой указатель\n"
            "\n"
            "   push [ebp + 8]\n"
            "   call crt_strlen\n"
            "   mov edx, eax ; в edx теперь хранится длина строки\n"
            "\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   mov ebx, DWORD PTR [ebp + 16]\n"
            "   cmp eax, ebx\n"
            "   jg _swap_start_and_end\n"
            "   jl _no_swap_start_and_end\n"
            "\n"
            "_swap_start_and_end:\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   mov ebx, DWORD PTR [ebp + 16]\n"
            "   \n"
            "   mov DWORD PTR [ebp + 12], ebx\n"
            "   mov DWORD PTR [ebp + 16], eax\n"
            "\n"
            "\n"
            "_no_swap_start_and_end:\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   cmp eax, 0\n"
            "   jl _error_end ; если начало меньше ноля\n"
            "\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   cmp eax, edx\n"
            "   jg _error_end ; если начало больше или равен длине строки\n"
            "\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   cmp eax, 0\n"
            "   jl _error_end ; если конец меньше ноля\n"
            "\n"
            "   cmp [ebp + 16], edx\n"
            "   jg _error_end ; если конец больше или равен длине строки\n"
            "\n"
            "   push edx\n"
            "\n"
            "   mov ebx, [ebp + 16]\n"
            "   sub ebx, [ebp + 12] ; находим длину среза\n"
            "   add ebx, 1 ; добавляем место для нуля-терминатора\n"
            "\n"
            "   push ebx\n"
            "\n"
            "   push ebx\n"
            "   call crt_calloc ; выделяем память под срех\n"
            "   push eax ; сохраняем указатель на память в стеке\n"
            "   \n"
            "   pop ecx ; указатель на память\n"
            "   pop ebx ; длина среза\n"
            "   \n"
            " \n"
            "   mov edx, DWORD PTR [ebp + 8]\n"
            "   add edx, DWORD PTR [ebp + 12]\n"
            "   sub edx, 1 ; вычитаем 1, чтобы начать с нужного символа\n"
            "\n"
            "   push ebx\n"
            "   push edx\n"
            "   push ecx\n"
            "   call crt_strncpy\n"
            "   push eax\n"
            "\n"
            "\n"
            "   add eax, ebx\n"
            "   mov DWORD PTR [eax], 0\n"
            "   pop eax\n"
            "\n"
            "   leave\n"
            "   ret 12\n"
            "\n"
            "_error_end:\n"
            "   mov eax, 0\n"
            "\n"
            "   leave\n"
            "   ret 12\n"
            "slice ENDP\n");
        set_place_for_writing(asm_place_for_writing::MAIN);
    }
    else if (name == "strlen")
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);
        raw("strlen PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push DWORD PTR [ebp + 8]\n"
            "   call crt_strlen\n"
            "   \n"
            "   leave\n"
            "   ret 8\n"
            "strlen ENDP\n");
        set_place_for_writing(asm_place_for_writing::MAIN);
    }
    else if (name == "at")
    {
        set_place_for_writing(asm_place_for_writing::FUNCTION_IMPLEMENTATIONS);
        raw("at PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   cmp DWORD PTR [ebp + 8], 0\n"
            "   je _error_end ; передан нулевой указатель\n"
            "\n"
            "   push DWORD PTR [ebp + 8]\n"
            "   call crt_strlen\n"
            "   mov edx, eax ; в edx теперь хранится длина строки\n"
            "\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   cmp eax, 0\n"
            "   jl _error_end ; если индекс меньше ноля\n"
            "\n"
            "   mov eax, DWORD PTR [ebp + 12]\n"
            "   cmp eax, edx\n"
            "   jge _error_end ; если индекс больше или равен длине строки\n"
            "   \n"
            "\n"
            "   push 2\n"
            "   call crt_calloc ; выделяем память под символ с нулем терминатором\n"
            "   push eax ; сохраняем указатель на память в стеке\n"
            "\n"
            "\n"
            "   mov edx, DWORD PTR [ebp + 8]\n"
            "   add edx, DWORD PTR [ebp + 12]\n"
            "\n"
            "   mov ecx, DWORD PTR [edx]\n"
            "   mov DWORD PTR [eax], ecx\n"
            "\n"
            "\n"
            "   push eax\n"
            "\n"
            "   mov ebx, 0\n"
            "   add eax, 1\n"
            "   mov DWORD PTR [eax], ebx\n"
            "\n"
            "   pop eax\n"
            "\n"
            "   pop ecx\n"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "\n"
            "_error_end:\n"
            "   mov eax, 0\n"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "\n"
            "at ENDP\n");
        set_place_for_writing(asm_place_for_writing::MAIN);
    }
}

