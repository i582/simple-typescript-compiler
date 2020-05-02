interface Number2
{
    toString(): number;

    toFixed(fractionDigits: number): number;
}

class Number
{
    sagas: number;

    toString(): number {}

    toFixed(fractionDigits: number): number {}
}

class Test
{
    public name: number;
    private id: number;

    constructor()
    {
        this.name = 0;
    }

    public getName(): number
    {
        return this.name;
    }

    public setId(id: number)
    {
        this.id = id;
    }

    public __operator_plus(num: number): number
    {
        return this.id + num;
    }
}

let object: Test;

object.getName();
