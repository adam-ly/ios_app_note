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
        setupDefaultBackgroundForIos15()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 1 {
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = _hidesBottomBarWhenPushed
        }
        super.pushViewController(viewController, animated: animated)
    }
}

