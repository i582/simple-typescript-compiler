#include "Ast.h"
#include "../../ICM/icm.h"





void stc::Ast::identifyClasses()
{
    identifyClassesRecursive(m_allScopeNodes[0].second);
}

void stc::Ast::identifyClassesRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
    {
        auto className = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->operand1->scopeId();
        auto newClass = new Class(className);

        VariableTable variables;
        identifyClassFieldsRecursive(currentNode, scopeId, variables);
        newClass->fields(variables);

        FunctionTable functions;
        identifyClassFunctionsRecursive(currentNode, scopeId, functions);
        newClass->functions(functions);

        m_classTable.add(newClass);

        m_allClassImplementationNodes.push_back(currentNode);

        currentNode->value = newClass;
        return;
    }

    identifyClassesRecursive(currentNode->operand1);
    identifyClassesRecursive(currentNode->operand2);
}

void stc::Ast::identifyClassFieldsRecursive(stc::Node* currentNode, size_t scopeId, VariableTable& table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION_FIELD)
    {
        auto fieldName = any_cast<string>(currentNode->value);
        auto fieldType = any_cast<Type>(currentNode->operand1->value);
        auto visibilityModifier = any_cast<ClassVisibilityModifier>(currentNode->operand2->value);
        auto isStatic = currentNode->operand3 != nullptr;

        auto newField = new Variable(fieldName, fieldType, scopeId);

        newField->setVisibilityModifier(visibilityModifier);
        newField->setIsStatic(isStatic);

        table.add(newField);


        currentNode->value = newField;
        return;
    }

    identifyClassFieldsRecursive(currentNode->operand1, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand2, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand3, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand4, scopeId, table);
}

void stc::Ast::identifyClassFunctionsRecursive(stc::Node* currentNode, size_t scopeId, stc::FunctionTable& table)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION_FUNCTION)
    {
        auto functionNode = currentNode->operand1;

        auto functionName = any_cast<string>(functionNode->value);
        auto functionReturnType = any_cast<Type>(functionNode->operand1->value);


        vector<Type> argumentTypes;
        vector<Variable*> arguments;
        identifyFunctionArgumentsRecursive(functionNode->operand2, argumentTypes, arguments);


        size_t localVariableSize = 0;
        vector<Variable*> localVariables;
        identifyFunctionLocalVariablesRecursive(functionNode->operand3, localVariableSize, localVariables);


        auto visibilityModifier = any_cast<ClassVisibilityModifier>(currentNode->operand2->value);
        auto isStatic = currentNode->operand3 != nullptr;


        auto newFunction = new Function(functionName, functionReturnType, argumentTypes, functionNode, localVariableSize, arguments, localVariables);

        newFunction->setVisibilityModifier(visibilityModifier);
        newFunction->setIsStatic(isStatic);


        currentNode->operand1->value = newFunction;

        table.add(newFunction);
        return;
    }


    identifyClassFunctionsRecursive(currentNode->operand1, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand2, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand3, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand4, scopeId, table);
}





void stc::Ast::checkClassAccessInImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        checkClassAccessInImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::checkClassAccessInImplementationRecursive(Node* currentNode, Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        auto subjectNode = currentNode->operand2;
        auto subjectNodeIsSelfClass = (currentNode->operand1->type == NodeType::USING_VARIABLE) ? any_cast<string>(currentNode->operand1->value) == a_class->name() : false;


        if (subjectNode->type == NodeType::USING_VARIABLE)
        {
            auto fieldName = any_cast<string>(subjectNode->value);
            auto contains = a_class->fields().contains(fieldName);
            auto variable = a_class->fields().getByName(fieldName);
            auto isStatic = variable->isStatic();


            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a field named '" + fieldName + "'.");
            }

            if (!isStatic && subjectNodeIsSelfClass)
            {
                error("Access to non-static field '" + fieldName + "' at class '" + a_class->name() + "'.");
            }

            if (isStatic && !subjectNodeIsSelfClass)
            {
                error("Field '" + fieldName + "' is a static member of class '" + a_class->name() + "'");
            }

            subjectNode->value = variable;
        }
        else if (subjectNode->type == NodeType::FUNCTION_CALL)
        {
            auto functionName = any_cast<string>(subjectNode->value);
            auto types = getFunctionCallArguments(subjectNode);

            auto searchFunction = new Function(functionName, Type("void"), types);
            auto contains = a_class->functions().contains(searchFunction);
            auto function = a_class->functions().get(functionName, types);
            auto isStatic = function->isStatic();
            delete searchFunction;

            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a function named '" + functionName + "' with " + Function::argumentsToString(types) +  " argument list.");
            }

            if (!isStatic && subjectNodeIsSelfClass)
            {
                error("Access to non-static function '" + functionName + "' at class '" + a_class->name() + "'.");
            }

            if (isStatic && !subjectNodeIsSelfClass)
            {
                error("Function '" + functionName + "' is a static member of class '" + a_class->name() + "'");
            }

            subjectNode->value = function;
        }

        return;
    }

    checkClassAccessInImplementationRecursive(currentNode->operand1, a_class);
    checkClassAccessInImplementationRecursive(currentNode->operand2, a_class);
    checkClassAccessInImplementationRecursive(currentNode->operand3, a_class);
    checkClassAccessInImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::transformStaticFunctionCallInClassImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        transformStaticFunctionCallInClassImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::transformStaticFunctionCallInClassImplementationRecursive(stc::Node* currentNode, stc::Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;
        const auto subjectNode = currentNode->operand2;


        if (objectNode->type == NodeType::USING_VARIABLE)
        {
            auto name = any_cast<string>(objectNode->value);
            auto isClassName = a_class->name() == name;

            if (isClassName)
            {
                currentNode->value = a_class;
                currentNode->type = NodeType::CLASS_ACCESS_TO_STATIC_FIELD;

                delete currentNode->operand1;
                currentNode->operand1 = subjectNode;
                currentNode->operand2 = nullptr;
            }
        }
        return;
    }

    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand1, a_class);
    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand2, a_class);
    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand3, a_class);
    transformStaticFunctionCallInClassImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::addPointerToClassForThisInClassImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        addPointerToClassForThisInClassImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::addPointerToClassForThisInClassImplementationRecursive(stc::Node* currentNode, stc::Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_THIS)
    {
        currentNode->value = a_class;
        return;
    }

    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand1, a_class);
    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand2, a_class);
    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand3, a_class);
    addPointerToClassForThisInClassImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::addPointerToClassForAccessNodesInImplementation()
{
    for (const auto& classImplementationNode : m_allClassImplementationNodes)
    {
        auto a_class = any_cast<Class*>(classImplementationNode->value);

        addPointerToClassForAccessNodesInImplementationRecursive(classImplementationNode, a_class);
    }
}

void stc::Ast::addPointerToClassForAccessNodesInImplementationRecursive(stc::Node* currentNode, stc::Class* a_class)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        if (currentNode->operand1->type == NodeType::CLASS_THIS)
        {
            currentNode->value = a_class;
            return;
        }
    }

    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand1, a_class);
    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand2, a_class);
    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand3, a_class);
    addPointerToClassForAccessNodesInImplementationRecursive(currentNode->operand4, a_class);
}

void stc::Ast::checkOperatorNew()
{
    checkOperatorNewRecursive(m_root);
}

void stc::Ast::checkOperatorNewRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::NEW)
    {
        auto functionNode = currentNode->operand1;

        if (functionNode->type != NodeType::FUNCTION_CALL)
        {
            error("The type '" + Node::nodeTypeToString(functionNode->type) + "' is not constructible.");
        }

        auto functionName = any_cast<string>(functionNode->value);

        auto contains = m_classTable.contains(functionName);

        if (!contains)
        {
            error("The type '" + functionName + "' is not one of the defined classes.");
        }
    }

    checkOperatorNewRecursive(currentNode->operand1);
    checkOperatorNewRecursive(currentNode->operand2);
    checkOperatorNewRecursive(currentNode->operand3);
    checkOperatorNewRecursive(currentNode->operand4);
}


void stc::Ast::transformOperatorNewToConstructorCall()
{
    transformOperatorNewToConstructorCallRecursive(m_root);
}

void stc::Ast::transformOperatorNewToConstructorCallRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::SET)
    {
        auto objectNode = currentNode->operand1;
        auto subjectNode = currentNode->operand2;

        if (subjectNode->type == NodeType::NEW)
        {
            auto newNode = subjectNode;
            auto functionNode = subjectNode->operand1;
            auto functionName = any_cast<string>(functionNode->value);
            auto functionArgsNode = functionNode->operand1;
            auto a_class = m_classTable.get(functionName);


            auto constructorNode = new Node(NodeType::FUNCTION_CALL, string("constructor"), functionArgsNode);
            auto accessNode = Node(NodeType::CLASS_ACCESS_TO_FIELD, a_class, objectNode, constructorNode);

            *currentNode = accessNode;

            return;
        }
    }

    transformOperatorNewToConstructorCallRecursive(currentNode->operand1);
    transformOperatorNewToConstructorCallRecursive(currentNode->operand2);
    transformOperatorNewToConstructorCallRecursive(currentNode->operand3);
    transformOperatorNewToConstructorCallRecursive(currentNode->operand4);
}

void stc::Ast::addPointerToClassForAccessNodesOutImplementation()
{
    addPointerToClassForAccessNodesOutImplementationRecursive(m_root);
}

void stc::Ast::addPointerToClassForAccessNodesOutImplementationRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
        return;


    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;

        const auto objectType = checkAndGiveExpressionType(objectNode);

        const auto& className = objectType.toString();

        const auto contains = m_classTable.contains(className);

        if (!contains)
        {
            error("The name '" + className + "' is not a class.");
        }

        const auto a_class = m_classTable.get(className);
        currentNode->value = a_class;

        return;
    }

    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand1);
    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand2);
    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand3);
    addPointerToClassForAccessNodesOutImplementationRecursive(currentNode->operand4);
}

void stc::Ast::identifyVariablesOfClasses()
{
    //identifyVariablesOfClassesRecursive(m_root);
}

void stc::Ast::identifyVariablesOfClassesRecursive(stc::Node* currentNode, stc::VariableTable* table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
        return;


    if (currentNode->type == NodeType::USING_VARIABLE)
    {
        auto variableName = any_cast<string>(currentNode->value);


        if (!table->containsGlobally(variableName) && !m_importVariables.contains(variableName))
        {
            error("The name '" + variableName + "' is not declared!");
        }


        auto [scopeId, variable] = !table->containsGlobally(variableName) ?
                                   m_importVariables.getVariableAndScopeIdWhereItDeclared(variableName)
                                                                          : table->getVariableAndScopeIdWhereItDeclared(variableName);

        currentNode->scopeId(scopeId);
    }



    identifyVariablesOfClassesRecursive(currentNode->operand1, table);
    identifyVariablesOfClassesRecursive(currentNode->operand2, table);
    identifyVariablesOfClassesRecursive(currentNode->operand3, table);
    identifyVariablesOfClassesRecursive(currentNode->operand4, table);
}

void stc::Ast::checkClassAccessOutImplementation()
{
    checkClassAccessOutImplementationRecursive(m_root);
}

void stc::Ast::checkClassAccessOutImplementationRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
        return;

    if (currentNode->type == NodeType::CLASS_ACCESS_TO_FIELD)
    {
        const auto objectNode = currentNode->operand1;
        const auto subjectNode = currentNode->operand2;


        const auto a_class = any_cast<Class*>(currentNode->value);

        if (subjectNode->type == NodeType::USING_VARIABLE)
        {
            const auto variableName = any_cast<string>(subjectNode->value);
            const auto contains = a_class->fields().contains(variableName);

            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a field named '" + variableName + "'.");
            }

            const auto variable = a_class->fields().getByName(variableName);
            const auto isStatic = variable->isStatic();

            const auto visibilityModifier = variable->visibilityModifier();
            const auto isPublic = visibilityModifier == ClassVisibilityModifier::PUBLIC;


            if (!isPublic)
            {
                if (visibilityModifier == ClassVisibilityModifier::PROTECTED)
                {
                    error("Variable '" + variableName + "' is protected and only accessible within class '" + a_class->name() + "' and its subclasses.");
                }
                else if (visibilityModifier == ClassVisibilityModifier::PRIVATE)
                {
                    error("Variable '" + variableName + "' is private and only accessible within class '" + a_class->name() + "'.");
                }
            }

//            if (!isStatic && subjectNodeIsSelfClass)
//            {
//                error("Access to non-static field '" + fieldName + "' at class '" + a_class->name() + "'.");
//            }
//
//            if (isStatic && !subjectNodeIsSelfClass)
//            {
//                error("Field '" + fieldName + "' is a static member of class '" + a_class->name() + "'");
//            }

            subjectNode->value = variable;
        }
        else if (subjectNode->type == NodeType::FUNCTION_CALL)
        {
            const auto functionName = any_cast<string>(subjectNode->value);
            const auto types = getFunctionCallArguments(subjectNode);

            const auto searchFunction = new Function(functionName, Type("void"), types);
            const auto contains = a_class->functions().contains(searchFunction);
            delete searchFunction;

            if (!contains)
            {
                error("Class '" + a_class->name() + "' does not contain a function named '" + functionName + "' with " + Function::argumentsToString(types) +  " argument list.");
            }

            const auto function = a_class->functions().get(functionName, types);
            const auto isStatic = function->isStatic();

            const auto visibilityModifier = function->visibilityModifier();
            const auto isPublic = visibilityModifier == ClassVisibilityModifier::PUBLIC;


            if (!isPublic)
            {
                if (visibilityModifier == ClassVisibilityModifier::PROTECTED)
                {
                    error("Function '" + functionName + "' is protected and only accessible within class '" + a_class->name() + "' and its subclasses.");
                }
                else if (visibilityModifier == ClassVisibilityModifier::PRIVATE)
                {
                    error("Function '" + functionName + "' is private and only accessible within class '" + a_class->name() + "'.");
                }
            }

//            if (!isStatic && subjectNodeIsSelfClass)
//            {
//                error("Access to non-static function '" + functionName + "' at class '" + a_class->name() + "'.");
//            }
//
//            if (isStatic && !subjectNodeIsSelfClass)
//            {
//                error("Function '" + functionName + "' is a static member of class '" + a_class->name() + "'");
//            }

            subjectNode->value = function;
        }

        return;
    }

    checkClassAccessOutImplementationRecursive(currentNode->operand1);
    checkClassAccessOutImplementationRecursive(currentNode->operand2);
    checkClassAccessOutImplementationRecursive(currentNode->operand3);
    checkClassAccessOutImplementationRecursive(currentNode->operand4);
}

void stc::Ast::identifyInterfaces()
{
    identifyInterfacesRecursive(m_allScopeNodes[0].second);
}

void stc::Ast::identifyInterfacesRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INTERFACE_IMPLEMENTATION)
    {
        const auto interfaceName = any_cast<string>(currentNode->value);
        const auto scopeId = currentNode->operand1->scopeId();
        const auto newClass = new Class(interfaceName);

        VariableTable variables;
        identifyInterfaceFieldsRecursive(currentNode, scopeId, variables);
        newClass->requiredFields(variables);

        FunctionTable functions;
        identifyInterfaceFunctionsRecursive(currentNode, scopeId, functions);
        newClass->requiredFunctions(functions);

        m_classTable.add(newClass);


        currentNode->value = newClass;
        return;
    }

    identifyInterfacesRecursive(currentNode->operand1);
    identifyInterfacesRecursive(currentNode->operand2);
}

void stc::Ast::identifyInterfaceFieldsRecursive(stc::Node* currentNode, size_t scopeId, stc::VariableTable& table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INTERFACE_FIELD_DEFINITION)
    {
        const auto fieldName = any_cast<string>(currentNode->value);
        const auto fieldType = any_cast<Type>(currentNode->operand1->value);


        const auto newField = new Variable(fieldName, fieldType, scopeId);


        table.add(newField);
        currentNode->value = newField;
        return;
    }

    identifyInterfaceFieldsRecursive(currentNode->operand1, scopeId, table);
    identifyInterfaceFieldsRecursive(currentNode->operand2, scopeId, table);
    identifyInterfaceFieldsRecursive(currentNode->operand3, scopeId, table);
    identifyInterfaceFieldsRecursive(currentNode->operand4, scopeId, table);
}

void stc::Ast::identifyInterfaceFunctionsRecursive(stc::Node* currentNode, size_t scopeId, stc::FunctionTable& table)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::INTERFACE_FUNCTION_DEFINITION)
    {
        const auto functionNode = currentNode;

        const auto functionName = any_cast<string>(functionNode->value);
        const auto functionReturnType = any_cast<Type>(functionNode->operand1->value);


        vector<Type> argumentTypes;
        vector<Variable*> arguments;
        identifyFunctionArgumentsRecursive(functionNode->operand2, argumentTypes, arguments);


        const auto newFunction = new Function(functionName, functionReturnType, argumentTypes, functionNode, 0, arguments, {});

        currentNode->operand1->value = newFunction;

        table.add(newFunction);
        return;
    }


    identifyInterfaceFunctionsRecursive(currentNode->operand1, scopeId, table);
    identifyInterfaceFunctionsRecursive(currentNode->operand2, scopeId, table);
    identifyInterfaceFunctionsRecursive(currentNode->operand3, scopeId, table);
    identifyInterfaceFunctionsRecursive(currentNode->operand4, scopeId, table);
}