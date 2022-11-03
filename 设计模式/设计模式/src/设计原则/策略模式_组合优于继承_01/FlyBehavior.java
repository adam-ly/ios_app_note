package 设计原则.策略模式_组合优于继承_01;

//  ---------------- 飞行 ---------------- //
interface FlyBehavior {
    void fly();
}

class FlyWithWing implements FlyBehavior {
    @Override
    public void fly() {
        System.out.print("fly with wing");
    }
}

class FlyWithoutWing implements FlyBehavior {
    @Override
    public void fly() {
        System.out.print("cant fly");
    }
}
