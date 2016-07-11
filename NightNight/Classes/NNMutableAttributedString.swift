//
//  NNMutableAttributedString.swift
//  Pods
//
//  Created by Draveness on 7/9/16.
//
//

import UIKit

public extension NSMutableAttributedString {
    private struct AssociatedKeys {
        static var mixedAttrsKey = "mixedAttrs"
    }

    private var mixedAttrs: [String: [NSRange: MixedColor]] {
        get {
            if let dict = objc_getAssociatedObject(self, &AssociatedKeys.mixedAttrsKey) as? [String : [NSRange : MixedColor]] {
                return dict
            }
            self.mixedAttrs = [:]

            MixedColorAttributeNames.forEach { (mixed) in
                self.mixedAttrs[mixed] = [:]
            }

            return self.mixedAttrs
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedAttrsKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            addNightObserver(#selector(_updateTitleAttributes))
        }
    }

    public func setMixedAttributes(attrs: [String : AnyObject]?, range: NSRange) {
        if var attrs = attrs {
            MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
                if attrs.keys.contains(mixed) {
                    mixedAttrs[mixed]?[range] = attrs[mixed] as? MixedColor
                    attrs[normal] = mixedAttrs[mixed]?[range]?.unfold()
                }
            })
            setAttributes(attrs, range: range)
        } else {
            setAttributes(attrs, range: range)
        }
    }

    public func addMixedAttribute(name: String, value: AnyObject, range: NSRange) {
        if containsAttributeName(name),
            let normalName = MixedColorAttributeNamesDictionary[name] {

            mixedAttrs[name]?[range] = value as? MixedColor
            addAttribute(normalName, value: value, range: range)
        } else {
            addAttribute(name, value: value, range: range)
        }
    }

    public func addMixedAttributes(attrs: [String : AnyObject], range: NSRange) {
        if containsAttributeName(attrs) {
            var attrs = attrs

            MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
                if attrs.keys.contains(mixed) {
                    mixedAttrs[mixed]?[range] = attrs[mixed] as? MixedColor
                    attrs[normal] = mixedAttrs[mixed]?[range]?.unfold()
                }
            })

            addAttributes(attrs, range: range)
        } else {
            addAttributes(attrs, range: range)
        }
    }

    public func removeMixedAttribute(name: String, range: NSRange) {
        if containsAttributeName(name),
            let normalName = MixedColorAttributeNamesDictionary[name] {
            mixedAttrs[name]?.removeValueForKey(range)
            removeAttribute(normalName, range: range)
        } else {
            removeAttribute(name, range: range)
        }
    }

    func _updateTitleAttributes() {

        MixedColorAttributeNamesDictionary.forEach { (mixed, normal) in
            if let foregroundColorDictionary = mixedAttrs[mixed] {
                foregroundColorDictionary.forEach({ (range, mixedColor) in
                    self.addAttribute(normal, value: mixedColor.unfold(), range: range)
                })
            }

        }
    }

}
