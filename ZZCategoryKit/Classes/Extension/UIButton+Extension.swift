//
//  UIButton+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/5/3.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation

extension UIButton {
    
    /// 创建一个UIButton <通用>
    /// - Parameters:
    ///   - title: title
    ///   - titleColor: titleColor
    ///   - fontSize: fontSize
    ///   - backgroundColor: backgroundColor
    ///   - cornerRadius: cornerRadius
    ///   - borderWidth: borderWidth
    ///   - borderColor: borderColor
    /// - Returns: button
    static func initButton(_ title: String,
                           _ titleColor: UIColor,
                           _ fontSize: CGFloat,
                           _ backgroundColor: UIColor = UIColor.white,
                           _ cornerRadius: CGFloat = 0,
                           _ borderWidth: CGFloat = 0,
                           _ borderColor: UIColor = UIColor.clear) -> UIButton {
        let button = UIButton.init()
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        if cornerRadius > 0 {
            button.layer.cornerRadius = cornerRadius
        }
        if borderWidth > 0 {
            button.layer.borderWidth = borderWidth
            button.layer.borderColor = borderColor.cgColor
        }
        return button
    }
    
    static func createButton(_ title: String, _ titleColor: UIColor, _ fontSize: CGFloat, _ backgroundColor: UIColor? = UIColor.white) -> UIButton {
        let button = UIButton.init()
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        return button
    }
    
    static func createButton(_ title: String, _ titleColor: UIColor, _ fontSize: CGFloat, _ backgroundColor: UIColor, _ cornerRadius: CGFloat, _ borderColor: UIColor, _ borderWidth: CGFloat) -> UIButton {
        let button = UIButton.init()
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth
        return button
    }
    
    static func createButton(_ imageName: String) -> UIButton {
        let button = UIButton.init()
        button.setImage(UIImage.init(named: imageName), for: .normal)
        return button
    }
}
