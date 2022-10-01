//
//  TestViewController.swift
//  UIView生命周期
//
//  Created by MAC on 2022/8/30.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
        
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(#function)
    }

    /* 使用storyboard时，控制器的构造器为init(coder:)。
       该构造器为必须构造器required，因此重写其他构造器时，都必须重写该构造器。
     */
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print(#function)
    }

//    override func loadView() {
//        super.loadView()
//        print(#function)
//        self.view = BaseView()
//    }

    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        print(#function)
    }

//    //
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function + "frame = \(self.view.frame)")
        self.view.addSubview(BaseView(frame: CGRect.init(origin: .zero, size: CGSize.init(width: 100, height: 100))))
    }
//
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function + "frame = \(self.view.frame)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function + "frame = \(self.view.frame)")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(#function + "frame = \(self.view.frame)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function + "frame = \(self.view.frame)")
    }

    deinit {
        print("deinit")
    }
}
