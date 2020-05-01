interface Number2
{
    toString(): string;

    toFixed(fractionDigits: number): string;
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




test.setId(100);