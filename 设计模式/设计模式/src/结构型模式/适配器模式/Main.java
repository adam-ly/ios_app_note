package 结构型模式.适配器模式;

/**
 * 场景：需要同时使用一些类，被使用到的功能比较类似，但是底层实现和设计有很大不同。比如 client需要接受json数据并分析，
 *      但是目前只有 XmlData、TxtData两个类，它们的功能都是以某种格式提供数据，但都没有提供json格式。
 *      或者音乐播放器，需要解析播放音乐，但是音乐有 mp3.mp4.等解析器类。
 * 问题：在类上直接添加功能，会破坏类本身的结构。不符合开闭原则。
 * 方案：
 *
 * */
public class Main {
    public static void main(String[] args) {

    }
}
