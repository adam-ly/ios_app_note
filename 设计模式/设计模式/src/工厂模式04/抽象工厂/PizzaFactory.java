package 工厂模式04.抽象工厂;

public interface PizzaFactory {
    void prepare();
    void cut();
    void bake();
    void box();
}
