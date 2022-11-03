package 装饰者模式03;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.LineNumberInputStream;

public class Demo {
    public static void main(String[] args) {

        //这里通过继承，目的是为了获得同样的类型，而不是行为！
        //同样也可以使用接口约束类型

        Beverage b = new Decaf();
        System.out.println( "description : " + b.getDescription() + "\n price : " + b.cost());
        b = new Mocha(b);
        System.out.println( "description : " + b.getDescription() + "\n price : " + b.cost());
        b = new Soy(b);
        System.out.println( "description : " + b.getDescription() + "\n price : " + b.cost());
        b = new Milk(b);
        System.out.println( "description : " + b.getDescription() + "\n price : " + b.cost());

        FileInputStream s;
        BufferedInputStream d;
        LineNumberInputStream a;
    }
}
