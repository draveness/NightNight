//
//  NNMutableAttributedString.swift
//  Pods
//
//  Created by Draveness on 7/9/16.
//
//

import UIKit

public extension NSMutableAttributedString {
    fileprivate struct AssociatedKeys {
        static var mixedAttrsKey = "mixedAttrs"
    }

    fileprivate var mixedAttrs: [String: [NSRange: MixedColor]] {
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

    public func setMixedAttributes(_ attrs: [String : AnyObject]?, range: NSRange) {
        if var attrs = attrs {
            MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
                if attrs.keys.contains(mixed) {
                    mixedAttrs[mixed]?[range] = attrs[mixed] as? MixedColor
                    attrs[mixed] = mixedAttrs[mixed]?[range]?.unfold()
                }
            })
            setAttributes(attrs.withAttributedStringKeys(), range: range)
        } else {
            setAttributes(attrs?.withAttributedStringKeys(), range: range)
        }
    }

    public func addMixedAttribute(_ name: String, value: AnyObject, range: NSRange) {
        if containsAttributeName(name),
            let normalName = MixedColorAttributeNamesDictionary[name] {

            mixedAttrs[name]?[range] = value as? MixedColor
            addAttribute(normalName, value: value, range: range)
        } else {
            addAttribute(NSAttributedStringKey(rawValue: name), value: value, range: range)
        }
    }

    public func addMixedAttributes(_ attrs: [String : AnyObject], range: NSRange) {
        if containsAttributeName(attrs) {
            var attrs = attrs

            MixedColorAttributeNamesDictionary.forEach({ (mixed, normal) in
                if attrs.keys.contains(mixed) {
                    mixedAttrs[mixed]?[range] = attrs[mixed] as? MixedColor
                    attrs[mixed] = mixedAttrs[mixed]?[range]?.unfold()
                }
            })

            addAttributes(attrs.withAttributedStringKeys(), range: range)
        } else {
            addAttributes(attrs.withAttributedStringKeys(), range: range)
        }
    }

    public func removeMixedAttribute(_ name: String, range: NSRange) {
        if containsAttributeName(name),
            let normalName = MixedColorAttributeNamesDictionary[name] {
            _ = mixedAttrs[name]?.removeValue(forKey: range)
            removeAttribute(normalName, range: range)
        } else {
            removeAttribute(NSAttributedStringKey(rawValue: name), range: range)
        }
    }

    @objc func _updateTitleAttributes() {

        MixedColorAttributeNamesDictionary.forEach { (mixed, normal) in
            if let foregroundColorDictionary = mixedAttrs[mixed] {
                foregroundColorDictionary.forEach({ (range, mixedColor) in
                    self.addAttribute(normal, value: mixedColor.unfold(), range: range)
                })
            }

        }
    }

}
