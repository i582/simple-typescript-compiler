#include "Ast.h"
#include "../../ICM/icm.h"


void stc::Ast::print() const
{
    Log::write("-- Started print AST\n");

    print(m_root, 0);

    Log::write("\n\n");
}


void stc::Ast::printVariableTable()
{
    Log::write("-- Started print variable table\n");
    Log::write("{\n");
    m_allVariables.print();
    if (m_allVariables.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printFunctionsTable()
{
    Log::write("-- Started print function table\n");
    Log::write("{\n");
    m_functions.print();
    if (m_functions.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printImportVariableTable()
{
    Log::write("-- Started print import variable table\n");
    Log::write("{\n");
    m_importVariables.print();
    if (m_importVariables.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printImportFunctionsTable()
{
    Log::write("-- Started print import functions table\n");
    Log::write("{\n");
    m_importFunctions.print();
    if (m_importFunctions.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printClassesTable()
{
    Log::write("-- Started print classes table\n");
    Log::write("{\n");
    m_classTable.print();
    if (m_classTable.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::print(stc::Node* currentNode, size_t level)
{
    if (currentNode == nullptr)
        return;

    for (size_t i = 0; i < level; ++i)
        Log::write("  ");



    Log::write("+-");

    switch (currentNode->type)
    {
        case NodeType::VARIABLE_DECLARATION:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("new var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::USING_VARIABLE:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("use var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::CONSTANT_DECLARATION:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("new var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::USING_CONSTANT:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("use var ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::DECLARATION_TYPE:
        {
            Log::write("var type ");
            Log::write("'" + any_cast<Type>(currentNode->value).toString() + "'");
            break;
        }
        case NodeType::NUMBER_CONST:
        {
            Log::write("number const ");
            Log::write(to_string(any_cast<number>(currentNode->value)));
            break;
        }
        case NodeType::BOOLEAN_CONST:
        {
            Log::write("boolean const ");
            Log::write(to_string(any_cast<int>(currentNode->value)));
            break;
        }
        case NodeType::ADD:
        {
            Log::write("add ");
            break;
        }
        case NodeType::SUB:
        {
            Log::write("sub ");
            break;
        }
        case NodeType::MUL:
        {
            Log::write("mul ");
            break;
        }
        case NodeType::DIV:
        {
            Log::write("div ");
            break;
        }
        case NodeType::LESS:
        {
            Log::write("less ");
            break;
        }
        case NodeType::GREATER:
        {
            Log::write("greater ");
            break;
        }
        case NodeType::EQUAL:
        {
            Log::write("equal ");
            break;
        }
        case NodeType::NOT_EQUAL:
        {
            Log::write("not equal ");
            break;
        }
        case NodeType::LESS_EQUAL:
        {
            Log::write("less equal ");
            break;
        }
        case NodeType::GREATER_EQUAL:
        {
            Log::write("greater equal ");
            break;
        }
        case NodeType::FOR:
        {
            Log::write("for ");
            break;
        }
        case NodeType::WHILE:
        {
            Log::write("while ");
            break;
        }
        case NodeType::BREAK:
        {
            Log::write("break ");
            break;
        }
        case NodeType::CONTINUE:
        {
            Log::write("continue ");
            break;
        }
        case NodeType::IF:
        {
            Log::write("if ");
            break;
        }
        case NodeType::IF_ELSE:
        {
            Log::write("if else ");
            break;
        }
        case NodeType::IDENTIFIER:
        {
            Log::write("identifier ");

            Log::write(any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::BEFORE_INC:
        {
            Log::write("before inc ");
            break;
        }
        case NodeType::BEFORE_DEC:
        {
            Log::write("before dec ");
            break;
        }
        case NodeType::AFTER_INC:
        {
            Log::write("after inc ");
            break;
        }
        case NodeType::AFTER_DEC:
        {
            Log::write("after dec ");
            break;
        }
        case NodeType::UNARY_PLUS:
        {
            Log::write("unary + ");
            break;
        }
        case NodeType::UNARY_MINUS:
        {
            Log::write("unary - ");
            break;
        }
        case NodeType::UNARY_EXCLAMATION:
        {
            Log::write("unary ! ");
            break;
        }
        case NodeType::LOGICAL_AND:
        {
            Log::write("AND ");
            break;
        }
        case NodeType::LOGICAL_OR:
        {
            Log::write("OR ");
            break;
        }
        case NodeType::SET:
        {
            Log::write("set ");
            break;
        }
        case NodeType::INDEX_CAPTURE:
        {
            Log::write("index capture ");
            break;
        }
        case NodeType::FUNCTION_CALL:
        {
            Log::write("function call ");
            Log::write(any_cast<Function*>(currentNode->value)->toString());
            break;
        }
        case NodeType::FUNCTION_ARG:
        {
            Log::write("function arg ");
            break;
        }
        case NodeType::EXPRESSION:
        {
            Log::write("expr { Type: '");
            // Log::write(any_cast<Type>(currentNode->value).toString() + "' } ");
            break;
        }
        case NodeType::CONST_EXPRESSION:
        {
            Log::write("const expr ");
            break;
        }
        case NodeType::STATEMENT:
        {
            Log::write("stmt ");
            break;
        }
        case NodeType::SEQ_STATEMENT:
        {
            Log::write("seq ");
            break;
        }
        case NodeType::STATEMENT_LIST:
        {
            Log::write("seq ");
            break;
        }
        case NodeType::PROGRAM:
        {
            Log::write("prog ");
            break;
        }
        case NodeType::DO_WHILE:
        {
            Log::write("do (while) ");
            break;
        }
        case NodeType::INITIALIZER:
        {
            Log::write("initializer ");
            break;
        }
        case NodeType::INITIALIZER_LIST_ELEMENT:
        {
            Log::write("initializer list ");
            break;
        }
        case NodeType::NEW:
        {
            Log::write("new ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION:
        {
            Log::write("function impl ");
            Log::write(any_cast<Function*>(currentNode->value)->toString());
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARG:
        {
            auto variable = any_cast<Variable*>(currentNode->value);

            Log::write("function impl arg ");
            Log::write(variable->toString());
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
        {
            Log::write("function impl return type ");
            Log::write("'" + any_cast<Type>(currentNode->value).toString() + "'");
            break;
        }
        case NodeType::RETURN:
        {
            Log::write("return { ");
            Log::write(to_string(any_cast<size_t>(currentNode->value)) + " }");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARGS:
        {
            Log::write("function impl args ");
            break;
        }
        case NodeType::FUNCTION_ARGS:
        {
            Log::write("function args ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_DEFAULT_ARG_VALUE:
        {
            Log::write("function impl default arg value ");
            break;
        }
        case NodeType::STRING_CONST:
        {
            Log::write("string const ");
            Log::write(any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::IMPORT:
        {
            Log::write("Import ");
            break;
        }
        case NodeType::EXPORT:
        {
            Log::write("Export ");
            break;
        }
        case NodeType::IMPORT_LIST:
        {
            Log::write("Import List");
            break;
        }
        case NodeType::IMPORT_LIST_ELEMENT:
        {
            Log::write("Import List Element '");
            Log::write(any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::IMPORT_FILE:
        {
            Log::write("Import File Path '");
            Log::write(any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::EXPORT_LIST:
        {
            Log::write("Export List");
            break;
        }
        case NodeType::EXPORT_LIST_ELEMENT:
        {
            Log::write("Export List Element '");
            Log::write(any_cast<string>(currentNode->value) + "'");
            break;
        }

        case NodeType::CLASS_IMPLEMENTATION:
        {
            Log::write("Class Definition '");
            Log::write(std::any_cast<Class*>(currentNode->value)->toString() + "'");
            break;
        }
        case NodeType::CLASS_IMPLEMENTATION_FIELD:
        {
            Log::write("Class Definition Field '");
            Log::write(std::any_cast<Variable*>(currentNode->value)->toString() + "'");
            break;
        }
        case NodeType::CLASS_IMPLEMENTATION_FUNCTION:
        {
            Log::write("Class Definition Function");
            break;
        }
        case NodeType::CLASS_THIS:
        {
            Log::write("Class Definition This. ");
            Log::write("Class name '" + std::any_cast<Class*>(currentNode->value)->name() + "'");
            break;
        }
        case NodeType::CLASS_FIELD_VISIBILITY:
        {
            Log::write("Class Field Visibility '");
            Log::write(Class::modifierToString(std::any_cast<ClassVisibilityModifier>(currentNode->value)) + "'");
            break;
        }
        case NodeType::CLASS_FIELD_STATIC:
        {
            Log::write("Class Field is Static ");
            break;
        }
        case NodeType::CLASS_ACCESS_TO_FIELD:
        {
            Log::write("Class Access To Field. ");
            Log::write("Class name '" + std::any_cast<Class*>(currentNode->value)->name() + "'");
            break;
        }
        case NodeType::CLASS_ACCESS_TO_STATIC_FIELD:
        {
            Log::write("Class Access To Static Field. ");
            Log::write("Class name '" + std::any_cast<Class*>(currentNode->value)->name() + "'");
            break;
        }
        case NodeType::INTERFACE_IMPLEMENTATION:
        {
            Log::write("Interface Implementation '");
            Log::write(std::any_cast<Class*>(currentNode->value)->toString() + "'");
            break;
        }
        case NodeType::INTERFACE_FIELD_DEFINITION:
        {
            Log::write("Interface Field Implementation '");
            Log::write(std::any_cast<Variable*>(currentNode->value)->toString() + "'");
            break;
        }
        case NodeType::INTERFACE_FUNCTION_DEFINITION:
        {
            Log::write("Interface Function Definition '");
            Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }


    }

    if (currentNode->scopeId() != 4294967295)
    {
        Log::write(" (scope id: " + to_string(currentNode->scopeId()) + ")");
    }

    Log::write("\n");


    print(currentNode->operand1, level + 1);
    print(currentNode->operand2, level + 1);
    print(currentNode->operand3, level + 1);
    print(currentNode->operand4, level + 1);
}
