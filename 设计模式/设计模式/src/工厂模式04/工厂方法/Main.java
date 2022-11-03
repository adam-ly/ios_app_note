package 工厂模式04.工厂方法;

public class Main {
    public static void main(String[] args) {

        //可以看到 所谓的工厂模式 其中的工厂其实就是JuiceFactory这个抽象，然后根据具体情况实例化对应类型的实例。
        JuiceFactory juice01 = new NYJuice();
        JuiceFactory juice02 = new ChicagoJuice();
        JuiceFactory juice03 = new DetroiJuice();
    }
}
