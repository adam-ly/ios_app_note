//
//  BaseView.swift
//  UIView生命周期
//
//  Created by MAC on 2022/8/30.
//

import UIKit

class BaseView: UIView {

    // xib
    override func awakeFromNib() {
        super.awakeFromNib()
        print("view" + #function)
    }
    
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        print("view + " + #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        print("view + " + #function)
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        print("view + " + #function)
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
        print("view + " + #function)
    }
        
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("view + " + #function + "\n newSuperview = \(newSuperview)")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("view + " + #function + "\n superview = \(superview)")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        print("view + " + #function + "\n window = \(newWindow)")
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("view + " + #function)
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("view + " + #function)
    }
            
    override func layoutSubviews() {
        super.layoutSubviews()
        print("view + " + #function)
    }
    
    // 将接收器的整个边界矩形标记为需要重新绘制。
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("view + " + #function)
    }
    
    override func setNeedsDisplay(_ rect: CGRect) {
        super.setNeedsDisplay(rect)
        print("view + " + #function + " rect = \(rect)")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print(#function)
    }
}


