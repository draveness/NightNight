//
//  UIView+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UIView {
    
    public var mixedBackgroundColor: MixedColor? {
        get { return getMixedColor(&Keys.backgroundColor) }
        set {
            backgroundColor= newValue?.unfold()
            setMixedColor(&Keys.backgroundColor, value: newValue)
        }
    }
    
    public var mixedTintColor: MixedColor? {
        get { return getMixedColor(&Keys.tintColor) }
        set {
            tintColor= newValue?.unfold()
            setMixedColor(&Keys.tintColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedBackgroundColor = mixedBackgroundColor {
            backgroundColor = mixedBackgroundColor.unfold()
        }
        
        if let mixedTintColor = mixedTintColor {
            tintColor = mixedTintColor.unfold()
        }
        
    }
}
