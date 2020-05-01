#pragma once

#include <string>

namespace stc
{
    using std::string;

enum class ClassVisibilityModifier
{
    PUBLIC,
    PRIVATE,
    PROTECTED
};

class Class
{


public:
    static ClassVisibilityModifier modifierFromString(const string& value)
    {
        if (value == "public")
            return ClassVisibilityModifier::PUBLIC;
        if (value == "private")
            return ClassVisibilityModifier::PRIVATE;
        if (value == "protected")
            return ClassVisibilityModifier::PROTECTED;

        return ClassVisibilityModifier::PUBLIC;
    }

    static string modifierToString(ClassVisibilityModifier modifier)
    {
        switch (modifier)
        {
            case ClassVisibilityModifier::PUBLIC:
                return "public";
            case ClassVisibilityModifier::PRIVATE:
                return "private";
            case ClassVisibilityModifier::PROTECTED:
                return "protected";

            default:
                return "";
        }
    }
};

}