package 适配器模式;

public class Main {
    public static void main(String[] args) {
        MallardDuck duck = new MallardDuck();

        Turkey turkey = new WildTurkey();
        TurkeyAdapter t = new TurkeyAdapter(turkey);

        duck.fly();
        duck.quack();;

        t.fly();
        t.quack();

    }
}
