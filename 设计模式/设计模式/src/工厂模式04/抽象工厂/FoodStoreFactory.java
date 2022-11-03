package 工厂模式04.抽象工厂;


public abstract class FoodStoreFactory {
     protected JuiceFactory juice;
     protected PizzaFactory pizza;
     protected HambergarFactory hambergar;

     //提供套餐
     void prepareFood(){}
}
