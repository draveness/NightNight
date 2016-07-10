//
//  UINavigationBar+MixedTitleAttributes.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

public extension UINavigationBar {
    private struct AssociatedKeys {
        static var mixedTitleTextAttributesKey = "mixedTitleTextAttributesKey"
    }

    public var mixedTitleTextAttributes: [String : AnyObject] {
        get {
            if let dict = objc_getAssociatedObject(self, &AssociatedKeys.mixedTitleTextAttributesKey) as? [String : AnyObject] {
                return dict
            }

            objc_setAssociatedObject(self, &AssociatedKeys.mixedTitleTextAttributesKey, [:], .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            return self.mixedTitleTextAttributes
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedTitleTextAttributesKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if containsAttributeName(newValue) {
                var attributes = newValue
                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateTitleTextAttributes), name: NightNightThemeChangeNotification, object: nil)

                MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
                    if self.mixedTitleTextAttributes.keys.contains(mixed),
                        let mixedColor = self.mixedTitleTextAttributes[mixed] as? MixedColor {
                        attributes[normal] = mixedColor.unfold()
                    }
                })
                titleTextAttributes = attributes
            } else {
                titleTextAttributes = newValue
            }
        }
    }

    func updateTitleTextAttributes() {
        MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
            if mixedTitleTextAttributes.keys.contains(mixed),
                let mixedColor = mixedTitleTextAttributes[mixed] as? MixedColor {
                mixedTitleTextAttributes[normal] = mixedColor.unfold()
            }
        })
        titleTextAttributes = mixedTitleTextAttributes
    }

}