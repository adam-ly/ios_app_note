package 结构型模式.桥接模式;

// 抽象部分定义了客户端使用的高层接口, 在这里大部分设备都可以开关机，调节频道、音量等
abstract class Remote {
    Device device;
    void toggleDown() { device.disable(); }
    void toggleUp() { device.enable(); }
    void volumeDown() { device.setVolume(); }
    void volumeUp() { device.setVolume(); }
    void channelDown() { device.setChannel(); }
    void channelUp() { device.setChannel(); }
}

// 实现层，具体的实现由设备自身决定
interface Device {
    void enable();
    void disable();
    void getVolume();
    void setVolume();
    void setChannel();
    void getChannel();
}

// 抽象子类可以拓展方法
class TeleVesionRemote extends Remote {
    void playGame(){ }
}

class RadioRemote extends Remote {
    void checkVolume() { device.getVolume(); }
    void getChannel() { device.getChannel(); }
}

class TV implements Device {
    @Override public void enable() { System.out.print("enable TV");}
    @Override public void disable() { System.out.print("disable TV"); }
    @Override public void getVolume() { System.out.print("get tv volume"); }
    @Override public void setVolume() { System.out.print("set tv volume"); }
    @Override public void setChannel() { System.out.print("tv set channel"); }
    @Override public void getChannel() { System.out.print("tv get channel"); }
}

class Radio implements Device {
    @Override public void enable() { System.out.print("enable radio");}
    @Override public void disable() { System.out.print("disable radio"); }
    @Override public void getVolume() { System.out.print("get radio volume"); }
    @Override public void setVolume() { System.out.print("set radio volume"); }
    @Override public void setChannel() { System.out.print("radio set channel"); }
    @Override public void getChannel() { System.out.print("radio get channel"); }
}

public class Demo_01 {
    public static void main(String[] args) {
        // 控制电视机
        Device tv = new TV();
        Remote tvRemote = new TeleVesionRemote();
        tvRemote.device = tv;
        tvRemote.toggleDown(); // 客户端使用的是抽象层定义的行为

        // 控制无线电
        Device radio = new Radio();
        Remote radioRemote = new RadioRemote();
        radioRemote.device = radio;
        radioRemote.toggleDown();

    }
}
