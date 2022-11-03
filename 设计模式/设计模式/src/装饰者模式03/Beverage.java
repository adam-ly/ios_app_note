package 装饰者模式03;

//相当于抽象component类
public abstract class Beverage {

    String description = "Unknown Beverage";

    public String getDescription() {
        return description;
    }

    public abstract float cost();
}
