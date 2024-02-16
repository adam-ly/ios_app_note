package 创建型模式.生成器模式03;

// builder 定义参数和行为
abstract class Builder {
    // 这里的方法可以添加参数
    void setupWindow() {} // 安装窗户
    void setupDoor() {} // 安装门
    void setupAirCondition() {} // 安装空调
    void setupSofa() {} // 安装沙发
    void setupBed() {} // 安装床

    abstract House getHouse();
}

// 具体的builder，通过创建不同的builder生产不同的产品。可以选择性的实现部分方法对《不同》产品进行定义和装配。
class SmallHouseBuilder extends Builder {
    private House house;

    public SmallHouseBuilder() {
        house = new House();
    }

    @Override
    void setupWindow() {
        house.setWindow("小窗户");
    }

    @Override
    void setupDoor() {
        house.setDoor("小门户");
    }

    @Override
    void setupAirCondition() {
        house.setAirCondition("小空调");
    }

    @Override
    void setupSofa() {
        house.setSofa("小沙发");
    }

    @Override
    void setupBed() {
        house.setBed("小床");
    }

    @Override
    House getHouse() {
        return house;
    }
}

// 管理者，对builder的构建过程进一步封装，用户不需要知道对象的细节。
// 只需要传入不同的对象类型便可以获得具体的对象。
class Director {

    public static void main(String[] args) {
        // 通过指挥中心生成统一流程的构建 （不灵活）
        Director director = new Director();
        director.build( new SmallHouseBuilder() );
//        director.build( new BigHouseBuilder() ); // 通过相同的构建流程创建不同的产品

        // 不通过指挥中心直接灵活构建,按照不同顺序和参数以及所需的流程构建。
        SmallHouseBuilder builder = new SmallHouseBuilder();
//        builder.setupWindow("迷你窗户"); //
//        builder.setupBed("迷你床");
    }

    // Director 类的作用就是统一整个构建流程。
    public House build(Builder builder) {
        builder.setupBed();
        builder.setupDoor();
        builder.setupAirCondition();
        builder.setupSofa();
        builder.setupWindow();
        return builder.getHouse();
    }
}

// Product
class House {
    private String window;
    private String door;
    private String airCondition;
    private String sofa;
    private String bed;

    public void setWindow(String window) {
        this.window = window;
    }

    public void setDoor(String door) {
        this.door = door;
    }

    public void setAirCondition(String airCondition) {
        this.airCondition = airCondition;
    }

    public void setSofa(String sofa) {
        this.sofa = sofa;
    }

    public void setBed(String bed) {
        this.bed = bed;
    }

    @Override
    public String toString() {
        return "House{" +
                "window='" + window + '\'' +
                ", door='" + door + '\'' +
                ", airCondition='" + airCondition + '\'' +
                ", sofa='" + sofa + '\'' +
                ", bed='" + bed + '\'' +
                '}';
    }
}
