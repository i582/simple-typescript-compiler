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
    initGeneralVariables();
    initLocalVariables();


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
        logicalXor(eax, minus_one);
        logicalAnd(eax, one);
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
            push(argumentVar(variableName));
        }
        else
        {
            push(localVar(variableName));
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
            cmp(argumentVar(variableName), null);
        }
        else
        {
            cmp(localVar(variableName), null);
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

        logicalAnd(eax, ebx);
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

        logicalOr(eax, ebx);
        push(eax);
    }
    else if (currentNode->type == NodeType::UNARY_EXCLAMATION)
    {
        relationExpressionToAsmRecursive(currentNode->operand1->operand1);


        // pop eax
        pop(eax);
        logicalXor(eax, minus_one);
        logicalAnd(eax, one);
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
            push(one);
            jmp(labelCompareEnd);

            label(labelIfNotEqual);
            push(null);

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
    procedureProlog(0, functionLocalVariableSize);

    const auto stackSize = function->argumentsSize();

    blockToAsmRecursive(currentNode->operand3);

    procedureEpilogue();
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


        setPlaceForWriting(AsmPlaceForWriting::FunctionImplementations);
        raw(GlobalFunctions::getAssemblerImplementation(functionName));
        setPlaceForWriting(AsmPlaceForWriting::Main);

        //initGlobalFunction(functionName);
    }

    initGlobalFunctionsRecursive(currentNode->operand1);
    initGlobalFunctionsRecursive(currentNode->operand2);
    initGlobalFunctionsRecursive(currentNode->operand3);
    initGlobalFunctionsRecursive(currentNode->operand4);
}


void stc::Asm::setPlaceForWriting(stc::AsmPlaceForWriting place)
{
    switch (place)
    {
        case AsmPlaceForWriting::Data:
        {
            m_currentPlaceForWriting = &m_data;
            break;
        }
        case AsmPlaceForWriting::BeforeMain:
        {
            m_currentPlaceForWriting = &m_beforeMain;
            break;
        }
        case AsmPlaceForWriting::FunctionImplementations:
        {
            m_currentPlaceForWriting = &m_functionImplementations;
            break;
        }
        case AsmPlaceForWriting::Main:
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

stc::string stc::Asm::localVar(const string& value)
{
    return value + "[ebp]";
}

stc::string stc::Asm::argumentVar(const string& value)
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

void stc::Asm::logicalOr(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "or " + value1 + ", " + value2 + "\n");
}

void stc::Asm::logicalAnd(const string& value1, const string& value2)
{
    m_currentPlaceForWriting->append(tab + "and " + value1 + ", " + value2 + "\n");
}

void stc::Asm::logicalXor(const string& value1, const string& value2)
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

void stc::Asm::procedureProlog(size_t level, size_t sizeLocalVariable)
{
    m_currentPlaceForWriting->append(proc_prolog + to_string(level) + ", " + to_string(sizeLocalVariable) + "\n");
}

void stc::Asm::procedureEpilogue()
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
        setPlaceForWriting(AsmPlaceForWriting::FunctionImplementations);

        const auto& interfaceName = interface->name();
        const auto& functionName = any_cast<Function*>(currentNode->value)->name();

        if (interfaceName == "__number" && functionName == "toString")
        {
            initNumberToString();
        }

        setPlaceForWriting(AsmPlaceForWriting::Main);
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
    setPlaceForWriting(AsmPlaceForWriting::Data);
    raw(tab + "memoryManagerPointers dd 1000 dup(0)\n");
    raw(tab + "memoryManagerCurrentIndex dd 0\n");
    setPlaceForWriting(AsmPlaceForWriting::Data);
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

void stc::Asm::initGeneralVariables()
{
    setPlaceForWriting(AsmPlaceForWriting::Data);
    raw(tab + "div_operand_1 dd 0\n");
    raw(tab + "div_operand_2 dd 0\n");

    raw(tab + "input_format db \"%d\", 0\n");
    raw(tab + "input_result dd 0\n");

    raw(tab + "print_format db \"%d \", 0\n");
    raw(tab + "println_format db \"%s\", 0\n");

    raw(tab + "sqrt_result dd 0\n");

    setPlaceForWriting(AsmPlaceForWriting::Main);
}

