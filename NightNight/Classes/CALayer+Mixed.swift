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
        get { return getMixedColor(&AssociatedKeys.mixedBackgroundColorKey) }
        set {
            backgroundColor = newValue?.unfold().cgColor
            setMixedColor(&AssociatedKeys.mixedBackgroundColorKey, value: newValue)
        }
    }
    
    public var mixedBorderColor: MixedColor? {
        get { return  getMixedColor(&AssociatedKeys.mixedBorderColorKey) }
        set {
            borderColor = newValue?.unfold().cgColor
            setMixedColor(&AssociatedKeys.mixedBorderColorKey, value: newValue)
        }
    }
    
    public var mixedShadowColor: MixedColor? {
        get { return getMixedColor(&AssociatedKeys.mixedShadowColorKey) }
        set {
            shadowColor = newValue?.unfold().cgColor
            setMixedColor(&AssociatedKeys.mixedShadowColorKey, value: newValue)
        }
    }
    
    @objc override func _updateCurrentStatus() {
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
