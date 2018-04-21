//
//  UINavigationBar+MixedBarStyle.swift
//  Pods
//
//  Created by Draveness on 7/11/16.
//
//

import Foundation

public extension UINavigationBar {
    fileprivate struct AssociatedKeys {
        static var mixedBarStyleKey = "mixedBarStyleKey"
        static var mixedBarTintColorKey = "mixedBarTintColorKey"
    }

    public var mixedBarStyle: MixedBarStyle? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.mixedBarStyleKey) as? MixedBarStyle
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedBarStyleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            addNightObserver(#selector(_updateBarStyle))
        }
    }

    @objc func _updateBarStyle() {
        if let mixedBarStyle = mixedBarStyle {
            barStyle = mixedBarStyle.unfold()
        }
    }

}
