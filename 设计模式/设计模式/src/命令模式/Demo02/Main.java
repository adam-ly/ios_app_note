package 命令模式.Demo02;

public class Main {
    public static void main(String[] args) {
        RemoteControl control = new RemoteControl();

        LightOnCommand lightOnCommand = new LightOnCommand();
        LightOffCommand lightOffCommand = new LightOffCommand();
        control.setCommand(0,lightOnCommand,lightOffCommand);

        Stereo s = new Stereo();
        StereoOnWithCDCommand stereoOnWithCDCommand = new StereoOnWithCDCommand(s);
        StereoOffCommand stereoOffCommand = new StereoOffCommand(s);
        control.setCommand(1,stereoOnWithCDCommand,stereoOffCommand);

        CeillingLightOnCommand ceillingLightOnCommand = new CeillingLightOnCommand();
        CeillingLightOffCommand ceillingLightOffCommand = new CeillingLightOffCommand();
        control.setCommand(2,ceillingLightOnCommand,ceillingLightOffCommand);

        control.onButtonWasPushed(1);
        control.offButtonWasPushed(1);
    }
}
