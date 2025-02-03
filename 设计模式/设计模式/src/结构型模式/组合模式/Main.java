package 结构型模式.组合模式;

/**
 * 场景：
 * 问题：
 * 方案：
 * */
public class Main {
    public static void main(String[] args) {
        /**
         * 组合模式允许将对象组合成树形结构以表示"结构-整体"的层次结构，使得客户端对单个或组合对象的使用具有统一性。
         *
         * 1、组件接口描述了简单项目和复杂项目的共同操作
         * 2、叶节点是树的基本结构，不包含子项目
         * 3、容器包含《叶节点》或其它《容器》，只通过通用的组件接口与其子项目交互
         * 4、客户端通过组件接口与所有项目交互，客户端能用相同的方式与树状结构中的简单或复杂项目交互。
         *         client
         *           ｜ （ 客户端与接口交互 ）
         *      ｜interface ｜
         *      ｜Component ｜
         *      ｜+excute() ｜ <----------------
         *           ^                        ｜
         *           ^ implement              ｜
         *      ｜ Leaf     ｜         ｜Composite ｜
         *      ｜+excute() ｜         ｜children: Component[] ｜
         *                            ｜add(c: component) ｜
         *                            ｜remove(c: component) ｜
         *                            ｜getChildren -> (c: component) ｜
         *                            ｜+excute() ｜（将所有工作委派给子元素）
         * */
    }
}