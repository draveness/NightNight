//
//  UISlider+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UISlider {
    
    public var mixedMinimumTrackTintColor: MixedColor? {
        get { return getMixedColor(&Keys.minimumTrackTintColor) }
        set {
            minimumTrackTintColor= newValue?.unfold()
            setMixedColor(&Keys.minimumTrackTintColor, value: newValue)
        }
    }
    
    public var mixedMaximumTrackTintColor: MixedColor? {
        get { return getMixedColor(&Keys.maximumTrackTintColor) }
        set {
            maximumTrackTintColor= newValue?.unfold()
            setMixedColor(&Keys.maximumTrackTintColor, value: newValue)
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

        
        if let mixedMinimumTrackTintColor = mixedMinimumTrackTintColor {
            minimumTrackTintColor = mixedMinimumTrackTintColor.unfold()
        }
        
        if let mixedMaximumTrackTintColor = mixedMaximumTrackTintColor {
            maximumTrackTintColor = mixedMaximumTrackTintColor.unfold()
        }
        
        if let mixedThumbTintColor = mixedThumbTintColor {
            thumbTintColor = mixedThumbTintColor.unfold()
        }
        
    }
}
