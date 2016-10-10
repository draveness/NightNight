//
//  UINavigationBar+MixedTitleAttributes.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

public extension UINavigationBar {
    fileprivate struct AssociatedKeys {
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

            addNightObserver(#selector(_updateTitleTextAttributes))

            if containsAttributeName(newValue) {
                var attributes = newValue

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

    func _updateTitleTextAttributes() {
        MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
            if mixedTitleTextAttributes.keys.contains(mixed),
                let mixedColor = mixedTitleTextAttributes[mixed] as? MixedColor {
                mixedTitleTextAttributes[normal] = mixedColor.unfold()
            }
        })
        titleTextAttributes = mixedTitleTextAttributes
    }

}
