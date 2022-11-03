package 设计原则.策略模式_组合优于继承_01;

interface BadDuckBehavior {
    void fly();
    void swim();
    void display();
}

class BadDuck implements BadDuckBehavior {

    @Override
    public void fly() {
       System.out.print("bad duck fly");
    }

    @Override
    public void swim() {
        System.out.print("bad duck swim");
    }

    @Override
    public void display() {
        System.out.print("bad duck display");
    }
}

class BadWoodenDuck implements BadDuckBehavior {

    @Override
    public void fly() {
        System.out.print("BadWoodenDuck dont fly");
    }

    @Override
    public void swim() {
        System.out.print("BadWoodenDuck dont swim");
    }

    @Override
    public void display() {
        System.out.print("BadWoodenDuck display");
    }
}