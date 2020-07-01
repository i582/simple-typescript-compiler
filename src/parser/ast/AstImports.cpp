#include "Ast.h"
#include "../../ICM/icm.h"



void stc::Ast::checkImports()
{
    checkImportsRecursive(m_root);

//    vector<string> importNamesInCurrentImport;
//    identifyAllImportNames(m_root, importNamesInCurrentImport);
//
//    importNamesInCurrentImport.begin();
}

void stc::Ast::checkImportsRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        auto importFilePath = any_cast<string>(currentNode->operand2->value);

        importFilePath.pop_back();
        importFilePath.erase(importFilePath.begin());

        auto path = m_filePath.remove_filename();
        path = path / importFilePath;
        path = path.lexically_normal();
        path.replace_extension(".ts");


        if (!fs::exists(path))
        {
            report(currentNode, ReportLevel::FatalError, "errorPathToImportFile", "Cannot open file: \"" + importFilePath + "\", full path: " + path.string());
        }
    }

    checkImportsRecursive(currentNode->operand1);
    checkImportsRecursive(currentNode->operand2);
    checkImportsRecursive(currentNode->operand3);
    checkImportsRecursive(currentNode->operand4);
}


void stc::Ast::identifyAllImportNames(stc::Node* currentNode, std::vector<std::string>& importNames)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        vector<string> importNamesInCurrentImport;
        identifyAllImportName(currentNode, importNames);

        for (const auto& name : importNamesInCurrentImport)
        {
            if (std::find(importNames.begin(), importNames.end(), name) == importNames.end())
            {
                importNames.push_back(name);
            }
        }

        return;
    }

    identifyAllImportNames(currentNode->operand1, importNames);
    identifyAllImportNames(currentNode->operand2, importNames);
    identifyAllImportNames(currentNode->operand3, importNames);
    identifyAllImportNames(currentNode->operand4, importNames);
}


void stc::Ast::handleImports()
{
    handleImportsRecursive(m_root);
}

void stc::Ast::handleImportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        vector<string> importNames;
        identifyAllImportName(currentNode, importNames);

        if (importNames.empty())
            return;


        auto importFilePath = any_cast<string>(currentNode->operand2->value);

        importFilePath.pop_back();
        importFilePath.erase(importFilePath.begin());

        auto path = m_filePath.remove_filename();
        path = path / importFilePath;
        path = path.lexically_normal();
        path.replace_extension(".ts");


        auto icm = new Icm(path.string(), "");

        icm->compile(false, false, false, true);

        const auto ast = icm->ast();
        const auto& astExportTables = ast->exportTable();

        vector<string> extendedImportNames;
        for (const auto& importName : importNames)
        {
            if (!astExportTables.contains(importName))
            {
                report(currentNode, ReportLevel::FatalError, "notExportedModule", "Module '\"" + importFilePath + "\"' not exported '" + (importName + "'."));
            }

            const auto exportElement = astExportTables.get(importName);
            const auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                const auto newFunction = new Function("", ReturnType(), {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);


                const auto functionNode = newFunction->implementationNode();
                vector<string> callFunctionNamesInFunction;
                identifyAllCallFunctionsNameInFunction(functionNode, callFunctionNamesInFunction);

                extendedImportNames.push_back(importName);

                for (const auto& functionName : callFunctionNamesInFunction)
                {
                    if (find(extendedImportNames.begin(), extendedImportNames.end(), functionName)
                        == extendedImportNames.end())
                    {
                        extendedImportNames.push_back(functionName);
                    }
                }
            }
            else if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                extendedImportNames.push_back(importName);
            }
        }

        for (const auto& importName : extendedImportNames)
        {


            if (find(m_alreadyImportedFunctions.begin(), m_alreadyImportedFunctions.end(), importName) !=
                                                                                    m_alreadyImportedFunctions.end())
            {
                continue;
            }
            else
            {
                m_alreadyImportedFunctions.push_back(importName);
            }

            const auto exportElement = astExportTables.get(importName);
            const auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                const auto newVariable = new Variable("", Type(), -1);
                *newVariable = *ast->m_allVariables.getByName(importName);

                m_importVariables.add(newVariable);
            }
            else if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                const auto newFunction = new Function("", ReturnType(), {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);

                m_importFunctions.add(newFunction);
            }
        }

        addImportFunctionsInTree();

        delete icm;
    }

    handleImportsRecursive(currentNode->operand1);
    handleImportsRecursive(currentNode->operand2);
    handleImportsRecursive(currentNode->operand3);
    handleImportsRecursive(currentNode->operand4);
}

void stc::Ast::identifyAllImportName(stc::Node* currentNode, vector<string>& importNames)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT_LIST_ELEMENT)
    {
        const auto importElementName = any_cast<string>(currentNode->value);
        importNames.push_back(importElementName);
    }

    identifyAllImportName(currentNode->operand1, importNames);
    identifyAllImportName(currentNode->operand2, importNames);
    identifyAllImportName(currentNode->operand3, importNames);
    identifyAllImportName(currentNode->operand4, importNames);
}



void stc::Ast::addImportVariables()
{
    for (const auto& variable : m_importVariables.raw())
    {
        m_allVariables.add(variable);
        m_globalVariables.add(variable);
    }
}

void stc::Ast::addImportFunctionsInTree()
{
    auto statementListNode = (Node*)nullptr;

    for (const auto& function : m_importFunctions.raw())
    {
        const auto functionNode = function->implementationNode();

        const auto functionNewNode = copySubTree(functionNode);
        const auto statementNode = new Node(NodeType::STATEMENT, 0, functionNewNode);
        statementListNode = new Node(NodeType::STATEMENT_LIST, 0, statementListNode, statementNode);
    }

    const auto nodeForInsert = m_root->operand1->operand1;
    statementListNode = new Node(NodeType::STATEMENT_LIST, 0, statementListNode, nodeForInsert);

    const auto statementNode = new Node(NodeType::STATEMENT, 0, statementListNode);
    m_root->operand1 = statementNode;


    m_importFunctions.clear();
}



void stc::Ast::identifyAllCallFunctionsNameInFunction(stc::Node* currentNode, vector<string>& functions)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        const auto function = any_cast<Function*>(currentNode->value);
        const auto functionName = function->name();
        functions.push_back(functionName);
        return;
    }

    identifyAllCallFunctionsNameInFunction(currentNode->operand1, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand2, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand3, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand4, functions);
}