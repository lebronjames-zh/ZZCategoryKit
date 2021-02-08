//
//  UIImage+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/5/13.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation


extension UIImage {

    /// 获得原图
    ///
    /// - Returns: cicleImage
    public func cicleImage() -> UIImage {

        // 开启图形上下文 false代表透明
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        // 获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        // 添加一个圆
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        ctx?.addEllipse(in: rect)
        // 裁剪
        ctx?.clip()
        // 将图片画上去
        draw(in: rect)
        // 获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    /// 裁剪给定区域
    /// crop: 裁剪区域
    /// - Returns: cropImage
    public func cropWithCropRect( _ crop: CGRect) -> UIImage?
    {
        let cropRect = CGRect(x: crop.origin.x * self.scale, y: crop.origin.y * self.scale, width: crop.size.width * self.scale, height: crop.size.height *  self.scale)
        
        if cropRect.size.width <= 0 || cropRect.size.height <= 0 {
            return nil
        }
        var image:UIImage?
        autoreleasepool{
            let imageRef: CGImage?  = self.cgImage!.cropping(to: cropRect)
            if let imageRef = imageRef {
                image = UIImage(cgImage: imageRef)
            }
        }
        return image
    }
    
    /// 设置图片透明度
    /// alpha: 透明度
    /// - Returns: newImage
    func imageByApplayingAlpha(_ alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        let area = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.scaleBy(x: 1, y: -1)
        context?.translateBy(x: 0, y: -area.height)
        context?.setBlendMode(.multiply)
        context?.setAlpha(alpha)
        context?.draw(self.cgImage!, in: area)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
    
    /// 按比例减少尺寸
    ///
    /// - Parameter sz: 原始图像尺寸.
    /// - Parameter limit:目标尺寸.
    /// - Returns: 函数按比例返回缩小后的尺寸
    func reduceSize(_ sz: CGSize, _ limit: CGFloat) -> CGSize {
        let maxPixel = max(sz.width, sz.height)
        guard maxPixel > limit else {
            return sz
        }
        var resSize: CGSize!
        let ratio = sz.height / sz.width;
        
        if (sz.width > sz.height) {
            resSize = CGSize(width:limit, height:limit*ratio);
        } else {
            resSize = CGSize(width:limit/ratio, height:limit);
        }
        
        return resSize;
    }

    // MARK: - 图片压缩
    /// 二分压缩法图片 img
//    func compressImageMidToImg(maxLength: Int) -> UIImage {
//        if let data = self.compressImageMid(maxLength: maxLength), let img = UIImage(data: data){
//            return img
//        }
//        return self
//    }
    /// 二分压缩法图片 data
//    func compressImageMid(maxLength: Int) -> Data? {
//        var compression: CGFloat = 1
//        guard var data = self.jpegData(compressionQuality: 1) else { return nil }
//        print("压缩前kb: \( Double((data.count)/1024)) kb")
//        if data.count < maxLength {
//           return data
//        }
//        var max: CGFloat = 1
//        var min: CGFloat = 0
//        for _ in 0..<6 {
//           compression = (max + min) / 2
//        data = self.jpegData(compressionQuality: compression)!
//           if CGFloat(data.count) < CGFloat(maxLength) * 0.9 {
//               min = compression
//           } else if data.count > maxLength {
//               max = compression
//           } else {
//               break
//           }
//        }
//        print("压缩后kb: ", data.count / 1024, "kb")
//        if data.count < maxLength {
//            return data
//        }
//        return data
//    }
}
