//
//  UIView+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/4/27.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation

extension UIView {
    
    static func createViewWithBackgroundColor(color: UIColor) -> UIView {
        let view = UIView.init()
        view.backgroundColor = color
        return view
    }
    
    func addSubViews(array: Array<UIView>) {
        for item in array {
            self.addSubview(item)
        }
    }
    
    var viewController: UIViewController? {
        var next = superview
        while (next != nil) {
            let nextResponder = next?.next
            if (nextResponder is UIViewController) {
                return nextResponder as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
}
