package 设计原则.策略模式_组合优于继承_01;

interface GoodDuckBehavior {
    void performFly();
    void performSwim();
    void performDisplay();
}
public class GoodDuck implements GoodDuckBehavior {
    FlyBehavior fly;
    SwimBehavior swim;
    DisplayBehavior display;
    public GoodDuck (FlyBehavior flyBehavior,SwimBehavior swimBehavior,DisplayBehavior displayBehavior) {
        fly = flyBehavior;
        swim = swimBehavior;
        display = displayBehavior;
    }
    @Override public void performFly() { fly.fly(); }
    @Override public void performSwim() { swim.swim(); }
    @Override public void performDisplay() { display.display(); }
}

class GoodMiniDuck implements GoodDuckBehavior {
    FlyBehavior fly;
    SwimBehavior swim;
    DisplayBehavior display;
    public GoodMiniDuck () {
        fly = new FlyWithWing();
        swim = new SwimWithFeet();
        display = new DisplayFuther();
    }

    public void setFly(FlyBehavior flyBehavior) {
        fly = flyBehavior;
    }

    @Override public void performFly() { fly.fly(); }
    @Override public void performSwim() { swim.swim(); }
    @Override public void performDisplay() { display.display(); }
}

