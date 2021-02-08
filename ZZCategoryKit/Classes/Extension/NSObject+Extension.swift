//
//  NSObject+Extension.swift
//  LearnSwift2
//
//  Created by 曾浩 on 2020/5/4.
//  Copyright © 2020 曾浩. All rights reserved.
//

import Foundation
//import MBProgressHUD

extension UIWindow {
    
    func topMostWindowController() -> UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    func currentViewController() -> UIViewController? {
        
        var currentViewController = topMostWindowController()
        if currentViewController is UITabBarController{
            currentViewController = (currentViewController as! UITabBarController).selectedViewController
        }
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        return currentViewController
    }
}

extension NSObject {
    
    func stringIsEmpty(value: AnyObject?) -> Bool {
        //首先判断是否为nil
        if (nil == value) {
            //对象是nil，直接认为是空串
            return true
        } else {
            //然后是否可以转化为String
            if let myValue = value as? String {
                //然后对String做判断
                return myValue == "" || myValue == "(null)" || 0 == myValue.count
            } else {
                return false
            }
        }
    }
    
    class var nameOfClass: String {
        return (NSStringFromClass(self).components(separatedBy: ".").last) ?? ""
    }
    
    /// 设置关联对象
    func setAssociatedObject(_ obj:AnyObject,key:UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// 获取关联对象
    func associatedObjectForKey(_ key:UnsafeRawPointer) -> AnyObject? {
        return objc_getAssociatedObject(self, key) as AnyObject?
    }
    
    /// 去掉所有关联对象
    func removeAssociatedObjects() {
        objc_removeAssociatedObjects(self)
    }
    
    func postNotification(_ name:String,object:AnyObject? = nil,userInfo:[String:AnyObject]? = nil) {
        NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object,userInfo:userInfo )
    }
    
    func addNotificationObserver(_ selector:Selector,name:String?,object:AnyObject?) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name.map { NSNotification.Name(rawValue: $0) }, object: object)
    }
    
    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
//    func showWindowHUD() {
//        showWindowHUD(text: "")
//    }
//    
//    func showWindowHUD(text: String) {
//        DispatchQueue.main.async {
//            let hud = MBProgressHUD.showAdded(to: UIApplication.shared.windows.first { $0.isKeyWindow}!, animated: true)
//            hud.mode = .text
//            hud.animationType = .zoomOut
//            hud.label.font = UIFont.systemFont(ofSize: 16)
//            hud.detailsLabel.font = UIFont.systemFont(ofSize: 16)
//            
//            if text.isEmpty {
//                hud.mode = .indeterminate
//            }
//            hud.detailsLabel.text = text;
//        }
//    }
//    
//    func showWindowHUD(text: String, second: Double) {
//        showWindowHUD(text: text)
//        DispatchQueue.main.asyncAfter(deadline: .now()+second) {
//            self.hideWindowHUD()
//        }
//    }
//    
//    func hideWindowHUD() {
//        MBProgressHUD.hide(for: UIApplication.shared.windows.first { $0.isKeyWindow}!, animated: true)
//    }
}


extension Array {
    //在开发中经常遇到数组越界导致的崩溃，可以利用swift的可选值特性防止这种问题发生
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var result: [Element] = []
        for element in self {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }
}
