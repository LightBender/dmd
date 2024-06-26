/*
REQUIRED_ARGS: -HC -c -o-
PERMUTE_ARGS:
TEST_OUTPUT:
---
// Automatically generated by Digital Mars D Compiler

#pragma once

#include <assert.h>
#include <math.h>
#include <stddef.h>
#include <stdint.h>

struct S final
{
    union
    {
        int32_t x;
        char c[4$?:32=u|64=LLU$];
    };
    struct
    {
        int32_t y;
        double z;
        void bar();
    };
    struct
    {
        int32_t outerPrivate;
    };
    struct
    {
        int32_t innerPrivate;
        int32_t innerBar;
    };
    S() :
        y(),
        z(),
        outerPrivate(),
        innerPrivate(),
        innerBar()
    {
    }
    S(int32_t y, double z = NAN, int32_t outerPrivate = 0, int32_t innerPrivate = 0, int32_t innerBar = 0) :
        y(y),
        z(z),
        outerPrivate(outerPrivate),
        innerPrivate(innerPrivate),
        innerBar(innerBar)
        {}
};

extern void foo();
---
*/

extern (C++) struct S
{
    union
    {
        int x;
        char[4] c;
    }

    struct
    {
        int y;
        double z;
        extern(C) void foo() {}
        extern(C++) void bar() {}
    }

    // Private not emitted because AnonDeclaration has no protection
    private struct
    {
        int outerPrivate;
    }

    public struct {
        // Private cannot be exported to C++
        private int innerPrivate;
        int innerBar;
    }
}

extern (D)
{
    extern(C++) void foo() {}
}
