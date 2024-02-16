package 创建型模式.工厂模式04.工厂方法;

public abstract class Hamburger {
    String name;
    String sauce;
    void prepare() {
        System.out.print("prepare " + name + "\n");
    }

    void bake() {
        System.out.print(name + " baking \n");
    }

    void box() {
        System.out.print(name + " box \n");
    }

    public String getName() {
        return name;
    }
}
