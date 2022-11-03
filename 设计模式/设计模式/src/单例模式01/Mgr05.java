package 单例模式01;

public class Mgr05 {
    private static Mgr05 INSTANCE;

    private Mgr05(){};

    private static Mgr05 getInstance() {
        if (INSTANCE == null){
            //相比Mgr04，试图通过减小同步代码卡的方式提高效率，不可行⚠️
            //因为多个线程可能同时走到这一步，需要在判断前就停止
            synchronized(Mgr05.class){
                try{
                    Thread.sleep(1);
                }catch (InterruptedException e) {
                    System.out.println(e);
                }
                INSTANCE = new Mgr05();
            }
        }
        return INSTANCE;
    }

    public void m() {  System.out.println("m"); }

    public static void main(String[] args) {
        for (int i = 0; i < 100; i ++){
            new Thread(()->
                    System.out.println(Mgr05.getInstance().hashCode())
            ).start();
        }
    }
}
