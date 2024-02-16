package 结构型模式.适配器模式;

/// 类适配器

/// 场景：电脑只有一个TypeC口，但是网线，屏幕线，U盘都无法直接插上，所以需要一个转接口来做适配。
public class ClassAdapterDemo {
    public static void main(String[] args) {
        // 对于用户端来说，它们只需要直接使用适配器类/接口即可。
        TypeCAdapter internetCable = new InternetCableSub();
        TypeCAdapter flashDrive    = new FlashDriveSub();
        TypeCAdapter screenCable   = new ScreenCableSub();

        // 这样就全部转换成 typec 接口了。
        internetCable.typecPort();
        flashDrive.typecPort();
        screenCable.typecPort();
    }
}

interface TypeCAdapter {
    void typecPort();
}

/// 对于现有的类来说，不能直接修改其方法，违反了封闭原则。
// 网线类
class Internetcable {  void cablePort() { System.out.print("网线口"); } }
// 闪存盘
class FlashDrive {  void port() { System.out.print("USB口"); } }
// 视频高清线
class ScreenCable{  void cablePort() { System.out.print("HDMI口"); } }

class InternetCableSub extends Internetcable implements TypeCAdapter {
    @Override  void cablePort() { super.cablePort(); }
    @Override public void typecPort() { System.out.print("TypeC port"); }
}

class FlashDriveSub extends FlashDrive implements TypeCAdapter {
    @Override void port() { super.port(); }
    @Override public void typecPort() { System.out.print("TypeC port"); }
}

class ScreenCableSub extends ScreenCable implements TypeCAdapter {
    @Override  void cablePort() { super.cablePort(); }
    @Override  public void typecPort() { System.out.print("TypeC port"); }
}



