package 创建型模式.单例模式01;

/**
 * 懒加载
 * 缺点：虽然做到了按需加载，但却有线程安全问题，比如多个线程同时执行到判断语句，都判断到为空，那么不同线程会new出不同对象。
 */

public class Mgr03 {
    private static Mgr03 INSTANCE;

    private Mgr03(){};

    private static Mgr03 getInstance() {
        if (INSTANCE == null){
            //模拟增加构造方法的耗时,用来测试并发中懒加载的缺点
            try{
                Thread.sleep(1);
            }catch (InterruptedException e) {
                System.out.println(e);
            }
            INSTANCE = new Mgr03();
        }
        return INSTANCE;
    }

    public void m() {  System.out.println("m"); }

    public static void main(String[] args) {
        for (int i = 0; i < 100; i ++){
            new Thread(()->
                System.out.println(Mgr03.getInstance().hashCode())
            ).start();
        }
    }
}
