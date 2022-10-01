参考资料: http://www.zzvips.com/article/162275.html

1、通过_isshowbackbutton控制页面是否允许右滑。

```
- (void)viewdidload { 
 // 解决右滑返回失效问题
 self.navigationcontroller.interactivepopgesturerecognizer.delegate = self;
}

 // 是否允许右滑返回
- (void)viewdidappear:(bool)animated {
 [super viewdidappear:animated]; 
 [self.navigationcontroller.interactivepopgesturerecognizer setenabled:_isshowbackbutton];
}
```



2、**uiscrollview 页面中失效**

当使用 uiscrollview 、uitableview 、uicollectionview 等滑动视图的左右滑动时，滑动手势就会和右滑返回的手势冲突，右滑返回就会失效，解决办法只要加入下面这句代码即可。

```
[scrollview.pangesturerecognizer requiregesturerecognizertofail:self.navigationcontroller.interactivepopgesturerecognizer];
```

3、**uiwebview 页面中失效**

uiwebview 页面比较特殊，不仅右滑返回会失效，自定义的手势也会全部失效，因为 uiwebview 中已经内部集成了点击、滑动等多个手势，上面的方法在 uiwebview 中并没有作用，解决办法是加入以下允许多个手势并发的代理方法。

```
// 允许多个手势并发
- (bool)gesturerecognizer:(uigesturerecognizer *)gesturerecognizer shouldrecognizesimultaneouslywithgesturerecognizer:(uigesturerecognizer *)othergesturerecognizer {
 return yes;
}
```

