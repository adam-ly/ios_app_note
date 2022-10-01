//
//  ViewController.swift
//  设置导航栏背景颜色
//
//  Created by MAC on 2022/9/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
           
        /**修改导航栏的背景颜色方法一：
         普通样式的导航栏设置 bartintColor即可改变背景颜色。backgroundColor部分会被挡住
         */
        self.navigationController?.navigationBar.barTintColor = .yellow
        
        // 设置backGroundColor无效，会被挡住
//        self.navigationController?.navigationBar.backgroundColor = .red
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(view.frame)
    }
    
    // transluction == true , 系统会将navigationbar自动添加一个模糊效果。并改变view的frame
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.navigationBar.isTranslucent = !(self.navigationController?.navigationBar.isTranslucent)!        
        print("istransluction为 = \(self.navigationController?.navigationBar.isTranslucent)")
    }
    
}


