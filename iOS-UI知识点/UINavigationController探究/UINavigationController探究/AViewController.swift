//
//  AViewController.swift
//  UINavigationController探究
//
//  Created by MAC on 2022/9/2.
//

import UIKit

class AViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        // 是否将leftButton追加到backButton后面
//        self.navigationItem.leftItemsSupplementBackButton = true
//        let btn = UIBarButtonItem.init(title: "左按钮1", style: .done, target: self, action:#selector(click))
//        self.navigationItem.leftBarButtonItem = btn
        
//        let leftBtn1 = UIBarButtonItem.init(title: "左1", style: .done, target: self, action: #selector(click))
//        let leftBtn2 = UIBarButtonItem.init(title: "左2", style: .done, target: self, action: #selector(click))
//        self.navigationItem.leftBarButtonItems = [leftBtn1,leftBtn2]
//
//        let rightBtn1 = UIBarButtonItem.init(title: "右1", style: .done, target: self, action: #selector(click))
//        let rightBtn2 = UIBarButtonItem.init(title: "右2", style: .done, target: self, action: #selector(click))
//        self.navigationItem.rightBarButtonItems = [rightBtn1,rightBtn2]
        
//        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
//
        let btn = UIButton.init(type: .system)
        btn.setImage(UIImage.init(named: "back"), for: .normal)
        btn.setTitle("返回按钮", for: .normal)
        btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        btn.setTitleColor(.red, for: .normal)
        let barbuttonItem = UIBarButtonItem.init(customView: btn)
        self.navigationItem.leftBarButtonItem = barbuttonItem
                
    }
    
    @objc func click() {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("\(self)" + #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(self)" + #function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(self)" + #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(self)" + #function)
    }
}

extension AViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(AViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
