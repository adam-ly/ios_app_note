//
//  BaseNavigationController.swift
//  UINavigationController探究
//
//  Created by MAC on 2022/9/2.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    var _hidesBottomBarWhenPushed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationController?.interactivePopGestureRecognizer
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 1 {
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = _hidesBottomBarWhenPushed
            
        }
        super.pushViewController(viewController, animated: animated)
    }
}

extension BaseNavigationController {
    private func setupDefaultBackgroundForIos15() {
        // ios15 系统多了个scrollEdgeAppearance 属性，导致导航栏上方会透明。 TabbarController也一样
        if #available(iOS 15.0, *) {
             let app = UINavigationBarAppearance()
             app.configureWithDefaultBackground()  // 重置背景和阴影颜色//
             app.backgroundColor = .purple
             UINavigationBar.appearance().scrollEdgeAppearance = app  // 带scroll滑动的页面
             UINavigationBar.appearance().standardAppearance = app // 常规页面。描述导航栏以标准高度
             UINavigationBar.appearance().compactAppearance = app
             UINavigationBar.appearance().compactScrollEdgeAppearance
        }
    }
}
