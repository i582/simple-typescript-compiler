#include "asm.h"


void stc::Asm::setBlockToAsm(stc::Node* currentNode)
{
    const auto lvalue = currentNode->operand1;
    const auto rvalue = currentNode->operand2;


    if (lvalue->type == NodeType::USING_VARIABLE ||
        lvalue->type == NodeType::VARIABLE_DECLARATION ||
        lvalue->type == NodeType::CONSTANT_DECLARATION)
    {
        const auto variable = any_cast<Variable*>(lvalue->value);
        const auto variableName = variable->nameWithPostfix();

        blockToAsmRecursive(rvalue);

        // pop eax
        pop(eax);

        if (variable->isArgument())
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
    else if (lvalue->type == NodeType::INDEX_CAPTURE)
    {
        // получаем тип элемента от которого берется индекс
        const auto type = m_ast->checkAndGiveExpressionType(currentNode->operand1);

        // ! == обрабатываем часть, от чего берется индекс ==
        expressionToAsmRecursive(lvalue->operand1);
        // получаем значение
        pop(eax);
        // сохраняем указатель в edi для обработки
        mov(edi, eax);

        // ! == обрабатываем выражение индекса ==
        expressionToAsmRecursive(lvalue->operand2);
        // получаем значение
        pop(ebx);
        // умножаем на 4, чтобы получить значение сдвига в байтах
        imul(ebx, "4");
        // сдвигаем указатель на количество байт, тем самым получая указатель на необходимый элемент
        add(edi, ebx);
        // защищаем значение указателя от перезаписывания
        push(edi);



        // ! == обрабатываем правую часть присваивания ==
        expressionToAsmRecursive(rvalue);
        // получаем полученное значение
        pop(eax);
        // восстанавливаем значение указателя
        pop(edi);

        // ! == помещаем значение после знака равно в элемент массива ==
        mov("DWORD PTR [edi]", eax);
    }
}

void stc::Asm::ifBlockToAsm(stc::Node* currentNode)
{
    const auto conditionNode = currentNode->operand1->operand1;
    const auto statementNode = currentNode->operand2;
    const auto elseStatementNode = currentNode->operand3;

    const auto startLabel = "__if_start_" + to_string(statementNode->scopeId());
    const auto endLabel = "__if_end_" + to_string(statementNode->scopeId());
    const auto elseLabel = "__if_else_" + to_string(statementNode->scopeId());

    // обрабатываем поддерево с условием
    blockToAsmRecursive(conditionNode);
    pop(eax);
    cmp(eax, null);


    auto endOrElseLabel = endLabel;
    if (currentNode->type == NodeType::IF_ELSE)
    {
        endOrElseLabel = elseLabel;
    }


    je(endOrElseLabel);


    if (currentNode->type == NodeType::IF_ELSE)
    {
        // label:
        label(startLabel);
        blockToAsmRecursive(statementNode);

        // jmp label
        jmp(endLabel);

        // label:
        label(elseLabel);
        blockToAsmRecursive(elseStatementNode);

        // label:
        label(endLabel);

    }
    else if (currentNode->type == NodeType::IF)
    {
        // label:
        label(startLabel);
        blockToAsmRecursive(statementNode);

        // label:
        label(endLabel);
    }

}

void stc::Asm::whileBlockToAsm(stc::Node* currentNode)
{
    const auto conditionNode = currentNode->operand1->operand1;
    const auto statementNode = currentNode->operand2;

    const auto startLabel = "__loop_start_" + to_string(statementNode->scopeId());
    const auto endLabel = "__loop_end_" + to_string(statementNode->scopeId());
    const auto afterEffectsLabel = "__loop_aftereffects_" + to_string(statementNode->scopeId());


    label(startLabel);
    label(afterEffectsLabel);


    blockToAsmRecursive(conditionNode);

    pop(eax);
    cmp(eax, null);

    je(endLabel);

    blockToAsmRecursive(statementNode);
    jmp(startLabel);

    // label:
    label(endLabel);
}

void stc::Asm::doWhileBlockToAsm(stc::Node* currentNode)
{
    const auto conditionNode = currentNode->operand1->operand1;
    const auto statementNode = currentNode->operand2;

    const auto startLabel = "__loop_start_" + to_string(statementNode->scopeId());
    const auto endLabel = "__loop_end_" + to_string(statementNode->scopeId());
    const auto afterEffectsLabel = "__loop_aftereffects_" + to_string(statementNode->scopeId());


    label(startLabel);
    label(afterEffectsLabel);


    blockToAsmRecursive(statementNode);
    blockToAsmRecursive(conditionNode);


    pop(eax);
    cmp(eax, null);

    je(endLabel);

    jmp(startLabel);

    // label:
    label(endLabel);

}

void stc::Asm::forBlockToAsm(stc::Node* currentNode)
{
    const auto preventionNode = currentNode->operand1->operand1;
    const auto conditionNode = currentNode->operand2->operand1;
    const auto afterEffectsNode = currentNode->operand3->operand1;
    const auto statementNode = currentNode->operand4;

    const auto startLabel = "__loop_start_" + to_string(statementNode->scopeId());
    const auto endLabel = "__loop_end_" + to_string(statementNode->scopeId());
    const auto afterEffectsLabel = "__loop_aftereffects_" + to_string(statementNode->scopeId());


    blockToAsmRecursive(preventionNode);
    label(startLabel);

    blockToAsmRecursive(conditionNode);

    pop(eax);
    cmp(eax, null);

    je(endLabel);


    blockToAsmRecursive(statementNode);
    label(afterEffectsLabel);

    blockToAsmRecursive(afterEffectsNode);
    jmp(startLabel);

    // label:
    label(endLabel);
}

void stc::Asm::functionImplementationToAsm(stc::Node* currentNode)
{
    setPlaceForWriting(AsmPlaceForWriting::FUNCTION_IMPLEMENTATIONS);

    functionImplementationRecursive(currentNode);

    setPlaceForWriting(AsmPlaceForWriting::MAIN);
}

void stc::Asm::functionCallToAsm(stc::Node* currentNode)
{
    const auto function = any_cast<Function*>(currentNode->value);
    const auto& functionName = function->name();

    raw("\n");
    comment("init stack for " + functionName);

    initArgumentsOnStackRecursive(currentNode->operand1);


    const auto functionReturnVoid = function->returnType() == Type("void");


    comment("call " + functionName);
    call(functionName);
    raw("\n");

    if (!functionReturnVoid)
    {
        push(eax);
    }
}

void stc::Asm::returnOperatorToAsm(stc::Node* currentNode)
{
    if (currentNode->operand1->operand1 != nullptr)
    {
        expressionToAsmRecursive(currentNode->operand1);
        pop(eax);
    }

    const auto argumentsSize = any_cast<size_t>(currentNode->value);

    procedure_epilogue();
    ret(to_string(argumentsSize));
}

void stc::Asm::breakOperatorToAsm(stc::Node* currentNode)
{
    const auto scopeId = currentNode->scopeId() + 2;
    const auto labelValue = "__loop_end_" + to_string(scopeId);

    jmp(labelValue);
}

void stc::Asm::continueOperatorToAsm(stc::Node* currentNode)
{
    const auto scopeId = currentNode->scopeId() + 2;
    const auto labelValue = "__loop_aftereffects_" + to_string(scopeId);

    jmp(labelValue);
}



void stc::Asm::initializerToAsm(stc::Node* currentNode)
{
    const auto initializer = any_cast<Initializer*>(currentNode->value);
    const auto initializerType = initializer->type();
    const auto initializerCountElement = initializer->countElement();
    const auto initializerSize = initializerCountElement * initializerType.size();

    // выделяем память под массив
    malloc(to_string(initializerSize));

    pop(edi);
    push(eax);

    // обрабатываем все элементы инициализатора
    size_t elementIndex = 0;
    initializerElementToAsm(currentNode, initializerSize, elementIndex);
}

void stc::Asm::initializerElementToAsm(stc::Node* currentNode, size_t initializerSize, size_t& elementIndex)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::INITIALIZER_LIST_ELEMENT)
    {
        const auto shift = to_string(initializerSize - elementIndex * 4 - 4); // получаем сдвиг в байтах для текущего элемента

        mov(edi, eax); // помещаем указатель на память в edi

        // обрабатываем элемент массива
        expressionToAsmRecursive(currentNode->operand2); // результат в стеке
        pop(ecx); // получаем результат в ecx

        add(edi, shift); // сдвигаем указатель

        mov("DWORD PTR [edi]", ecx); // помещаем значение в память

        ++elementIndex; // сдвигаем индекс
    }

    initializerElementToAsm(currentNode->operand1, initializerSize, elementIndex);
    initializerElementToAsm(currentNode->operand2, initializerSize, elementIndex);
    initializerElementToAsm(currentNode->operand3, initializerSize, elementIndex);
    initializerElementToAsm(currentNode->operand4, initializerSize, elementIndex);
}
