//
//  ThirdViewController.swift
//  设置导航栏背景颜色
//
//  Created by MAC on 2022/9/4.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(type(of: self))"
        
        /**修改导航栏的背景颜色方法三：
           1、通过设置纯色背景图片改变背景颜色。
           2、transluction会影响图片的半透明效果。
         */
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageWithColor(color: .orange), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let view = self.navigationController?.navigationBar.subviews.first {
            view.alpha = 1.0
        }
    }
    
    //MARK: - 导航栏渐变
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {        
        if let view = self.navigationController?.navigationBar.subviews.first {
            view.alpha = view.alpha - 0.05
        }
    }
}
