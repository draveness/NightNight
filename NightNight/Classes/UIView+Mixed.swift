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
        get { return getMixedColor(&AssociationKeys.backgroundColorKey) }
        set { setMixedColor(&AssociationKeys.backgroundColorKey, value: newValue) }
    }

    override func updateCurrentColor() -> () {
        super.updateCurrentColor()
        UIView.beginAnimations(nil, context: nil)

        backgroundColor = mixedBackgroundColor?.unfold()

        UIView.commitAnimations()
    }
}
