cmake_minimum_required(VERSION 3.15)
project(stc)

set(CMAKE_CXX_STANDARD 17)


add_executable(stc
        src/lexer/token/Token.cpp
        src/lexer/token/Token.h
        src/main.cpp src/parser/node/Node.cpp
        src/parser/node/Node.h src/parser/Parser.cpp
        src/parser/Parser.h src/parser/ast/Ast.cpp
        src/parser/ast/Ast.h src/parser/variable/Variable.cpp
        src/parser/variable/Variable.h
        src/parser/array/Array.cpp
        src/parser/array/Array.h
        src/parser/variable/VariableTable.cpp
        src/parser/variable/VariableTable.h
        src/parser/function/Function.cpp
        src/parser/function/Function.h
        src/parser/function/GlobalFunctions.cpp
        src/parser/function/GlobalFunctions.h
        src/parser/function/FunctionTable.cpp
        src/parser/function/FunctionTable.h
        src/parser/asm/Asm.cpp
        src/parser/asm/Asm.h
        src/parser/asm/asm_constants.h
        src/errorHandle/errorHandle.h src/ICM/icm.h
        src/parser/ast/exportTable/ExportTable.h
        src/rang.hpp
        src/clipp.h
        src/log/Log.h
        src/log/Log.cpp
        src/analyzer/Analyzer.h
        src/analyzer/baseBlock.h
        src/parser/variable/type/Type.h
        src/parser/class/Class.h
        src/parser/class/ClassTable.h
        src/parser/class/ClassTable.cpp

        src/report/report.h src/report/reports.h src/lexer/token/Position.h src/lexer/token/TokenType.h src/lexer/Lexer2.h src/utils/utils.h src/parser/node/NodeType.h src/errorHandle/errorHandle.cpp src/report/report.cpp src/parser/ast/AstVariables.cpp src/parser/ast/AstChecks.cpp src/parser/ast/AstUtils.cpp src/parser/ast/AstExpressionType.cpp src/parser/asm/AsmGeneralBlocks.cpp src/parser/initializer/initializer.h src/parser/ast/AstPrint.cpp src/parser/ast/AstClasses.cpp src/parser/ast/AstImports.cpp)
