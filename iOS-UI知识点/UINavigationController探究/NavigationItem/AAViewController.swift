//
//  AAViewController.swift
//  NavigationItem
//
//  Created by MAC on 2022/9/5.
//

import UIKit

class AAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(type(of: self))"
    }
    
    @IBAction func jump(_ sender: Any) {
        self.navigationController?.pushViewController(BBViewController(), animated: true)        
    }
    
}
