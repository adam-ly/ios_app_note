package 创建型模式.单例模式01;

// 与第一种没区别
public class Mgr02 {
    //注意final必须被初始化，可以在static中或一开始声明的时候初始化
    private static final Mgr02 INSTANCE;
    static {
        INSTANCE = new Mgr02();
    }

    public static Mgr02 getInstance(){
        return INSTANCE;
    }
    public void m(){ System.out.println("m"); }

    public static void main(String[] args) {
        Mgr02 m1 = Mgr02.getInstance();
        Mgr02 m2 = Mgr02.getInstance();
        System.out.println("result = " + (m1 == m2));
    }

}
