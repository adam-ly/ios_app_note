package 工厂模式04.抽象工厂;

public class Main {
    public static void main(String[] args) {

        // FoodStore用一个抽象类 来管理其他的工厂，这里FoodStore就作为一个抽象工厂
        // 抽象工厂包含多个产品类的抽象，在《产品族维度》上进行拓展，

        FoodStoreFactory nyFoodStore = new NYFoodStore();
        nyFoodStore.prepareFood();

        FoodStoreFactory ccgFoodStore = new ChicagoFoodStore();
        ccgFoodStore.prepareFood();
    }
}
