//
//  UINavigationExtension.swift
//  设置导航栏背景颜色
//
//  Created by MAC on 2022/9/5.
//

import Foundation
import UIKit

extension UINavigationController {
    // 去掉底部黑线
    func removeShadow() {
        navigationBar.shadowImage = UIImage()
    }
    
    // 设置背景图片
    func setupBackgroundImage(_ image:UIImage) {
        navigationBar.setBackgroundImage(image, for: .default)
    }
}
