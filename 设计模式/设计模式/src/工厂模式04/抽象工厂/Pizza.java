package 工厂模式04.抽象工厂;

import 工厂模式04.抽象工厂.Cheese;
import 工厂模式04.抽象工厂.Clams;
import 工厂模式04.抽象工厂.Dough;
import 工厂模式04.抽象工厂.Sauce;

public abstract class Pizza {
    String name;
    Dough dough;
    Cheese cheese;
    Clams clams;
    Sauce sauce;

    abstract void prepare();

    void bake() {
        System.out.print(name + " bake for 25 mins ");
    }

    void cut() {
       System.out.print("cut the pizza into small slices");
    }

    void box() {
        System.out.print("place pizza in the box");
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Pizza{" +
                "name='" + name + '\'' +
                ", dough=" + dough +
                ", cheese=" + cheese +
                ", clams=" + clams +
                ", sauce=" + sauce +
                '}';
    }
}

