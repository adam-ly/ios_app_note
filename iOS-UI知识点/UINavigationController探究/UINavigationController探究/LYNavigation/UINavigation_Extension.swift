//
//  UINavigation_Extension.swift
//  UINavigationController探究
//
//  Created by MAC on 2022/9/2.
//

import Foundation
import UIKit

extension UINavigationController {
    func removeShadow() {
        navigationBar.shadowImage = UIImage()
    }
}

extension UINavigationBar {
    
}

// 拓展UIViewController导航栏相关的方法
extension UIViewController {
    
    
    func setBackButtonTitle(_ title:String) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: title, style: .done, target: self, action:nil)
    }
    
    //
    func setBackButtonItemForCurrentPage(_ title:String) {
        
    }
    
    
}
