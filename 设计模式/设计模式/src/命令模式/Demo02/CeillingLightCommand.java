package 命令模式.Demo02;

class CeillingLightOnCommand implements Command {

    public void excute() {
        System.out.println("ceilling lights on");
    }

    public void undo(){
        System.out.println("ceilling lights off");
    }
}

class CeillingLightOffCommand implements Command {
    public void excute() {
        System.out.println("ceilling lights off");
    }

    public void undo(){
        System.out.println("ceilling lights on");
    }
}
