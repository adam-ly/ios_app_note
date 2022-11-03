package 命令模式.Demo02;

class LightOnCommand implements Command{

    public void excute() {
        System.out.println("Light on");
    }

    public void undo(){
        System.out.println("Light off");
    }
}

class LightOffCommand implements Command{

    public void excute() {
        System.out.println("Light off");
    }

    public void undo(){
        System.out.println("Light on");
    }
}
