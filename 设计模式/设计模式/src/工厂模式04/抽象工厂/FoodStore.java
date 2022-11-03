package 工厂模式04.抽象工厂;

class NYFoodStore extends FoodStoreFactory {
    @Override
    void prepareFood() {
        pizza = new NYPiazza();
        hambergar = new NYHambergar();
        juice = new NYJuice();

        //do something..
        pizza.cut();
        juice.addSugar();
        hambergar.createHambergar();
    }
}

class ChicagoFoodStore extends FoodStoreFactory {
    @Override
    void prepareFood() {
        pizza = new ChicagoPizza();
        hambergar = new ChicagoHambergar();
        juice = new ChicagoJuice();

        //do something..
        pizza.cut();
        juice.addSugar();
        hambergar.createHambergar();
    }
}