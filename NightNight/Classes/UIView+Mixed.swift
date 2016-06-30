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
            self.backgroundColor = newValue?.unfold()
            setMixedColor(&Keys.backgroundColor, value: newValue)
        }
    }

    override func updateCurrentColor() -> () {
        super.updateCurrentColor()
        MixedAnimations {
            self.backgroundColor = self.mixedBackgroundColor?.unfold()
        }
    }
}
