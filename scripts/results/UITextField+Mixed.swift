//
//  UITextField+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UITextField {
    
    public var mixedTextColor: MixedColor? {
        get { return getMixedColor(&Keys.textColor) }
        set {
            textColor= newValue?.unfold()
            setMixedColor(&Keys.textColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedTextColor = mixedTextColor {
            textColor = mixedTextColor.unfold()
        }
        
    }
}
