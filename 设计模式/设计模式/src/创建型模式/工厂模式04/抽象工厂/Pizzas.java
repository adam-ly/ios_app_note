package 创建型模式.工厂模式04.抽象工厂;

class NewYorkPizza extends Pizza {

    // Pizza 跟 原料是完全解耦的，
    PizzaIngredientFactory ingredientFactory;

    public NewYorkPizza(PizzaIngredientFactory ingredientFactory) {
        this.ingredientFactory = ingredientFactory;
    }

    // 原料的类型完全决定于传入的具体原料工厂。
    @Override
    void prepare() {
        System.out.print("Preparing +" + name);
        dough = ingredientFactory.createDough();
        sauce = ingredientFactory.createSauce();
        cheese = ingredientFactory.createCheese();
    }
}

class ChicagoPizza extends Pizza {

    // Pizza 跟 原料是完全解耦的，
    PizzaIngredientFactory ingredientFactory;

    public ChicagoPizza(PizzaIngredientFactory ingredientFactory) {
        this.ingredientFactory = ingredientFactory;
    }

    // 原料的类型完全决定于传入的具体原料工厂。
    @Override
    void prepare() {
        System.out.print("Preparing +" + name);
        cheese = ingredientFactory.createCheese();
        dough = ingredientFactory.createDough();
        sauce = ingredientFactory.createSauce();
        clams = ingredientFactory.createClams();
    }
}

