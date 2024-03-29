package 创建型模式.生成器模式03;

public class Main {
    /***
     * 场景：需要生成的产品，它有大量的成员变量和方法以及复杂的内部结构，并且可能有其他与其部分相似的类。
     * 问题：该类的构建方法需要传入大量的参数，导致代码臃肿且不灵活。不同的类对相同的参数和方法需要重复定义。
     * 方案：1、通过《组合》的方式，将属性或行为与构建方法剥离出来，在需要的类进行装配即可。
     *      2、此举可以将构建和它的表示分离，在同样的构建过程下可以创建不同的对象。
     *      3、可以隐藏具体的构建过程和细节。只要给出相应类型和内容，建造者模式负责按顺序创建复杂对象。
     * 和抽象工厂有什么不同：
     *     1、抽象工厂返回一系列的相关产品，或者说可以返回一个产品族。
     *        建造者模式返回一个组装好的完成产品。
     *     2、抽象工厂中，客户端实例化工厂类。调用工厂方法获取产品对象。如：Factory f = new CakeFactory();
     *        而在创建者模式中，客户直接通过Director来指导如何生成对象。包括其组装过程和步骤。侧重于一步步构建一个复杂对象。
     *     3、抽象工厂可以理解为一个汽车装备工厂，负责生产《各种》《零部件》。
     *        建造者模式可以理解为汽车生产线，负责组装《各种》《完整的汽车》。
     */

    public static void main(String[] args) {

    }
}
