//
//
// interface Main
// {
//
//
//     f(b: number);
//
// }
//
// interface Main1
// {
//
//
//     f(b: number);
//
// }

class Class1
{
    constructor(value: string)
    {

    }

    static qw: number;

    value: number;

    private foo()
    {
        this.value = 100;
        this.d(100);

        Class1.f();

        Class1.qw = 100;

        Class1.f();
    }

    protected d(qwery: number)
    {

    }

    private static f()
    {

    }

}
//
// class Class extends Class1 implements Main
// {
//
//     f()
//     {
//
//     }
// }
//
// let b: Class = new Class1();
//
// b.f();