package 设计原则.策略模式_组合优于继承_01;

interface SwimBehavior  {
    void swim();
}

class SwimWithFeet implements SwimBehavior {
    @Override
    public void swim() {
        System.out.print("swim normally");
    }
}

class SwimWithoutFeet implements SwimBehavior {
    @Override
    public void swim() {
        System.out.print("cant swim");
    }
}

