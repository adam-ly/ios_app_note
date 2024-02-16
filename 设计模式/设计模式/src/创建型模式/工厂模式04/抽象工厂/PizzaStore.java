package 创建型模式.工厂模式04.抽象工厂;

public abstract class PizzaStore {
    void orderPizza(String name) {
        Pizza h = createPizza(name);
        h.prepare();
        h.bake();
        h.box();
    }
    abstract Pizza createPizza(String name);
}

class NYPizzaStore extends PizzaStore {

    @Override
    Pizza createPizza(String name) {
        Pizza pizza = null;
        PizzaIngredientFactory ingredientFactory = new NYPizzaIngredientFactory();

        switch (name) {
            case "NewYork":
                pizza = new NewYorkPizza(ingredientFactory);
            case "Chicago":
                pizza = new ChicagoPizza(ingredientFactory);
        }
        return pizza;
    }
}