package 命令模式.Demo02;

public class NoCommand implements Command{

    public void excute() {
        System.out.println("do nothing");
    }

    @Override
    public void undo() {

    }
}
