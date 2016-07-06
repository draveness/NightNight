//
//  UISwitch+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UISwitch {
    
    public var mixedOnTintColor: MixedColor? {
        get { return getMixedColor(&Keys.onTintColor) }
        set {
            onTintColor= newValue?.unfold()
            setMixedColor(&Keys.onTintColor, value: newValue)
        }
    }
    
    public var mixedThumbTintColor: MixedColor? {
        get { return getMixedColor(&Keys.thumbTintColor) }
        set {
            thumbTintColor= newValue?.unfold()
            setMixedColor(&Keys.thumbTintColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedOnTintColor = mixedOnTintColor {
            onTintColor = mixedOnTintColor.unfold()
        }
        
        if let mixedThumbTintColor = mixedThumbTintColor {
            thumbTintColor = mixedThumbTintColor.unfold()
        }
        
    }
}
