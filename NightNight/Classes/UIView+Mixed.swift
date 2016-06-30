//
//  UIView+Mixed.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation
import ObjectiveC

public extension UIView {
    public var mixedBackgroundColor: MixedColor? {
        get {
            return objc_getAssociatedObject(self, &AssociationKeys.backgroundColorKey) as? MixedColor
        }
        set {
            objc_setAssociatedObject(self, &AssociationKeys.backgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}