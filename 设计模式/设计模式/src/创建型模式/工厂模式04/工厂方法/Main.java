package 创建型模式.工厂模式04.工厂方法;

public class Main {
    public static void main(String[] args) {

        // Factory中的生产是依赖于抽象的，具体由不同的factory子类去实现（实现生产prodcut的方法
        // 可以看到f1,f2都是直接依赖于抽象类HamburgerFactory。具体由new决定。
        // 具体生产什么类型、或多少种类型，则由不同的factory通过在orderHamburger中自行实现。
        HamburgerFactory f1 = new ChicagoHamburgerFactory();
        f1.orderHamburger("vega");

        HamburgerFactory f2 = new NewYorkHamburgerFactory();
        f2.orderHamburger("seafood");

    }
}
