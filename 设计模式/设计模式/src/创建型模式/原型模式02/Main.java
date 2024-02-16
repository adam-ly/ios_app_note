package 创建型模式.原型模式02;

public class Main {
    /** 场景： 如果想复制一个对象，那么必须新建一个相似的类，并遍历原始对象的所有成员变量，然后一一赋值
        问题： 1、无法访问原始对象的私有成员
              2、只能访问到实例，无法知道其所属的类。
        结论： 从外部复制对象并非总是可行。
        方案： 将克隆过程委派给被克隆的实际对象。 即提供一个接口，里面有一个 copy 方法，并克隆的对象实现这个接口，
              对外的实例只需调用copy 即可返回一个副本。
              被复制的对象称之为原型。
    */
    public static void main(String[] args) {
         ConcretePrototype type0 = new ConcretePrototype("Name",12);
         ConcretePrototype type1 = type0.copy();
         System.out.print(type1.name + "\n");
         System.out.print(type1.age);
    }
}

interface Prototype {
    public Object copy();
}

class ConcretePrototype implements Prototype {
    String name = "";
    Integer age = 1;

    public ConcretePrototype(String name,Integer age) {
        this.name = name;
        this.age = age;
    }
    private ConcretePrototype(ConcretePrototype type) {
        this.name = type.name;
        this.age = type.age;
    }

    @Override
    public ConcretePrototype copy() {
        return new ConcretePrototype(this);
    }
}
