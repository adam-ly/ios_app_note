//
//  SecondViewController.swift
//  设置导航栏背景颜色
//
//  Created by MAC on 2022/9/4.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "backgroundcolor"
        
        /**修改导航栏的背景颜色方法二：
           1、当transluction为true时，意味着开启半透明效果，此时设置背景图片为透明。
           2、设置backgroundColor可以看到navigationbar的颜色
           3、如果设置transluction为false，那么系统还是会为透明图片添加一个白色图层。
           4、
         */
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(named: "1"), for: .default)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor = .yellow
        self.navigationController?.navigationBar.frame = CGRect.init(origin: .zero, size: CGSize.init(width: UIScreen.main.bounds.width, height: 64))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.navigationBar.isTranslucent = !(self.navigationController?.navigationBar.isTranslucent)!
        print("istransluction为 = \(self.navigationController?.navigationBar.isTranslucent)")
    }
    
    @IBAction func click(_ sender: Any) {
//        if let view = self.navigationController?.navigationBar.subviews.last {
//            view.alpha = view.alpha - 0.05
//        }
    }
    
}
