package 设计原则.策略模式_组合优于继承_01;

public interface DisplayBehavior {
    void display();
}

class DisplayFuther implements DisplayBehavior {
    @Override
    public void display() {
        System.out.print("displaying futher");
    }
}

class DisplayColor implements DisplayBehavior {
    @Override
    public void display() {
        System.out.print("displaying color");
    }
}