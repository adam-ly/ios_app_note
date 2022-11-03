package 单例模式01;

// 多数时候这种写法是可以接受的
public class Mgr01 {
    private static final Mgr01 INSTANCE = new Mgr01();

    //通过私有化禁止别人调用普通的初始化方法
    private Mgr01(){};

    public static Mgr01 getInstance() { return  INSTANCE; }

    public void m(){ System.out.println("m"); }

    public static void main(String[] args) {
        Mgr01 m1 = Mgr01.getInstance();
        Mgr01 m2 = Mgr01.getInstance();
        System.out.println("result = " + (m1 == m2));
    }

}
