//
//  UIView+IBInspectable.swift
//  Pods
//
//  Created by Draveness on 7/7/16.
//
//

import Foundation

public extension UIView {
    @IBInspectable var nightBackgroundColor: UIColor? {
        get { return objc_getAssociatedObject(self, &NightKeys.backgroundColor) as? UIColor }
        set {
            objc_setAssociatedObject(self, &NightKeys.backgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    @IBInspectable var normalBackgroundColor: UIColor? {
        get { return objc_getAssociatedObject(self, &NormalKeys.backgroundColor) as? UIColor }
        set {
            objc_setAssociatedObject(self, &NormalKeys.backgroundColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
