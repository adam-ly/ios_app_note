//
//  UINavigationExtension.swift
//  NavigationItem
//
//  Created by MAC on 2022/9/5.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func global_setNavigationBackIcon(_ icon: UIImage,_ target:Any? = nil,_ selector: Selector? = nil) {
        let backButton = UIBarButtonItem.init(image: icon, style: .done, target: target, action: selector)        
        self.navigationBar.backItem?.backBarButtonItem = backButton
    }
    
    func global_setNavigationBackIconOnly(_ icon: UIImage) {
//        let backItem = UIBarButtonItem()
//        backItem.title = ""
//        self.navigationBar.backIndicatorImage = icon
//        self.navigationBar.backIndicatorTransitionMaskImage = icon
//        self.navigationItem.backBarButtonItem = backItem
        
        let btn = UIButton.init(frame: .init(origin: .zero, size: icon.size))
        let backItem = UIBarButtonItem.init(customView: btn)
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
}


extension UIViewController {
    
    func setNavigationBackIcon(_ icon:UIImage?,_ title: String = "") {
        
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
