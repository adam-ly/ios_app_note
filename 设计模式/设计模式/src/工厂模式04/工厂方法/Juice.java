package 工厂模式04.工厂方法;

// 工厂即接口，用接口来规定产品的行为和特性

class DetroiJuice implements JuiceFactory {
    @Override
    public void addSugar() {
        System.out.println("什么都不用加");
    }
}

class NYJuice implements JuiceFactory {
    @Override
    public void addSugar() {
        System.out.println("加奶精");
    }
}

class ChicagoJuice implements JuiceFactory {
    @Override
    public void addSugar() {
        System.out.println("加糖");
    }
}
