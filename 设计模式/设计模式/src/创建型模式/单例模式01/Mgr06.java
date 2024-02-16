package 创建型模式.单例模式01;

public class Mgr06 {
    //volatile方式在JIT指令重排可能出现的问题
    private static volatile Mgr06 INSTANCE;

    private Mgr06(){};

    private static Mgr06 getInstance() {
        // 外面的一层判断去掉虽然可以，但是最好还是需要。因为可以让大多数线程一进来走到这里就不需要往下执行，
        // 避免再次进入锁里面的方法，减少代码执行的步骤。
        if (INSTANCE == null){
            //相比Mgr05，在锁的范围里面加多一层判断，可有效防止线程不安全的弊端
            synchronized(Mgr06.class){
                if (INSTANCE == null){
                    try{
                        Thread.sleep(1);
                    }catch (InterruptedException e) {
                        System.out.println(e);
                    }
                    INSTANCE = new Mgr06();
                }
            }
        }
        return INSTANCE;
    }

    public void m() {  System.out.println("m"); }

    public static void main(String[] args) {
        for (int i = 0; i < 100; i ++){
            new Thread(()->
                    System.out.println(Mgr06.getInstance().hashCode())
            ).start();
        }
    }
}
