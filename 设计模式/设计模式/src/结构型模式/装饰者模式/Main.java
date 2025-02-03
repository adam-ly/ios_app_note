package 结构型模式.装饰者模式;

/**
 * 装饰者模式 == 装饰器模式
 * 类似真实世界中人类需要穿衣服，可以一件一件的套上去，衣服拓展了人类的基本行为，但并不是人类的一部分，不需要时可以随时脱掉。
 *
 *            client
 *              ｜
 *         ｜interface  ｜
 *         ｜component  ｜
 *         ｜+excute()  ｜  ---------------------
 *              ｜                              ｜
 *         ｜Concrete component ｜        ｜Base Decorator ｜
 *         ｜+excute()  ｜                ｜wrappee: Component ｜
 *                                       ｜+BaseDecorator(c: Component) ｜  -> wrappee = c;
 *                                       ｜+excute() ｜                     -> wrappee.excute();
 *                                              ｜
 *                                        ｜Concrete Decorator ｜
 *                                        ｜+excute() ｜ -> { super.exucte(); extra(); }
 *                                        ｜+extra()  ｜
 * */

public class Main {
    public static void main(String[] args) {

    }
}
