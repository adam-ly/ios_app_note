package 创建型模式.工厂模式04.抽象工厂;

public interface PizzaIngredientFactory {
     Dough createDough();
     Clams createClams();
     Sauce createSauce();
     Cheese createCheese();
}

// 纽约风味的原料
class NYPizzaIngredientFactory implements PizzaIngredientFactory {

     @Override
     public Dough createDough() {
          return new NewYorkDough();
     }

     @Override
     public Clams createClams() {
          return new NewYorkClams();
     }

     @Override
     public Sauce createSauce() {
          return new NewYorkSauce();
     }

     @Override
     public Cheese createCheese() {
          return new NewYorkCheese();
     }
}

// 芝加哥风味的原料
class CGOPizzaIngredientFactory implements PizzaIngredientFactory {

     @Override
     public Dough createDough() {
          return new ChicagoDough();
     }

     @Override
     public Clams createClams() {
          return new ChicagoClams();
     }

     @Override
     public Sauce createSauce() {
          return new ChicagoSauce();
     }

     @Override
     public Cheese createCheese() {
          return new ChicagoCheese();
     }
}