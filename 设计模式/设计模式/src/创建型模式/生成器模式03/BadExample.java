package 创建型模式.生成器模式03;

public class BadExample {
    // 可以看到CarA 和 CarB 都是比较复杂的类，并且有部分相似的成员变量。
    // 导致其构建方法及其臃肿，每次创建时都需要传入大量的参数。创建不同但相似的类也会造成代码的重复。
}

/// 这里的成员变量在实际情况中很可能是其他类型。
class CarA {
    String name;
    String engine;
    String radia;
    String gps;
    String seats;
    String screen;
    String wheels;

    /// 臃肿的构建
    public CarA(String name, String engine, String radia, String gps, String seats, String screen, String wheels) {
        this.name = name;
        this.engine = engine;
        this.radia = radia;
        this.gps = gps;
        this.seats = seats;
        this.screen = screen;
        this.wheels = wheels;
    }
}

class CarB {
    String name;
    String engine;
    String radia;
    String gps;
    String seats;
    // diff
    String brand;
    String mirror;

    /// 臃肿的构建
    public CarB(String name, String engine, String radia, String gps, String seats, String brand, String mirror) {
        this.name = name;
        this.engine = engine;
        this.radia = radia;
        this.gps = gps;
        this.seats = seats;
        this.brand = brand;
        this.mirror = mirror;
    }
}
