package 单例模式01;
/**
 * ⚠️比较完美的写法：
 * 静态内部类方式
 * JVM保证单例
 * 加载外部类时不会加载内部类，这样可以实现懒加载！
 */
public class Mgr07 {
    private Mgr07(){};

    //创建一个静态内部类，内部类用到的时候才会被加载到，可以达到懒加载的效果
    //JVM加载类只会加载一次，所以内部类只会被加载一次，其中的Instance也用static修饰，所以内存中只有一份
    private static class Mgr07Holder{
        private final static Mgr07 INTSANCE = new Mgr07();
    }

    public static Mgr07 getInstance() {
        return Mgr07Holder.INTSANCE;
    }

    public void m() {  System.out.println("m"); }

    public static void main(String[] args) {
        for (int i = 0; i < 100; i ++){
            new Thread(()->
                    System.out.println(Mgr07.getInstance().hashCode())
            ).start();
        }
    }
}
