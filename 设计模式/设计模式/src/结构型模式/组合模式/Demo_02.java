package 结构型模式.组合模式;

// 订单系统。购物车金额 = 产品盒子（包含多个产品）+ 盒子/单个产品
import java.util.ArrayList;

// component（描述了简单和复杂对象的通用操作）
abstract class Order {
    int price;
    abstract int getPrice();
}

// leaf
class Product extends Order {
    @Override
    int getPrice() {
        return this.price;
    }
}

// composite
class Box extends Order {
    ArrayList<Product> products = new ArrayList<>();
    @Override
    int getPrice() {
        return products.stream()
                .mapToInt( (p) -> p.price )
                .reduce(0,(a,b) -> a + b);
    }

    void insertProduct(Product product) {
        products.add(product);
    }
}

public class Demo_02 {
    public static void main(String[] args) {
        Product product = new Product();
        product.price = 10;

        Product product1 = new Product();
        product1.price = 20;

        Product product2 = new Product();
        product2.price = 30;

        Box box = new Box();
        box.insertProduct(product);
        box.insertProduct(product1);
        box.insertProduct(product2);

        System.out.print("total amount = " + box.getPrice()); // 60
    }
}
