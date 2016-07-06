//
//  UIControl+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UIControl {
    
    public var mixedTintColor: MixedColor? {
        get { return getMixedColor(&Keys.tintColor) }
        set {
            tintColor= newValue?.unfold()
            setMixedColor(&Keys.tintColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedTintColor = mixedTintColor {
            tintColor = mixedTintColor.unfold()
        }
        
    }
}
