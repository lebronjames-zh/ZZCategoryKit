//
//  String+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/5/4.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    func getClass() -> UIViewController.Type {
        /*
            如果你的工程名字中带有“-” 符号  需要加上 replacingOccurrences(of: "-", with: "_") 这句代码把“-” 替换掉  不然还会报错 要不然系统会自动替换掉 这样就不是你原来的包名了 如果不包含“-”  这句代码 可以不加
         name = name?.replacingOccurrences(of: "-", with: "_")
         */
        
        // 获取项目的名称
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
        let className = name! + "." + self;
        
        guard let vcClass = NSClassFromString(className) as? UIViewController.Type else {
            return UIViewController.self
        }
        return vcClass
    }
    
    func getClassName() -> String {
        /*
            如果你的工程名字中带有“-” 符号  需要加上 replacingOccurrences(of: "-", with: "_") 这句代码把“-” 替换掉  不然还会报错 要不然系统会自动替换掉 这样就不是你原来的包名了 如果不包含“-”  这句代码 可以不加
         name = name?.replacingOccurrences(of: "-", with: "_")
         */
        
        // 获取项目的名称
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
        return name! + "." + self
    }
    
    func substring(start: Int, end: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return String(self[startIndex...endIndex])
    }
    
//    func isBlankString() -> Bool {
//        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
//        return trimmedStr.isEmpty
//    }
//
//    var isBlankStr: Bool {
//        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
//        return trimmedStr.isEmpty
//    }
    //md5加密
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate()
        
        return String(format: hash as String)
    }
    
    /// 获取高度计算
    ///
    /// - Parameters:
    ///   - size: 矩形已知范围
    ///   - attributes: 文字属性
    /// - Returns: 高度
    public func height(_ size: CGSize, _ attributes: [NSAttributedString.Key: Any]?) -> CGFloat {

        let string = self as NSString

        let stringSize = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

        return stringSize.height

    }
    /// 获取宽度计算
    ///
    /// - Parameters:
    ///   - size: 矩形已知范围
    ///   - attributes: 文字属性
    /// - Returns: 宽度
    public func width(_ size: CGSize, _ attributes: [NSAttributedString.Key: Any]?) -> CGFloat {

        let string = self as NSString

        let stringSize = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

        return stringSize.width
    }
    
    /// 将当前字符串拼接到cache目录后面
    ///
    /// - Returns: result
    func cacheDic() -> String
    {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
    
    /// 将当前字符串拼接到document目录后面
    ///
    /// - Returns: result
    func docDic() -> String
    {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as NSString
        
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
    
    /// 将当前字符串拼接到tmp目录后面
    ///
    /// - Returns: result
    func tmpDic() -> String
    {
        let path = NSTemporaryDirectory() as NSString
        
        return path.appendingPathComponent((self as NSString).lastPathComponent)
    }
}
