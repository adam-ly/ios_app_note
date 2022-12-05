package 装饰者模式03;

// 这里抽象多一层作为装饰者。Coffee都是被装饰者。
public abstract class CondimentDecrator extends Beverage {
    //给子类重写description方法，目的是为了与Coffee区分，
    public abstract String getDescription();
}

// 牛奶
class Milk extends CondimentDecrator{

    Beverage bervage;
    public Milk(Beverage b){
        bervage = b;
    }

    public float cost() {
        return bervage.cost() + 10;
    }

    @Override
    public String getDescription() {
        return bervage.getDescription() + ",milk";
    }
}

// 摩卡
class Mocha extends CondimentDecrator{

    Beverage bervage;
    public Mocha(Beverage b){
        bervage = b;
    }

    public float cost() {
        return bervage.cost() + 3;
    }

    @Override
    public String getDescription() {
        System.out.println(bervage.getDescription());
        return bervage.getDescription() + ",mocha";
    }
}

// 奶泡
class Soy extends CondimentDecrator{

    Beverage bervage;
    public Soy(Beverage b){
        bervage = b;
    }

    public float cost() {
        return bervage.cost() + 3;
    }

    @Override
    public String getDescription() {
        return bervage.getDescription() + ",soy";
    }
}
