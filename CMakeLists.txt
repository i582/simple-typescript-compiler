cmake_minimum_required(VERSION 3.15)
project(stc)

set(CMAKE_CXX_STANDARD 17)


add_executable(stc
        src/lexer/token/Token.cpp
        src/lexer/token/Token.h
        src/lexer/Lexer.cpp
        src/lexer/Lexer.h
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
        src/console-color.hpp)
