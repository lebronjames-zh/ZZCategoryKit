//
//  UIColor+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/4/28.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation

extension UIColor {
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    static func hexColor(_ hexColor: Int32 ) -> UIColor {
        let r = CGFloat(((hexColor & 0x00FF0000) >> 16)) / 255.0
        let g = CGFloat(((hexColor & 0x0000FF00) >> 8)) / 255.0
        let b = CGFloat(hexColor & 0x000000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    /// 正常/暗黑模式显示
    /// - Parameters:
    ///   - hightColor: 正常颜色
    ///   - darkColor: 暗黑颜色
    static func colorWith(hightColor: UIColor, darkColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return darkColor
                } else {
                    return hightColor
                }
            }
        } else {
            return hightColor
        }
    }
}
