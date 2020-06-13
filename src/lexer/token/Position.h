#pragma once
#include "../../utils/utils.h"

namespace stc
{


class Position
{
public:
    size_t startPos;
    size_t endPos;
    size_t startLine;
    size_t endLine;

public:
    Position()
    {
        this->startPos = 0;
        this->endPos = 0;
        this->startLine = 1;
        this->endLine = 1;
    }

    Position(const size_t& startPosition, const size_t& endPosition, const size_t& startLine, const size_t& endLine)
    {
        this->startPos = startPosition;
        this->endPos = endPosition;
        this->startLine = startLine;
        this->endLine = endLine;
    }

public:
    string toString() const
    {
        return Utils::sprintf("%u,%u:%u,%u", startPos, startLine, endPos, endLine);
    }

};

}