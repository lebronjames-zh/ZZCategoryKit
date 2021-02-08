//
//  UILabel+Category.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/4/27.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation

extension UILabel {
    
    /// 创建一个UILabel <通用>
    /// - Parameters:
    ///   - text: text
    ///   - textColor: textColor
    ///   - fontSize: fontSize
    ///   - textAlignment: textAlignment
    ///   - isBold: isBold
    ///   - cornerRadius: cornerRadius
    ///   - borderColor: borderColor
    ///   - borderWidth: borderWidth
    /// - Returns: label
    static func initLabel(_ text: String,
                          _ textColor: UIColor,
                          _ fontSize: CGFloat,
                          _ textAlignment: NSTextAlignment = .left,
                          _ isBold: Bool = false,
                          _ cornerRadius: CGFloat = 0,
                          _ borderWidth: CGFloat = 0,
                          _ borderColor: UIColor = UIColor.clear) -> UILabel {
        let label = UILabel.init()
        label.text = text
        label.textColor = textColor
        label.font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        if cornerRadius > 0 {
            label.layer.cornerRadius = cornerRadius
            label.layer.masksToBounds = true
        }
        if borderWidth > 0 {
            label.layer.borderWidth = borderWidth
            label.layer.borderColor = borderColor.cgColor
        }
        return label
    }
    
    /// 创建一个label
    /// - Parameters:
    ///   - text: 文字
    ///   - textColor: 文字颜色
    ///   - fontSize: 文字大小
    static func createLabel(_ text: String, _ textColor: UIColor, _ fontSize: CGFloat) -> UILabel {
        let label = UILabel.init()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    
    /// 创建一个label + boldFontSize
    /// - Parameters:
    ///   - text: 文字
    ///   - textColor: 文字颜色
    ///   - boldFontSize: 文字大小
    static func createLabel(_ text: String, _ textColor: UIColor, boldFontSize: CGFloat) -> UILabel {
        let label = UILabel.init()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.boldSystemFont(ofSize: boldFontSize)
        return label
    }
    
    /// 创建一个label + textAlignment
    /// - Parameters:
    ///   - text: 文字
    ///   - textColor: 文字颜色
    ///   - fontSize: 文字大小
    ///   - textAlignment: 对齐方式
    static func createLabel(_ text: String, _ textColor: UIColor, _ fontSize: CGFloat, _ textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel.init()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = textAlignment
        return label
    }
    
    /// 创建一个label + textAlignment + cornerRadius + borderColor
    /// - Parameters:
    ///   - text: 文字
    ///   - textColor: 文字颜色
    ///   - fontSize: 文字大小
    ///   - cornerRadius: cornerRadius
    ///   - borderColor: borderColor
    ///   - borderWidth: borderWidth
    static func createLabel(_ text: String, _ textColor: UIColor, _ fontSize: CGFloat, _ cornerRadius: CGFloat, _ borderColor: UIColor, _ borderWidth: CGFloat) -> UILabel {
        let label = UILabel.init()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.layer.cornerRadius = cornerRadius
        label.layer.masksToBounds = true
        label.layer.borderColor = borderColor.cgColor
        label.layer.borderWidth = borderWidth
        return label
    }
    
    
    /// 设置行间距和行高
    /// - Parameters:
    ///   - lineSpacing: 行间距
    ///   - lineHeightMultiple: 行高
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        guard let labelText = self.text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        attributedString.addAttribute(.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
    
}
