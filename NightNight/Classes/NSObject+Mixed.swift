//
//  NSObject+Mixed.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

private var isRegisteredNotificationKey = "isRegisteredNotificationKey"

extension NSObject {

    private var isRegisteredNotification: Bool {
        get {
            return (objc_getAssociatedObject(self, &isRegisteredNotificationKey) as? NSNumber)?.boolValue ?? false
        }
        set {
            objc_setAssociatedObject(self, &isRegisteredNotificationKey, NSNumber(bool: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func getMixedColor(key: UnsafePointer<Void>) -> MixedColor? {
        return objc_getAssociatedObject(self, key) as? MixedColor
    }
    func setMixedColor(key: UnsafePointer<Void>, value: MixedColor?) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        if !isRegisteredNotification {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(_updateTheme), name: NightNightThemeChangeNotification, object: nil)
            isRegisteredNotification = true
        }
    }

    func _updateTheme() {
        UIView.beginAnimations(nil, context: nil)

        self._updateCurrentStatus()

        UIView.commitAnimations()
    }

    func _updateCurrentStatus() {}
}
