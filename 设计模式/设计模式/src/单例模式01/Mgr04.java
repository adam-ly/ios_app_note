package 单例模式01;


//在Mgr03的基础上加上锁保证其线程安全，但加锁会影响性能，与懒加载优化性能的初衷冲突
public class Mgr04 {

    private static Mgr04 INSTANCE;

    private Mgr04(){};

    private static synchronized Mgr04 getInstance() {
        if (INSTANCE == null){
            //模拟增加构造方法的耗时,用来测试并发中懒加载的缺点
            try{
                Thread.sleep(1);
            }catch (InterruptedException e) {
                System.out.println(e);
            }
            INSTANCE = new Mgr04();
        }
        return INSTANCE;
    }

    public void m() {  System.out.println("m"); }

    public static void main(String[] args) {
        for (int i = 0; i < 100; i ++){
            new Thread(()->
                    System.out.println(Mgr04.getInstance().hashCode())
            ).start();
        }
    }

}
