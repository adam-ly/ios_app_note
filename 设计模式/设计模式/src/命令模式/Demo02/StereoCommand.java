package 命令模式.Demo02;

class Stereo {
    void off() { System.out.println("stereo off"); }
    void on() { System.out.println("stereo on"); }
    void setCD() { System.out.println("stereo set CD");  }
    void setVolume(int i) { System.out.println("volume == " + i); }
}

class StereoOnWithCDCommand implements Command {
    Stereo stereo;
    public StereoOnWithCDCommand(Stereo s) {
        this.stereo = s;
    }

    public void excute() {
        stereo.on();
        stereo.setCD();
        stereo.setVolume(11);
    }

    public void undo(){
        stereo.off();
    }
}

class StereoOffCommand implements Command {
    Stereo stereo;
    public StereoOffCommand(Stereo s) {
        this.stereo = s;
    }
    public void excute() {
        stereo.off();
    }

    public void undo(){
        stereo.on();
        stereo.setCD();
        stereo.setVolume(11);
    }
}
