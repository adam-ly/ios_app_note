package 设计原则.策略模式_组合优于继承_01;

//  策略模式：定义了算法族，分别封装，让他们可以自由相互替换。
//  原则是将不变和变化的部分区分，将变化的部分抽象为接口并提供相应的各种实现。利用组合的方式做到自由搭配
public class Demo {
    public static void main(String[] args) {

        // ❌ 用继承实现鸭子类
        BadDuck duck = new BadDuck();
        // 如果要实现不同的行为，就得创建多一个鸭子 + 重写所有的鸭子行为，
        // 如果某些鸭子的部分行为一致，那么会导致很多重复性的代码，
        BadWoodenDuck woodenDuck = new BadWoodenDuck();

        // ✅ 用组合实现鸭子类，用行为描述类。所有的行为都是可重复使用，并且无需创建多一个鸭子类。
        GoodDuckBehavior goodDuck = new GoodDuck(new FlyWithWing(),new SwimWithFeet(), new DisplayFuther());
        goodDuck.performDisplay();
        goodDuck.performFly();
        goodDuck.performSwim();

        // ✅ 通过传入的具体行为(fly,swim)等定义了一个木头鸭子。它不会飞不会游泳，只有颜色可以展示。
        GoodDuckBehavior goodWoodenDuck = new GoodDuck(new FlyWithoutWing(), new SwimWithoutFeet(), new DisplayColor()) ;
        goodWoodenDuck.performDisplay();
        goodWoodenDuck.performFly();
        goodWoodenDuck.performSwim();

        // ✅ 也可以直接创建好新的类，在初始化中定义好行为,并且开放行为修改。
        GoodMiniDuck miniDuck = new GoodMiniDuck();
        miniDuck.performDisplay();
        miniDuck.setFly(new FlyWithoutWing());
        miniDuck.performFly();
        miniDuck.performSwim();

        //
    }
}


