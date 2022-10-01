## **一、isTransluction是什么？**

1、isTransluction是navigationbar的半透明属性，默认为true。意味着navigationbar顶部view会添加一个半透明的图层。此时UIView的顶部延伸到导航栏的下面，被导航栏挡住部分。

![isTransluction为true](/Users/mac/Desktop/ios_app_note/iOS-UI知识点/0-文档/img/isTransluction为true.png)

2、如果isTransluction == false，意味则为完全不透明状态，显示的背景色为barTintColor。由于不透明，系统自动将UIView的顶部放到导航栏下面。

![image-20220904185935772](/Users/mac/Desktop/ios_app_note/iOS-UI知识点/0-文档/img/image-20220904185935772.png)

3、如果为navigationbar设置了图片,不管图片有没有透明度，当translation == true时，系统会自动处理图片，让它变得半透明（虽然不明显）。