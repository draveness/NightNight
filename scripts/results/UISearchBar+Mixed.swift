//
//  UISearchBar+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UISearchBar {
    
    public var mixedBarTintColor: MixedColor? {
        get { return getMixedColor(&Keys.barTintColor) }
        set {
            barTintColor= newValue?.unfold()
            setMixedColor(&Keys.barTintColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedBarTintColor = mixedBarTintColor {
            barTintColor = mixedBarTintColor.unfold()
        }
        
    }
}
