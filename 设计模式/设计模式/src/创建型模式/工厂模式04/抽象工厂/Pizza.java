package 创建型模式.工厂模式04.抽象工厂;

public abstract class Pizza {
    String name;
    Dough dough;
    Cheese cheese;
    Clams clams;
    Sauce sauce;

    abstract void prepare();

    void bake() {
        System.out.print(name + " bake for 25 mins ");
    }

    void cut() {
       System.out.print("cut the pizza into small slices");
    }

    void box() {
        System.out.print("place pizza in the box");
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return "Pizza{" +
                "name='" + name + '\'' +
                ", dough=" + dough +
                ", cheese=" + cheese +
                ", clams=" + clams +
                ", sauce=" + sauce +
                '}';
    }
}

