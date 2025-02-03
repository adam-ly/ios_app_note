package 结构型模式.桥接模式;

abstract class Drawer {
    Color c;
    Shape s;
    Border b;
    void draw() {
        c.setColor();
        s.makeShape();
        b.setupBorder();
    }
}

interface Color {
    void setColor();
}

interface Shape {
    void makeShape();
}

interface Border {
    void setupBorder();
}

class RedColor implements Color{
    @Override
    public void setColor() {
        System.out.print("red color");
    }
}

class Circle implements Shape {
    @Override
    public void makeShape() {
        System.out.print("make circle");
    }
}

class SolidBorder implements Border {
    @Override
    public void setupBorder() {
        System.out.print("make border solid");
    }
}

class SolidRedCircle extends Drawer {}

public class Demo_02 {
    public static void main(String[] args) {

        // 这里的类都可以复用
        Color red = new RedColor();
        Shape circle = new Circle();
        Border solidBorder = new SolidBorder();

        // 设置好drawer类
        Drawer d = new SolidRedCircle();
        d.c = red;
        d.b = solidBorder;
        d.s = circle;

        // 创建一个红色边框的圆形
        d.draw();
    }
}
