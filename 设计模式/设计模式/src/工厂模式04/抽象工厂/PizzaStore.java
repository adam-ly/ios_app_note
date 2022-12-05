package 工厂模式04.抽象工厂;

import 工厂模式04.工厂方法.Hamburger;

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