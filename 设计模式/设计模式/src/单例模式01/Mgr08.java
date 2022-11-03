package 单例模式01;

//通过枚举，不止可以解决线程同步，还可以防止反序列化。
//反编译后枚举是一个abstact class
public enum Mgr08 {
    INSTANCE;
    public void m() {}

    public static void main(String[] args) {
        for ( int i = 0; i < 100; i++ ){
            new Thread(()-> {
                System.out.println(Mgr08.INSTANCE.hashCode());
            }).start();
        }
    }
}
