//
//  ViewController.swift
//  UIView生命周期
//
//  Created by MAC on 2022/8/30.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /* 使用storyboard时，控制器的构造器为init(coder:)。
       该构造器为必须构造器required，因此重写其他构造器时，都必须重写该构造器。
     */
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("使用storyboard时 构造器为：" + #function)
    }
    
    //使用storyboard时才会调用
    //使用该方法时，必须保证outlet和action连接完成
    //必须调用super避免不必要的错误
    override func awakeFromNib() {
        super.awakeFromNib()
        print(#function)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let vc = TestViewController.init(nibName: "TestViewController", bundle: nil) as? TestViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

