#include "Ast.h"
#include "../../ICM/icm.h"

using namespace stc;

/**
 * @brief Возвращает тип выражения переданного поддерева
 * @param node Корневой узел выражения
 * @return Type тип выражения
 */
Type Ast::expressionType(Node* node)
{
    return checkAndGiveExpressionType(node);
}


/**
 * @brief Функция возвращает тип инициализатора вида [...]
 * @param currentNode Указатель на поддерево инициализатора
 * @return Type Тип элементов
 */
Type Ast::giveInitializerType(Node* currentNode)
{
    Type initializerType{};
    giveInitializerTypeRecursive(currentNode, initializerType, true);
    return initializerType;
}

/**
 * @brief Функция возвращающая количество элементов в инициализаторе
 * @param currentNode Указатель на поддерево инициализатора
 * @return Количество элементов
 */
size_t Ast::giveInitializerCountElement(Node* currentNode)
{
    size_t size = 0;
    giveInitializerCountElementRecursive(currentNode, size);
    return size;
}