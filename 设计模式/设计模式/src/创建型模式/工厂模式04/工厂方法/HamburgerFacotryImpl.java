package 创建型模式.工厂模式04.工厂方法;


// 工厂模式中让子类各自负责自己的生产方法 这里是createHamburger

class NewYorkHamburgerFactory extends HamburgerFactory {

    @Override
    Hamburger createHamburger(String name) {
        switch (name) {
            case "hotdog": return new HotdogHamburger();
            case "seafood": return new SeafoodHamburger();
            default:break;
        }
        return null;
    }
}

class ChicagoHamburgerFactory extends HamburgerFactory {

    @Override
    Hamburger createHamburger(String name) {
        switch (name) {
            case "hotdog": return new HotdogHamburger();
            case "vega": return new VegaHamburger();
            default:break;
        }
        return null;
    }
}
