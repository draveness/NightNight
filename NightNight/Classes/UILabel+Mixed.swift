//
//  UILabel+Mixed.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

public extension UILabel {
    public var mixedTextColor: MixedColor? {
        get { return getMixedColor(&Keys.textColor) }
        set {
            textColor = newValue?.unfold()
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