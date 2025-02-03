package 结构型模式.组合模式;

import java.util.ArrayList;

// 以文件系统举例，文件系统就是典型的树状结构，文件是leaf，文件夹就是composite.
interface Component {
    void add(Component component);
    void remove(Component component);
    void getInfo();
}

// Leaf
class File implements Component {
    @Override
    public void add(Component component) {
         System.out.print("cannot add file");
    }

    @Override
    public void remove(Component component) {
        System.out.print("cannot remove file");
    }

    @Override
    public void getInfo() {
        System.out.print("File Info");
    }
}

// Composite
class Folder implements Component {
    ArrayList<Component> files = new ArrayList<Component>();

    @Override
    public void add(Component component) {
        files.add(component);
    }

    @Override
    public void remove(Component component) {
        files.remove(component);
    }

    @Override
    public void getInfo() {
        System.out.print("");
    }
}

public class Demo_01 {
    public static void main(String[] args) {
        File file1 = new File();
        File file2 = new File();
        File file3 = new File();

        file1.getInfo();

        Folder folder = new Folder();
        folder.add(file1);
        folder.add(file2);
        folder.add(file3);
        folder.getInfo();
    }
}
