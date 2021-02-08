//
//  UITextField+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/5/3.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation

private var placeholderColorKey: UInt8 = 0

extension UITextField {
    
    @IBInspectable
    var placeholderColor: UIColor? {
        get { objc_getAssociatedObject(self, &placeholderColorKey) as? UIColor }
        set {
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : newValue ?? UIColor.lightGray])
            objc_setAssociatedObject(self, &placeholderColorKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// 创建一个UITextField <通用>
    /// - Parameters:
    ///   - fontSize: fontSize
    ///   - placeholder: placeholder
    ///   - secureTextEntry: secureTextEntry
    ///   - keyboardType: keyboardType
    ///   - clearButtonMode: clearButtonMode
    ///   - returnKeyType: returnKeyType
    ///   - cornerRadius: cornerRadius
    ///   - borderWidth: borderWidth
    ///   - borderColor: borderColor
    /// - Returns: UITextField
    static func initTextField(_ fontSize: CGFloat,
                                _ placeholder: String,
                                _ secureTextEntry: Bool = false,
                                _ keyboardType: UIKeyboardType = .default,
                                _ clearButtonMode: UITextField.ViewMode = .whileEditing,
                                _ returnKeyType: UIReturnKeyType = .done,
                                _ cornerRadius: CGFloat = 0,
                                _ borderWidth: CGFloat = 0,
                                _ borderColor: UIColor = UIColor.clear, _ leftView: UIView? = nil) -> UITextField {
        let textField = UITextField.init()
        textField.font = UIFont.systemFont(ofSize: fontSize)
        textField.placeholder = placeholder
        textField.returnKeyType = returnKeyType
        textField.keyboardType = keyboardType
        textField.clearButtonMode = clearButtonMode
        textField.isSecureTextEntry = secureTextEntry
        if cornerRadius > 0 {
            textField.layer.cornerRadius = cornerRadius
        }
        if borderWidth > 0 {
            textField.layer.borderWidth = borderWidth
            textField.layer.borderColor = borderColor.cgColor
        }
        
        if let view = leftView {
            let container = UIView.init(frame: view.frame)
            container.addSubview(view)
            textField.leftView = container
            textField.leftViewMode = .always
        }
        
        return textField
    }
}
