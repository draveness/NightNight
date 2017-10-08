//
//  NSObject+Mixed.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

extension NSObject {

    func getMixedColor(_ key: UnsafeRawPointer) -> MixedColor? {
        return objc_getAssociatedObject(self, key) as? MixedColor
    }
    func setMixedColor(_ key: UnsafeRawPointer, value: MixedColor?) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        addNightObserver(#selector(_updateTheme))
    }

    @objc func _updateTheme() {
        UIView.beginAnimations(nil, context: nil)

        self._updateCurrentStatus()

        UIView.commitAnimations()
    }

    @objc func _updateCurrentStatus() {}

}
