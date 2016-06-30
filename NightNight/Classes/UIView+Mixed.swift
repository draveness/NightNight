//
//  UIView+Mixed.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation
import ObjectiveC

public extension UIView {
    public var mixedBackgroundColor: MixedColor? {
        get { return getMixedColor(&Keys.backgroundColor) }
        set {
            backgroundColor = newValue?.unfold()
            setMixedColor(&Keys.backgroundColor, value: newValue)
        }
    }
    public var mixedTintColor: MixedColor? {
        get { return getMixedColor(&Keys.tintColor) }
        set {
            tintColor = newValue?.unfold()
            setMixedColor(&Keys.tintColor, value: newValue)
        }
    }

    override func updateCurrentColor() -> () {
        super.updateCurrentColor()
        MixedAnimations {
            self.backgroundColor = self.mixedBackgroundColor?.unfold()
            self.tintColor = self.mixedTintColor?.unfold()
        }
    }
}
