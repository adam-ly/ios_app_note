package 命令模式.Demo01;

public class Main {
    public static void main(String[] args) {

        //注意 这里的light 和 match 是两个没有共同行为的类，不能用工厂方法去约束。
        SimpleRemoteControl remoteControl = new SimpleRemoteControl();

        remoteControl.setCommand(new LightOnCommand(new Light()));
        remoteControl.buttonWasPressed();

        remoteControl.setCommand(new MatchOnCommand(new Match()));
        remoteControl.buttonWasPressed();
    }
}
