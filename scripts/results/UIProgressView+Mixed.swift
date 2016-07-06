//
//  UIProgressView+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UIProgressView {
    
    public var mixedProgressTintColor: MixedColor? {
        get { return getMixedColor(&Keys.progressTintColor) }
        set {
            progressTintColor= newValue?.unfold()
            setMixedColor(&Keys.progressTintColor, value: newValue)
        }
    }
    
    public var mixedTrackTintColor: MixedColor? {
        get { return getMixedColor(&Keys.trackTintColor) }
        set {
            trackTintColor= newValue?.unfold()
            setMixedColor(&Keys.trackTintColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedProgressTintColor = mixedProgressTintColor {
            progressTintColor = mixedProgressTintColor.unfold()
        }
        
        if let mixedTrackTintColor = mixedTrackTintColor {
            trackTintColor = mixedTrackTintColor.unfold()
        }
        
    }
}
