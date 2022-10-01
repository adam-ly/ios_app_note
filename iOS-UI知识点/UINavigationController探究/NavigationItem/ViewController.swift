//
//  ViewController.swift
//  NavigationItem
//
//  Created by MAC on 2022/9/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(type(of: self))"
        
        // 一、设置backItem只会在下一个页面生效。后续的页面不变。
//        let btn = UIBarButtonItem.init(title: "左按钮1", style: .done, target: nil, action:nil)
//        self.navigationItem.backBarButtonItem = btn
//        self.navigationController?.navigationBar.backItem?.backBarButtonItem = btn                
        
        // 二、通过自定义btn作为customview，是比较稳妥的做法。
        self.setNavigationBackIcon(UIImage.init(named: "back1")!,"回退")
    }
    
    @IBAction func jump(_ sender: Any) {
        self.navigationController?.pushViewController(AAViewController(), animated: true)
    }
    
}

