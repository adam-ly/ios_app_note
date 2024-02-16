package 创建型模式.工厂模式04.工厂方法;

public abstract class HamburgerFactory {
    void orderHamburger(String name) {
         // 依赖倒置原则：。
         Hamburger h = createHamburger(name);
         h.prepare();
         h.bake();
         h.box();
    }
    abstract Hamburger createHamburger(String name);
}
