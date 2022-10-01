//
//  ViewController.swift
//  UINavigationController探究
//
//  Created by MAC on 2022/8/30.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "haha"
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .yellow
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

