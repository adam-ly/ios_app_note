package 结构型模式.桥接模式;

/**
 * 场景：开发中有些类随着时间变得庞大，功能覆盖多个维度。假设这个类为 Shape，拓展出两个（形状）子类为 circle、square、border.
 *      如果想拓展各种形状颜色和边框都不同的类,那么需要创建 颜色 * 形状 * 边框 数量的类。
 * 问题：每次新增或者拓展一个维度（颜色/形状）都需要创建大量的类。维度之前的耦合度太高。需要将这些维度进行分离。
 * 方案：将每个维度（颜色、形状）进行分离，使其成为每个独立的类层次。通过组合的方式去替代类的继承，能大量的较少类的创建。
 *      在这个组合过程中，分为抽象部分，定义了客户端要使用的接口，实现部分则提供了底层的实现。
 * tips：其实就是讲 m*n 个类变成 m+n 个类，这 m + n 个类能有 m*n 种不同的组合。
*/
public class Main {
    public static void main(String[] args) {

        /** 抽象部分一般是多个实体中的共同行为，行为的具体实现交给实现层。
         *  1、抽象部分的具体方法中，通过调用实现层的方法来实现。 +feature() { i.method(); }
         *  2、抽象层可以进一步继承拓展方法。
         *
         *          Client
         *            ｜
         *     ｜Abstraction ｜              ｜ interface｜
         *     ｜-i: implementation ｜ ----> ｜ +methord1() ｜
         *     ｜+ feature1() ｜             ｜ +methord2() ｜
         *     ｜+ feature1() ｜             ｜ +methord3() ｜
         *           ｜                             ｜
         *     ｜Redefined Abstration ｜     ｜ concrete implementation ｜    //具体实现
         *     ｜ +featureN() ｜
         * */


    }
}
