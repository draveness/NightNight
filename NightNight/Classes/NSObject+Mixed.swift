//
//  NSObject+Mixed.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

extension NSObject {
    
    func getMixedColor(key: UnsafePointer<Void>) -> MixedColor? {
        return objc_getAssociatedObject(self, key) as? MixedColor
    }
    func setMixedColor(key: UnsafePointer<Void>, value: MixedColor?) {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateTheme), name: NightNightThemeChangeNotification, object: nil)
    }

    func updateTheme() {
        UIView.beginAnimations(nil, context: nil)

//        UIView.animateWithDuration(1.0) {
            self.updateCurrentColor()
//        }

        UIView.commitAnimations()
    }

    func updateCurrentColor() {}
}
