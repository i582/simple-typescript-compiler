#include "Asm.h"

stc::Asm::Asm(const string& outputFilePath, stc::Ast* tree)
{
    this->m_file.open(outputFilePath);
    this->m_ast = tree;
    this->m_currentPlaceForWriting = &m_main;

    this->m_byteOnStack = 4;
}

void stc::Asm::generate()
{
    Log::write("-- Started preparation for code generation\n");

    initMemoryManager();

    initStringConstants();
    initOperandsForDivision();
    initLocalVariables();
    initGlobalVariables();

    initFunctionArguments();
    initGlobalFunctions();

    initInterfaces();

    Log::write("-- Preparation for code generation done\n");

    Log::write("-- Started code generation\n");
    blocksToAsm();

    freeMemoryManager();

    write(asm_header);

    write(start_data);
    write(m_data);
    write(end_data);


    write(text_start);
    write(m_beforeMain);
    write(m_functionImplementations);


    write(label_start);
    write(proc_prolog + to_string(m_ast->m_allVariables.raw().size() * 4 + 4) + ", 0");


    write(m_main);
    write(proc_epilogue);

    write(program_exit);

    write(function_return);



    write(text_end);
    write(label_end);

    Log::write("-- Code generation done\n");

    m_file.close();
}

void stc::Asm::initLocalVariables()
{
    m_byteOnStack = 8;

    for (const auto& variable : m_ast->m_allVariables.raw())
    {
        if (variable->isGlobal())
        {
            stackVariable(variable);
        }
    }

    m_byteOnStack = 4;

    for (const auto& function : m_ast->m_functions.raw())
    {
        for (const auto& localVariable : function->localVariables())
        {
            stackVariable(localVariable);
        }

        m_byteOnStack = 4;
    }

}

void stc::Asm::initGlobalVariables()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw("\n; Global variable START\n");

    for (const auto& array: m_ast->m_arrays)
    {
        globalArray(array);
    }

    raw("; Global variable END\n\n");
    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}

void stc::Asm::initFunctionArguments()
{
    for (const auto& function : m_ast->m_functions.raw())
    {
        m_byteOnStack = 8;

        for (const auto& argumentVariable : function->argumentVariables())
        {
            stackArgument(argumentVariable);
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
        setBlockToAsm(currentNode);
        return;
    }
    else if (currentNode->isComparisonOperator())
    {
        relationExpressionToAsmRecursive(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::IF || currentNode->type == NodeType::IF_ELSE)
    {
        ifBlockToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::WHILE)
    {
        whileBlockToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::DO_WHILE)
    {
        doWhileBlockToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::FOR)
    {
        forBlockToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::BREAK)
    {
        breakOperatorToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::CONTINUE)
    {
        continueOperatorToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        functionImplementationToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::RETURN)
    {
        returnOperatorToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        functionCallToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::INITIALIZER)
    {
        initializerToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::STATEMENT || currentNode->type == NodeType::PROGRAM)
    {
        blockToAsmRecursive(currentNode->operand1);
        return;
    }
    else if (currentNode->type == NodeType::STATEMENT_LIST)
    {
        blockToAsmRecursive(currentNode->operand1);
        blockToAsmRecursive(currentNode->operand2);
        return;
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        blockToAsmRecursive(currentNode->operand1);
    }
    else
    {
        expressionToAsmRecursive(currentNode);
        return;
    }
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
    else if (currentNode->type == NodeType::NUMBER_CONST)
    {
        // push const
        const auto numberValue = to_string((int) any_cast<number>(currentNode->value));
        push(numberValue);
    }
    else if (currentNode->type == NodeType::BOOLEAN_CONST)
    {
        // push const
        const auto booleanValue = to_string((size_t) any_cast<int>(currentNode->value));
        push(booleanValue);
    }
    else if (currentNode->type == NodeType::STRING_CONST)
    {
        // push const
        const auto scopeId = currentNode->scopeId();
        const auto stringAccess = "string_const_" + to_string(scopeId);
        push(offset(stringAccess));
    }
    else if (currentNode->type == NodeType::USING_VARIABLE ||
             currentNode->type == NodeType::USING_CONSTANT)
    {
        const auto variable = any_cast<Variable*>(currentNode->value);
        const auto variableName = variable->nameWithPostfix();

        if (variable->isArgument())
        {
            push(argument_var(variableName));
        }
        else
        {
            push(local_var(variableName));
        }
    }
    else if (Node::isComparisonOperator(currentNode->type))
    {
        relationExpressionToAsmRecursive(currentNode);
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        functionCallToAsm(currentNode);
        return;
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        expressionToAsmRecursive(currentNode->operand1);
    }
    else if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto aClass = any_cast<Class*>(currentNode->value);

        initClassFunctionOrField(currentNode->operand2, aClass);
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        const auto type = m_ast->checkAndGiveExpressionType(currentNode->operand1);


        expressionToAsmRecursive(currentNode->operand1);
        pop(eax);

        mov(edi, eax);

        expressionToAsmRecursive(currentNode->operand2);
        pop(ebx);



        imul(ebx, "4");

        add(edi, ebx);
        push("DWORD PTR [edi]");
    }
}

void stc::Asm::relationExpressionToAsmRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::NUMBER_CONST)
    {
        const auto value = (int) any_cast<number>(currentNode->value);

        if (value == 0)
        {
            push(null);
        }
        else
        {
            push(one);
        }
    }
    else if (currentNode->type == NodeType::BOOLEAN_CONST)
    {
        const auto value = any_cast<int>(currentNode->value);

        if (value == 0)
        {
            push(null);
        }
        else
        {
            push(one);
        }
    }
    else if (currentNode->type == NodeType::USING_VARIABLE ||
             currentNode->type == NodeType::USING_CONSTANT)
    {
        const auto currentTime = std::chrono::duration_cast<std::chrono::nanoseconds>(
                std::chrono::high_resolution_clock::now().time_since_epoch());

        const auto labelIfEqual = "_compare_equal" + to_string(currentTime.count());
        const auto labelIfNotEqual = "_compare_not_equal" + to_string(currentTime.count());
        const auto labelCompareEnd = "_compare_end" + to_string(currentTime.count());

        const auto variable = any_cast<Variable*>(currentNode->value);
        const auto variableName = variable->nameWithPostfix();


        if (variable->isArgument())
        {
            cmp(argument_var(variableName), null);
        }
        else
        {
            cmp(local_var(variableName), null);
        }


        // jne (!=) label
        jne(labelIfNotEqual);
        push(null);
        jmp(labelCompareEnd);

        label(labelIfNotEqual);
        push(one);

        label(labelCompareEnd);

    }
    else if (currentNode->type == NodeType::LOGICAL_AND)
    {
        const auto op1 = currentNode->operand1;
        const auto op2 = currentNode->operand2;

        relationExpressionToAsmRecursive(op1);
        pop(eax);
        relationExpressionToAsmRecursive(op2);
        pop(ebx);

        logical_and(eax, ebx);
        push(eax);
    }
    else if (currentNode->type == NodeType::LOGICAL_OR)
    {
        const auto op1 = currentNode->operand1;
        const auto op2 = currentNode->operand2;

        relationExpressionToAsmRecursive(op1);
        pop(eax);
        relationExpressionToAsmRecursive(op2);
        pop(ebx);

        logical_or(eax, ebx);
        push(eax);
    }
    else if (currentNode->type == NodeType::UNARY_EXCLAMATION)
    {
        relationExpressionToAsmRecursive(currentNode->operand1->operand1);


        // pop eax
        pop(eax);
        logical_xor(eax, minus_one);
        logical_and(eax, one);
        push(eax);
    }
    else if (currentNode->type == NodeType::EXPRESSION)
    {
        relationExpressionToAsmRecursive(currentNode->operand1);
        return;
    }
    else
    {
        const auto currentTime = std::chrono::duration_cast<std::chrono::nanoseconds>(
                std::chrono::high_resolution_clock::now().time_since_epoch());

        const auto op1 = currentNode->operand1;
        const auto op2 = currentNode->operand2;

        expressionToAsmRecursive(op1);
        pop(ecx);
        expressionToAsmRecursive(op2);
        pop(edx);

        // cmp ecx, edx
        cmp(ecx, edx);

        const auto labelIfEqual = "_compare_equal" + to_string(currentTime.count());
        const auto labelIfNotEqual = "_compare_not_equal" + to_string(currentTime.count());
        const auto labelCompareEnd = "_compare_end" + to_string(currentTime.count());


        if (currentNode->type == NodeType::LESS)
        {
            // jge (>=) label
            jge(labelIfNotEqual);
            push(one);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(null);

            label(labelCompareEnd);
        }
        else if (currentNode->type == NodeType::LESS_EQUAL)
        {
            // jg (>) label
            jg(labelIfNotEqual);
            push(one);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(null);

            label(labelCompareEnd);
        }
        else if (currentNode->type == NodeType::GREATER)
        {
            // jle (<=) label
            jle(labelIfNotEqual);
            push(one);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(null);

            label(labelCompareEnd);
        }
        else if (currentNode->type == NodeType::GREATER_EQUAL)
        {
            // jl (<) label
            jl(labelIfNotEqual);
            push(one);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(null);

            label(labelCompareEnd);
        }
        else if (currentNode->type == NodeType::EQUAL)
        {
            // jne (!=) label
            jne(labelIfNotEqual);
            push(one);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(null);

            label(labelCompareEnd);
        }
        else if (currentNode->type == NodeType::NOT_EQUAL)
        {
            // je (==) label
            je(labelIfNotEqual);
            push(null);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(one);

            label(labelCompareEnd);
        }

        return;
    }
}

void stc::Asm::functionImplementationRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    // if function body is empty or is declaration
    if (currentNode->operand3->type == NodeType::STATEMENT &&
        currentNode->operand3->operand1 == nullptr)
        return;

    const auto function = any_cast<Function*>(currentNode->value);
    const auto functionName = function->name();
    const auto functionLocalVariableSize = function->localVariableSize();


    proc(functionName);
    procedure_prolog(0, functionLocalVariableSize);

    const auto stackSize = function->argumentsSize();

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
        blockToAsmRecursive(currentNode->operand1);

        initArgumentsOnStackRecursive(currentNode->operand2);
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
        const auto& function = any_cast<Function*>(currentNode->value);
        const auto& functionName = function->name();

        initGlobalFunction(functionName);
    }

    initGlobalFunctionsRecursive(currentNode->operand1);
    initGlobalFunctionsRecursive(currentNode->operand2);
    initGlobalFunctionsRecursive(currentNode->operand3);
    initGlobalFunctionsRecursive(currentNode->operand4);
}


void stc::Asm::initInputFunction()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + "input_format db \"%d\", 0\n");
    raw(tab + "input_result dd 0\n");
    setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);

    proc("input");
    procedure_prolog(16, 0);


    push(ebx);
    push(ecx);
    push(edx);

    raw(tab + "invoke crt_scanf, offset input_format, offset input_result\n");
    mov(eax, "input_result");


    pop(ebx);
    pop(ecx);
    pop(edx);

    procedure_epilogue();
    ret();
    endp("input");

    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}

void stc::Asm::initPrintFunction()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + "print_format db \"%d \", 0\n");
    setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);

    proc("print");
    procedure_prolog(4, 0);

    push(eax);

    mov(eax, "[ebp + 8]");
    raw(tab + "invoke crt_printf, offset print_format, eax\n");

    pop(eax);

    procedure_epilogue();
    ret("4");
    endp("print");

    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}

void stc::Asm::initPrintlnFunction()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + "println_format db \"%s\", 0\n");
    setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);

    proc("println");
    procedure_prolog(0, 0);

    push(eax);
    push(ebx);
    push(ecx);
    push(edx);

    mov(eax, "[ebp + 8]");
    raw(tab + "invoke crt_printf, offset println_format, eax\n");

    pop(eax);
    pop(ebx);
    pop(ecx);
    pop(edx);

    procedure_epilogue();
    ret("4");
    endp("println");

    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}

void stc::Asm::initSqrtFunction()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + "sqrt_result dd 0\n");
    setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);

    proc("sqrt");
    procedure_prolog(0, 0);


    push(ebx);
    push(ecx);
    push(edx);

    mov(eax, "[ebp + 8]");
    mov("sqrt_result", eax);
    finit();
    fild("sqrt_result");
    fsqrt();
    fist("sqrt_result");
    mov(eax, "sqrt_result");

    pop(ebx);
    pop(ecx);
    pop(edx);


    procedure_epilogue();
    ret("4");
    endp("sqrt");

    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}


void stc::Asm::initOperandsForDivision()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + "div_operand_1 dd 0\n");
    raw(tab + "div_operand_2 dd 0\n");
    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}

void stc::Asm::setPlaceForWriting(stc::AsmPlaceForWriting place)
{
    switch (place)
    {
        case AsmPlaceForWriting::DATA:
        {
            m_currentPlaceForWriting = &m_data;
            break;
        }
        case AsmPlaceForWriting::BEFORE_MAIN:
        {
            m_currentPlaceForWriting = &m_beforeMain;
            break;
        }
        case AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS:
        {
            m_currentPlaceForWriting = &m_functionImplementations;
            break;
        }
        case AsmPlaceForWriting::MAIN:
        {
            m_currentPlaceForWriting = &m_main;
            break;
        }
    }
}

void stc::Asm::push(const string& value)
{
    m_currentPlaceForWriting->append(tab + "push " + value + "\n");
}

void stc::Asm::pop(const string& value)
{
    m_currentPlaceForWriting->append(tab + "pop " + value + "\n");
}

void stc::Asm::add(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "add " + value1 + ", " + value2 + "\n");
}

void stc::Asm::sub(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "sub " + value1 + ", " + value2 + "\n");
}

void stc::Asm::imul(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "imul " + value1 + ", " + value2 + "\n");
}

void stc::Asm::mov(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "mov " + value1 + ", " + value2 + "\n");
}

stc::string stc::Asm::offset(const string& value)
{
    return "offset " + value;
}

stc::string stc::Asm::local_var(const string& value)
{
    return value + "[ebp]";
}

stc::string stc::Asm::argument_var(const string& value)
{
    return "arg_" + value + "[ebp]";
}

void stc::Asm::raw(const string& value)
{
    m_currentPlaceForWriting->append(value);
}

void stc::Asm::stackVariable(const Variable* variable)
{
    const auto variableName = variable->nameWithPostfix();
    const auto variableSize = variable->type().size();

    m_beforeMain.append(
            variableName + " = " + "-" + to_string(m_byteOnStack) + " ; size = " + to_string(variableSize) + "\n");

    m_byteOnStack += variableSize;
}

void stc::Asm::stackArgument(const stc::Variable* variable)
{
    const auto variableName = variable->nameWithPostfix();
    const auto variableSize = variable->type().size();

    string prefix;

    if (variable->isArgument())
    {
        prefix = "arg_";
    }

    m_beforeMain.append(
            prefix + variableName + " = " + to_string(m_byteOnStack) + " ; size = " + to_string(variableSize) + "\n");

    m_byteOnStack += variableSize;
}

void stc::Asm::globalArray(const stc::Array& array)
{
    const auto variable = array.variable();
    const auto arrayType = variable->type();
    const auto arrayName = variable->nameWithPostfix();

    if (arrayType.is(FundamentalType::Symbol, true))
        return;


    const auto arraySize = array.size();
    const auto& arrayValues = array.values();


    string arrayTypeString;
    string arrayValuesString;


    setPlaceForWriting(AsmPlaceForWriting::MAIN);


    switch (arrayType.fundamentalType())
    {
        case FundamentalType::Number:
        {
            if (arraySize > 0)
            {
                raw(tab + "push eax\n");
                raw(tab + "push ebx\n");
                raw(tab + "push " + to_string(arraySize * 4) + "\n");
                raw(tab + "call crt_malloc\n");
                raw(tab + "mov " + arrayName + "__array_pointer" + ", eax\n");
            }

            arrayTypeString = "dd";

            if (!arrayValues.empty())
            {
                raw(tab + "mov ebx, eax\n");

                auto values = array.values();
                for (int i = values.size() - 1; i >= 0; --i)
                {
                    const auto& value = values[i];

                    auto rawValue = (int) std::get<number>(value);

                    raw(tab + "mov DWORD PTR [ebx], " + to_string(rawValue) + "\n");

                    if (i != 0)
                        raw(tab + "add ebx, 4\n");
                }

                arrayValuesString = array.valuesToString();
            }

            if (arraySize > 0)
            {
                raw(tab + "pop eax\n");
                raw(tab + "pop ebx\n");
                raw(tab + "push " + arrayName + "__array_pointer" + "\n");
            }
            break;
        }

        case FundamentalType::Boolean:
        {
            if (arraySize > 0)
            {
                raw(tab + "push eax\n");
                raw(tab + "push ebx\n");
                raw(tab + "push " + to_string(arraySize * 4) + "\n");
                raw(tab + "call crt_malloc\n");
                raw(tab + "mov " + arrayName + "__array_pointer" + ", eax\n");
            }

            arrayTypeString = "dd";

            if (!arrayValues.empty())
            {
                raw(tab + "mov ebx, eax\n");

                auto values = array.values();
                for (int i = values.size() - 1; i >= 0; --i)
                {
                    const auto& value = values[i];

                    auto rawValue = (int)std::get<bool>(value);

                    raw(tab + "mov DWORD PTR [ebx], " + to_string(rawValue) + "\n");

                    if (i != 0)
                        raw(tab + "add ebx, 4\n");
                }

                arrayValuesString = array.valuesToString();
            }

            if (arraySize > 0)
            {
                raw(tab + "pop eax\n");
                raw(tab + "pop ebx\n");
                raw(tab + "push " + arrayName + "__array_pointer" + "\n");
            }
            break;
        }
        case FundamentalType::Symbol:
        case FundamentalType::Void:
        case FundamentalType::Any:
            break;
    }

    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + arrayName + "__array_pointer dd 0\n");
    raw(tab + arrayName + "_len dd " + to_string(arraySize) + "\n");
    setPlaceForWriting(AsmPlaceForWriting::DATA);
}

void stc::Asm::logical_or(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "or " + value1 + ", " + value2 + "\n");
}

void stc::Asm::logical_and(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "and " + value1 + ", " + value2 + "\n");
}

void stc::Asm::logical_xor(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "xor " + value1 + ", " + value2 + "\n");
}

void stc::Asm::cmp(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "cmp " + value1 + ", " + value2 + "\n");
}

void stc::Asm::jmp(const string& value)
{
    m_currentPlaceForWriting->append(tab + "jmp " + value + "\n");
}

void stc::Asm::je(const string& value)
{
    m_currentPlaceForWriting->append(tab + "je " + value + "\n");
}

void stc::Asm::jne(const string& value)
{
    m_currentPlaceForWriting->append(tab + "jne " + value + "\n");
}

void stc::Asm::jl(const string& value)
{
    m_currentPlaceForWriting->append(tab + "jl " + value + "\n");
}

void stc::Asm::jle(const string& value)
{
    m_currentPlaceForWriting->append(tab + "jle " + value + "\n");
}

void stc::Asm::jg(const string& value)
{
    m_currentPlaceForWriting->append(tab + "jg " + value + "\n");
}

void stc::Asm::jge(const string& value)
{
    m_currentPlaceForWriting->append(tab + "jge " + value + "\n");
}

void stc::Asm::label(const string& value)
{
    m_currentPlaceForWriting->append(value + ":\n");
}

void stc::Asm::call(const string& value)
{
    m_currentPlaceForWriting->append(tab + "call " + value + "\n");
}

void stc::Asm::ret(const string& value)
{
    m_currentPlaceForWriting->append(tab + "ret " + value + "\n");
}

void stc::Asm::proc(const string& value)
{
    m_currentPlaceForWriting->append(value + " PROC\n");
}

void stc::Asm::endp(const string& value)
{
    m_currentPlaceForWriting->append(value + " ENDP\n");
}

void stc::Asm::procedure_prolog(size_t level, size_t size_local_variable)
{
    m_currentPlaceForWriting->append(proc_prolog + to_string(level) + ", " + to_string(size_local_variable) + "\n");
}

void stc::Asm::procedure_epilogue()
{
    m_currentPlaceForWriting->append(proc_epilogue);
}

void stc::Asm::finit()
{
    m_currentPlaceForWriting->append(tab + "finit\n");
}

void stc::Asm::fild(const string& value)
{
    m_currentPlaceForWriting->append(tab + "fild " + value + "\n");
}

void stc::Asm::fdiv(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "fdiv " + value1 + ", " + value2 + "\n");
}

void stc::Asm::fist(const string& value)
{
    m_currentPlaceForWriting->append(tab + "fist " + value + "\n");
}

void stc::Asm::fsqrt()
{
    m_currentPlaceForWriting->append(tab + "fsqrt\n");
}

void stc::Asm::write(const string& text)
{
    m_file << text << "\n";
}

void stc::Asm::initStringConstants()
{
    size_t count_constant = 0;
    initStringConstantsRecursive(m_ast->m_root, count_constant);
}

void stc::Asm::initStringConstantsRecursive(stc::Node* currentNode, size_t& countConstant)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STRING_CONST)
    {
        auto value = any_cast<string>(currentNode->value);
        currentNode->scopeId(countConstant);

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


        m_data += "   string_const_" + to_string(countConstant) + " db " + changedString + ",0\n";

        ++countConstant;
    }

    initStringConstantsRecursive(currentNode->operand1, countConstant);
    initStringConstantsRecursive(currentNode->operand2, countConstant);
    initStringConstantsRecursive(currentNode->operand3, countConstant);
    initStringConstantsRecursive(currentNode->operand4, countConstant);
}

void stc::Asm::comment(const string& value)
{
    m_currentPlaceForWriting->append(tab + "; " + value + "\n");
}

void stc::Asm::initGlobalFunction(const string& name)
{
    if (name == "input")
    {
        initInputFunction();
    }
    else if (name == "print")
    {
        initPrintFunction();
    }
    else if (name == "println")
    {
        initPrintlnFunction();
    }
    else if (name == "sqrt")
    {
        initSqrtFunction();
    }
    else if (name == "concat")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("concat PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx"
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
            "   call crt_malloc ; выделяем память под строку\n"
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

            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "concat ENDP\n");

        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
    else if (name == "slice")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("slice PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx"
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
            "   sub edx, 0 ; вычитаем 1, чтобы начать с нужного символа\n"
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
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 12\n"
            "\n"
            "_error_end:\n"
            "   mov eax, 0\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 12\n"
            "slice ENDP\n");
        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
    else if (name == "strlen")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("strlen PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx"
            "\n"
            "   push DWORD PTR [ebp + 8]\n"
            "   call crt_strlen\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 4\n"
            "strlen ENDP\n");
        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
    else if (name == "at")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("at PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx"
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
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "\n"
            "_error_end:\n"
            "   mov eax, 0\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "\n"
            "at ENDP\n");
        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
    else if (name == "find")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("find PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx"
            "\n"
            "   push [ebp + 8]\n"
            "   push [ebp + 12]\n"
            "   call crt_strstr\n"
            "\n"
            "   cmp eax, 0\n"
            "   je _not_found\n"
            "\n"
            "   mov ebx, [ebp + 12]\n"
            "   sub eax, ebx\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "\n"
            "_not_found:\n"
            "   mov eax, -1\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx"
            "\n"
            "   leave\n"
            "   ret 8\n"
            "find ENDP\n");
        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
    else if (name == "toString")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("toString PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx"
            "\n"
            "   push 20\n"
            "   call crt_malloc\n"
            "   mov ebx, eax\n"
            "    \n"
            "   push [ebp + 12]\n"
            "   push ebx\n"
            "   push [ebp + 8]\n"
            "   call crt__itoa\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx\n"
            "   leave\n"
            "   ret 8\n"
            "toString ENDP\n");
        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
    else if (name == "toNumber")
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);
        raw("toNumber PROC\n"
            "   enter 0, 0\n"
            "\n"
            "   push ebx\n"
            "   push ecx\n"
            "   push edx\n"
            "\n"
            "   push [ebp + 8]\n"
            "   call crt_atoi\n"
            "\n"
            "\n"
            "   pop ebx\n"
            "   pop ecx\n"
            "   pop edx\n"
            "\n"
            "   leave\n"
            "   ret 4\n"
            "toNumber ENDP\n");
        setPlaceForWriting(AsmPlaceForWriting::MAIN);
    }
}

void stc::Asm::initInterfaces()
{
    for (const auto& aClass : m_ast->m_classTable.raw())
    {
        if (!aClass->isInterface())
            continue;

        initInterfacesRecursive(aClass->node(), aClass);
    }
}

void stc::Asm::initInterfacesRecursive(stc::Node* currentNode, Class* interface)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::INTERFACE_FUNCTION_DEFINITION)
    {
        initInterfaceFunctionRecursive(currentNode, interface);
        return;
    }

    initInterfacesRecursive(currentNode->operand1, interface);
    initInterfacesRecursive(currentNode->operand2, interface);
    initInterfacesRecursive(currentNode->operand3, interface);
    initInterfacesRecursive(currentNode->operand4, interface);
}

void stc::Asm::initInterfaceFunctionRecursive(stc::Node* currentNode, stc::Class* interface)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::INTERFACE_FUNCTION_DEFINITION)
    {
        setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);

        const auto& interfaceName = interface->name();
        const auto& functionName = any_cast<Function*>(currentNode->value)->name();

        if (interfaceName == "__number" && functionName == "toString")
        {
            initNumberToString();
        }

        setPlaceForWriting(AsmPlaceForWriting::MAIN);
        return;
    }

    initInterfaceFunctionRecursive(currentNode->operand1, interface);
    initInterfaceFunctionRecursive(currentNode->operand2, interface);
    initInterfaceFunctionRecursive(currentNode->operand3, interface);
    initInterfaceFunctionRecursive(currentNode->operand4, interface);
}

void stc::Asm::initNumberToString()
{
    raw("__number_toString PROC\n"
        "   enter 0, 0\n"
        "\n"
        "   push ebx\n"
        "   push ecx\n"
        "   push edx"
        "\n"
        "   push 20\n"
        "   call crt_malloc\n"
        "   mov ebx, eax\n"
        "    \n"
        "   push [ebp + 12]\n"
        "   push ebx\n"
        "   push [ebp + 8]\n"
        "   call crt__itoa\n"
        "\n"
        "   leave\n"
        "   ret 8\n"
        "__number_toString ENDP\n");
}

void stc::Asm::initClassFunctionOrField(Node* currentNode, Class* aClass)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        initClassFunctionCall(currentNode, aClass);
    }

}

void stc::Asm::initClassFunctionCall(stc::Node* currentNode, Class* aClass)
{
    if (currentNode == nullptr)
        return;

    const auto& className = aClass->name();
    const auto& function = any_cast<Function*>(currentNode->value);
    const auto& functionName = function->name();

    const auto callName = className + "_" + functionName;

    raw("\n");
    comment("init stack for " + callName);

    initArgumentsOnStackRecursive(currentNode->operand1);

    const auto& types = function->arguments();
    const auto& functionReturnVoid = function->returnType() == Type("void");

    comment("call " + callName);
    call(callName);
    raw("\n");

    if (!functionReturnVoid)
    {
        push(eax);
    }

}

void stc::Asm::initMemoryManager()
{
    setPlaceForWriting(AsmPlaceForWriting::DATA);
    raw(tab + "memoryManagerPointers dd 1000 dup(0)\n");
    raw(tab + "memoryManagerCurrentIndex dd 0\n");
    setPlaceForWriting(AsmPlaceForWriting::DATA);
}

void stc::Asm::malloc(const std::string& value)
{
    push(value);
    call("crt_malloc");
    pop(ecx);
    mov(edi, offset("memoryManagerPointers"));
    mov(edx, "memoryManagerCurrentIndex");
    imul(edx, "4");
    add(edi, edx);

    mov("DWORD PTR [edi]", eax);

    add("memoryManagerCurrentIndex", one);
}

void stc::Asm::freeMemoryManager()
{
    label("__freeMemory");
    cmp("memoryManagerCurrentIndex", minus_one);
    je("__freeMemoryEnd");
    sub("memoryManagerCurrentIndex", one);

    mov(edi, offset("memoryManagerPointers"));
    mov(edx, "memoryManagerCurrentIndex");
    imul(edx, "4");
    add(edi, edx);

    push("DWORD PTR [edi]");
    call("crt_free");

    jmp("__freeMemory");

    label("__freeMemoryEnd");
}

