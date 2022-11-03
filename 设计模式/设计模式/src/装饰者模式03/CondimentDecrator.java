package 装饰者模式03;

public abstract class CondimentDecrator extends Beverage {
    //给子类重写description方法，目的是为了与Coffee区分
    public abstract String getDescription();
}

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
