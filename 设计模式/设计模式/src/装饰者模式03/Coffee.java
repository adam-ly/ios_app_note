package 装饰者模式03;

//相当于component类
class HouseBlend extends Beverage{
    public HouseBlend(){
        description = "house blend";
    }
    @Override
    public float cost() {
        return 12;
    }
}

//烘焙
class DarkRoast extends Beverage{
    public DarkRoast(){
        description = "dark roast";
    }
    @Override
    public float cost() {
        return 14;
    }
}

//浓缩咖啡
class Espresso extends Beverage{

    public Espresso(){
        description = "espresso";
    }

    @Override
    public float cost() {
        return 7;
    }
}

//低卡咖啡
class Decaf extends Beverage{

    public Decaf(){
        description = "Decaf";
    }

    @Override
    public float cost() {
        return 11;
    }
}