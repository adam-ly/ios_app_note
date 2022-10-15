//
//  UINavigation_Extension.swift
//  UINavigationController探究
//
//  Created by MAC on 2022/9/2.
//

import Foundation
import UIKit

extension UINavigationController {
    
    
    private func setBackgroundColor(_ color: UIColor = .white) -> {
        if #available(iOS 11.0, *) { // > 11
            self.navigationController?.navigationBar.barTintColor = color
        } else  if #available(iOS 15.0, *) { // > 15
            setupDefaultBackgroundForIos15(color)
        } else { // < 11
            self.navigationController?.navigationBar.backgroundColor = color
        }
    }
    
    // ios15 系统多了个scrollEdgeAppearance 属性，导致导航栏上方会透明。 TabbarController也一样
    private func setupDefaultBackgroundForIos15(_ color:UIColor = .white) {
        if #available(iOS 15.0, *) {
             let app = UINavigationBarAppearance()
             app.configureWithDefaultBackground()  // 重置背景和阴影颜色//
             app.backgroundColor = .purple
             UINavigationBar.appearance().scrollEdgeAppearance = app  // 带scroll滑动的页面
             UINavigationBar.appearance().standardAppearance = app // 常规页面。描述导航栏以标准高度
             UINavigationBar.appearance().compactAppearance = app
             UINavigationBar.appearance().compactScrollEdgeAppearance = app
        }
    }
    
    // 去掉底部黑线
    func removeShadow() {
        navigationBar.shadowImage = UIImage()
    }
    
    // 设置导航栏背景图片
    func setupBackgroundImage(_ image:UIImage) {
        navigationBar.setBackgroundImage(image, for: .default)
    }        
    
}

// 拓展UIViewController导航栏相关的方法
extension UIViewController {
    
    // 设置返回标题，只在下一个页面生效
    func setBackButtonItemForNextPage(_ title:String) {
        let btn = UIBarButtonItem.init(title: title, style: .done, target: nil, action:nil)
        self.navigationItem.backBarButtonItem = btn
        self.navigationController?.navigationBar.backItem?.backBarButtonItem = btn
    }
    
    // 设置当前页面的返回标题
    func setNavigationBackIconForCurrentPage(_ icon:UIImage?,_ title: String = "",_ renderMode: RenderingMode = .alwaysTemplate) {
        
        let backItem = UIBarButtonItem.init()
        backItem.title = title
        navigationItem.backBarButtonItem = backItem
        
        // 开启后会使用图片原来的颜色渲染，而不是navigationbar的tintColor
        if let backIcon = icon?.withRenderingMode(.alwaysTemplate) {
            // 设置返回按钮的图片，要两个方法一起调用才会正常生效
            navigationController?.navigationBar.backIndicatorImage = backIcon
            navigationController?.navigationBar.backIndicatorTransitionMaskImage = backIcon
        }
    }
    
}
