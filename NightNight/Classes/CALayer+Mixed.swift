//
//  CALayer+Mixed.swift
//  Pods
//
//  Created by Draveness on 8/17/16.
//
//

import Foundation

public extension CALayer {
    fileprivate struct AssociatedKeys {
        static var mixedBackgroundColorKey = "layer.mixedBackgroundColorKey"
        static var mixedBorderColorKey = "layer.mixedBorderColorKey"
        static var mixedShadowColorKey = "layer.mixedShadowColorKey"
    }

    public var mixedBackgroundColor: MixedColor? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.mixedBackgroundColorKey) as? MixedColor }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedBackgroundColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var mixedBorderColor: MixedColor? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.mixedBorderColorKey) as? MixedColor }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedBorderColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var mixedShadowColor: MixedColor? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.mixedShadowColorKey) as? MixedColor }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedShadowColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    override func _updateCurrentStatus() {
        super._updateCurrentStatus()
        
        if let mixedBackgroundColor = mixedBackgroundColor {
            backgroundColor = mixedBackgroundColor.unfold().cgColor
        }
        
        if let mixedBorderColor = mixedBorderColor {
            borderColor = mixedBorderColor.unfold().cgColor
        }
        
        if let mixedShadowColor = mixedShadowColor {
            shadowColor = mixedShadowColor.unfold().cgColor
        }
    }

}
