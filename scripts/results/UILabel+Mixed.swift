//
//  UILabel+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UILabel {
    
    public var mixedTextColor: MixedColor? {
        get { return getMixedColor(&Keys.textColor) }
        set {
            textColor= newValue?.unfold()
            setMixedColor(&Keys.textColor, value: newValue)
        }
    }
    
    public var mixedShadowColor: MixedColor? {
        get { return getMixedColor(&Keys.shadowColor) }
        set {
            shadowColor= newValue?.unfold()
            setMixedColor(&Keys.shadowColor, value: newValue)
        }
    }
    
    public var mixedHighlightedTextColor: MixedColor? {
        get { return getMixedColor(&Keys.highlightedTextColor) }
        set {
            highlightedTextColor= newValue?.unfold()
            setMixedColor(&Keys.highlightedTextColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedTextColor = mixedTextColor {
            textColor = mixedTextColor.unfold()
        }
        
        if let mixedShadowColor = mixedShadowColor {
            shadowColor = mixedShadowColor.unfold()
        }
        
        if let mixedHighlightedTextColor = mixedHighlightedTextColor {
            highlightedTextColor = mixedHighlightedTextColor.unfold()
        }
        
    }
}
