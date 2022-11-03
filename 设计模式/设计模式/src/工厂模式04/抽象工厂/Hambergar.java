package 工厂模式04.抽象工厂;

class DetroiHambergar implements HambergarFactory {
    @Override
    public void createHambergar() {
        System.out.println("detrio hambergar");
    }
}

class NYHambergar implements HambergarFactory {
    @Override
    public void createHambergar() {
        System.out.println("newYork hambergar");
    }
}

class ChicagoHambergar implements HambergarFactory {
    @Override
    public void createHambergar() {
        System.out.println("chicago hambergar");
    }
}
