#include "Token.h"

stc::Token::Token(const std::string& lexeme, const Position& position)
{
    this->m_lexeme = lexeme;
    this->m_type = typeByLexeme(lexeme);

    this->m_position = position;
}

stc::TokenType stc::Token::type() const
{
    return m_type;
}

std::string stc::Token::lexeme() const
{
    return m_lexeme;
}

stc::TokenType stc::Token::typeByLexeme(const std::string& lexeme)
{
    // variables
    if (lexeme == "let")
        return TokenType::LET;
    if (lexeme == "const")
        return TokenType::CONST;

    // type
    if (lexeme == "number")
        return TokenType::NUMBER;
    if (lexeme == "boolean")
        return TokenType::BOOLEAN;
    if (lexeme == "void")
        return TokenType::VOID;
    if (lexeme == "string")
        return TokenType::STRING;


    // cycles
    if (lexeme == "for")
        return TokenType::FOR;
    if (lexeme == "while")
        return TokenType::WHILE;
    if (lexeme == "do")
        return TokenType::DO_WHILE;


    // cycles addition
    if (lexeme == "break")
        return TokenType::BREAK;
    if (lexeme == "continue")
        return TokenType::CONTINUE;

    // conditions
    if (lexeme == "if")
        return TokenType::IF;
    if (lexeme == "else")
        return TokenType::ELSE;

    // relationship operators
    if (lexeme == ">")
        return TokenType::GREATER;
    if (lexeme == "<")
        return TokenType::LESS;
    if (lexeme == "<=")
        return TokenType::LESS_EQUAL;
    if (lexeme == ">=")
        return TokenType::GREATER_EQUAL;

    // equal operators
    if (lexeme == "==")
        return TokenType::EQUAL;
    if (lexeme == "!=")
        return TokenType::NOT_EQUAL;

    // bitwise operators
    if (lexeme == "&")
        return TokenType::BITWISE_AND;
    if (lexeme == "|")
        return TokenType::BITWISE_OR;


    // logical operators
    if (lexeme == "&&")
        return TokenType::AND;
    if (lexeme == "||")
        return TokenType::OR;

    // math operators
    if (lexeme == "+")
        return TokenType::PLUS;
    if (lexeme == "-")
        return TokenType::MINUS;
    if (lexeme == "*")
        return TokenType::STAR;
    if (lexeme == "/")
        return TokenType::SLASH;
    if (lexeme == "++")
        return TokenType::INC;
    if (lexeme == "--")
        return TokenType::DEC;

    // brackets
    if (lexeme == "{")
        return TokenType::LBRA;
    if (lexeme == "}")
        return TokenType::RBRA;
    if (lexeme == "(")
        return TokenType::LPAR;
    if (lexeme == ")")
        return TokenType::RPAR;
    if (lexeme == "[")
        return TokenType::LSQR;
    if (lexeme == "]")
        return TokenType::RSQR;


    // assign
    if (lexeme == "=")
        return TokenType::ASSIGN;
    if (lexeme == "+=")
        return TokenType::ADD_ASSIGN;
    if (lexeme == "-=")
        return TokenType::SUB_ASSIGN;
    if (lexeme == "*=")
        return TokenType::MUL_ASSIGN;
    if (lexeme == "/=")
        return TokenType::DIV_ASSIGN;

    // function
    if (lexeme == "function")
        return TokenType::FUNCTION;
    if (lexeme == "return")
        return TokenType::RETURN;

    // new
    if (lexeme == "new")
        return TokenType::NEW;

    // boolean values
    if (lexeme == "true")
        return TokenType::TRUE;
    if (lexeme == "false")
        return TokenType::FALSE;

    // other symbols
    if (lexeme == ";")
        return TokenType::SEMICOLON;
    if (lexeme == ":")
        return TokenType::COLON;
    if (lexeme == ",")
        return TokenType::COMMA;
    if (lexeme == ".")
        return TokenType::POINT;
    if (lexeme == "?")
        return TokenType::QUESTION;
    if (lexeme == "!")
        return TokenType::EXCLAMATION;

    // comment
    if (lexeme == "//")
        return TokenType::LINE_COMMENT;
    if (lexeme == "/*")
        return TokenType::BLOCK_COMMENT_START;
    if (lexeme == "*/")
        return TokenType::BLOCK_COMMENT_END;


    if (lexeme == "declare")
        return TokenType::DECLARE;
    if (lexeme == "import")
        return TokenType::IMPORT;
    if (lexeme == "export")
        return TokenType::EXPORT;
    if (lexeme == "from")
        return TokenType::FROM;


    // classes
    if (lexeme == "class")
        return TokenType::CLASS;
    if (lexeme == "constructor")
        return TokenType::CONSTRUCTOR;
    if (lexeme == "private")
        return TokenType::PRIVATE;
    if (lexeme == "public")
        return TokenType::PUBLIC;
    if (lexeme == "protected")
        return TokenType::PROTECTED;
    if (lexeme == "static")
        return TokenType::STATIC;
    if (lexeme == "this")
        return TokenType::THIS;

    if (lexeme == "interface")
        return TokenType::INTERFACE;


    if (isNumber(lexeme))
        return TokenType::NUMBER_CONST;

    if (isString(lexeme))
        return TokenType::STRING_CONST;


    if (isCorrectIdentifier(lexeme))
        return TokenType::IDENTIFIER;
    else
        ErrorHandle::report(nullptr, nullptr, ReportLevel::FatalError, "incorrectIdentifier", "Lexical error! Incorrect identifier '" + lexeme + "'!");
}

bool stc::Token::isNumber(const std::string& lexeme)
{
    bool point = false;

    for (const char& s : lexeme)
    {
        if (s == '.' && !point)
        {
            point = true;
            continue;
        }

        if (s == '.')
        {
            return false;
        }

        if (s < '0' || s > '9')
        {
            return false;
        }
    }

    return true;
}

bool stc::Token::isString(const std::string& lexeme)
{
    return lexeme.front() == '"' && lexeme.back() == '"' ||
           lexeme.front() == '\'' && lexeme.back() == '\'' ||
           lexeme.front() == '`' && lexeme.back() == '`';
}

bool stc::Token::isThisTypeIsVariableType(stc::TokenType type)
{
    return type == TokenType::NUMBER ||
           type == TokenType::BOOLEAN ||
           type == TokenType::VOID ||
           type == TokenType::STRING;
}

bool stc::Token::isUnaryOperator(TokenType type)
{
    return type == TokenType::PLUS ||
           type == TokenType::MINUS ||
           type == TokenType::EXCLAMATION;
}

bool stc::Token::isAssignmentOperator(stc::TokenType type)
{
    return type == TokenType::ASSIGN ||
           type == TokenType::ADD_ASSIGN ||
           type == TokenType::SUB_ASSIGN ||
           type == TokenType::MUL_ASSIGN ||
           type == TokenType::DIV_ASSIGN;
}

void stc::Token::print() const
{
    Log::write("Token: ");

    bool logInOutputStream = Log::loggedInOutputStream();

    if (logInOutputStream)
        cout << std::setw(30) << std::left << ("'" + m_lexeme + "'");


    Log::setLogInOutputStream(false);
    Log::write("'" + m_lexeme + "'");
    Log::setLogInOutputStream(logInOutputStream);

    Log::write(" Type: ");

    if (logInOutputStream)
        cout << std::setw(20) << std::left << ("'" + tokenTypeToString(m_type) + "'");


    Log::setLogInOutputStream(false);
    Log::write("'" + tokenTypeToString(m_type) + "'");
    Log::setLogInOutputStream(logInOutputStream);

    Log::write("Start Line: ");

    if (logInOutputStream)
        cout << std::setw(10) << std::left << ("'" + std::to_string(m_position.startLine) + "'");


    Log::setLogInOutputStream(false);
    Log::write("'" + std::to_string(m_position.startLine) + "'");
    Log::setLogInOutputStream(logInOutputStream);

    Log::write("Start Pos: ");

    if (logInOutputStream)
        cout << std::setw(10) << std::left << ("'" + std::to_string(m_position.startPos) + "'");

    logInOutputStream = Log::loggedInOutputStream();
    Log::setLogInOutputStream(false);
    Log::write("'" + std::to_string(m_position.startPos) + "'");


    Log::setLogInOutputStream(logInOutputStream);
    Log::write("  End Line: ");

    if (logInOutputStream)
        cout << std::setw(10) << std::left << ("'" + std::to_string(m_position.endLine) + "'");


    Log::setLogInOutputStream(false);
    Log::write("'" + std::to_string(m_position.endLine) + "'");
    Log::setLogInOutputStream(logInOutputStream);

    Log::write("End Pos: ");

    if (logInOutputStream)
        cout << std::setw(10) << std::left << ("'" + std::to_string(m_position.endPos) + "'");

    logInOutputStream = Log::loggedInOutputStream();
    Log::setLogInOutputStream(false);
    Log::write("'" + std::to_string(m_position.endPos) + "'");

    Log::setLogInOutputStream(logInOutputStream);
    Log::write("\n");
}

bool stc::Token::isCorrectIdentifier(const std::string& lexeme)
{
    if (!isalpha(lexeme[0]) && lexeme[0] != '_')
        return false;

    for (const auto& symbol : lexeme)
        if (!isalpha(symbol) && !isdigit(symbol) && symbol != '_')
            return false;

    return true;
}

bool stc::Token::isVisibilityModifier(stc::TokenType type)
{
    return type == TokenType::PUBLIC ||
           type == TokenType::PRIVATE ||
           type == TokenType::PROTECTED;
}

stc::string stc::Token::tokenTypeToString(stc::TokenType type)
{
    switch (type)
    {

        case TokenType::NUMBER_CONST:
            return "Number Constant";
        case TokenType::STRING_CONST:
            return "String Constant";
        case TokenType::IDENTIFIER:
            return "Identifier";
        case TokenType::LET:
            return "Let";
        case TokenType::CONST:
            return "Const";
        case TokenType::NUMBER:
            return "Number";
        case TokenType::BOOLEAN:
            return "Boolean";
        case TokenType::STRING:
            return "String";
        case TokenType::VOID:
            return "Void";
        case TokenType::ANY:
            return "Any";
        case TokenType::DO_WHILE:
            return "Do While";
        case TokenType::WHILE:
            return "While";
        case TokenType::FOR:
            return "For";
        case TokenType::BREAK:
            return "Break";
        case TokenType::CONTINUE:
            return "Continue";
        case TokenType::IF:
            return "If";
        case TokenType::ELSE:
            return "Else";
        case TokenType::LESS:
            return "Less";
        case TokenType::GREATER:
            return "Greater";
        case TokenType::LESS_EQUAL:
            return "Less Equal";
        case TokenType::GREATER_EQUAL:
            return "Greater Equal";
        case TokenType::EQUAL:
            return "Equal";
        case TokenType::NOT_EQUAL:
            return "Not Equal";
        case TokenType::AND:
            return "&&";
        case TokenType::OR:
            return "||";
        case TokenType::PLUS:
            return "+";
        case TokenType::MINUS:
            return "-";
        case TokenType::STAR:
            return "*";
        case TokenType::SLASH:
            return "/";
        case TokenType::INC:
            return "++";
        case TokenType::DEC:
            return "--";
        case TokenType::LBRA:
            return "{";
        case TokenType::RBRA:
            return "}";
        case TokenType::LPAR:
            return "(";
        case TokenType::RPAR:
            return ")";
        case TokenType::LSQR:
            return "[";
        case TokenType::RSQR:
            return "]";
        case TokenType::ASSIGN:
            return "=";
        case TokenType::ADD_ASSIGN:
            return "+=";
        case TokenType::SUB_ASSIGN:
            return "-=";
        case TokenType::MUL_ASSIGN:
            return "*=";
        case TokenType::DIV_ASSIGN:
            return "/=";
        case TokenType::FUNCTION:
            return "Function";
        case TokenType::RETURN:
            return "Return";
        case TokenType::TRUE:
            return "True";
        case TokenType::FALSE:
            return "False";
        case TokenType::SEMICOLON:
            return ";";
        case TokenType::COLON:
            return ":";
        case TokenType::COMMA:
            return ",";
        case TokenType::POINT:
            return ".";
        case TokenType::QUESTION:
            return "?";
        case TokenType::EXCLAMATION:
            return "!";
        case TokenType::LINE_COMMENT:
            return "Line Comment";
        case TokenType::BLOCK_COMMENT_START:
            return "Block Comment Start";
        case TokenType::BLOCK_COMMENT_END:
            return "Block Comment End";
        case TokenType::NEW:
            return "New";
        case TokenType::DECLARE:
            return "Declare";
        case TokenType::IMPORT:
            return "Import";
        case TokenType::EXPORT:
            return "Export";
        case TokenType::FROM:
            return "From";

        case TokenType::CLASS:
            return "Class";
        case TokenType::CONSTRUCTOR:
            return "Constructor";
        case TokenType::PRIVATE:
            return "Private";
        case TokenType::PUBLIC:
            return "Public";
        case TokenType::PROTECTED:
            return "Protected";
        case TokenType::STATIC:
            return "Static";
        case TokenType::THIS:
            return "This";
        case TokenType::INTERFACE:
            return "Interface";
        case TokenType::BITWISE_AND:
            return "&";
        case TokenType::BITWISE_OR:
            return "|";
        default:
            return "";

    }
}

bool stc::Token::isComment() const
{
    return  m_type == TokenType::BLOCK_COMMENT_START ||
            m_type == TokenType::LINE_COMMENT;
}

const stc::Position& stc::Token::position() const
{
    return m_position;
}
