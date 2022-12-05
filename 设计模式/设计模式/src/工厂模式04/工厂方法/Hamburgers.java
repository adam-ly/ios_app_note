package 工厂模式04.工厂方法;

class VegaHamburger extends Hamburger {
    public VegaHamburger(){
        this.name = "vegahamburger";
    }

    @Override
    void prepare() {
        System.out.print("dont add sauce \n");
        super.prepare();
    }
}

class SeafoodHamburger extends Hamburger {
    public SeafoodHamburger(){
        this.name = "seafoodhamburger";
    }

    @Override
    void prepare() {
        System.out.print("add bbq sauce \n");
        super.prepare();
    }
}

class HotdogHamburger extends Hamburger {
    public HotdogHamburger(){
        this.name = "hotdoghamburger";
    }

    @Override
    void prepare() {
        System.out.print("cut the hot dot into small slices \n");
        super.prepare();
    }
}