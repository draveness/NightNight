//
//  NNMutableAttributedString.swift
//  Pods
//
//  Created by Draveness on 7/9/16.
//
//

import UIKit

public let NNForegroundColorAttributeName = "NNForegroundColorAttributeName"
public let NNBackgroundColorAttributeName = "NNBackgroundColorAttributeName"

var mixedAttrsKey = "mixedAttrs"

let MixedColorAttributeNamesDictionary =
    [NNForegroundColorAttributeName: NSForegroundColorAttributeName,
     NNBackgroundColorAttributeName: NSBackgroundColorAttributeName]
let MixedColorAttributeNames = MixedColorAttributeNamesDictionary.keys

public extension NSMutableAttributedString {


    private var mixedAttrs: [String: [NSRange: MixedColor]] {
        get {
            if let dict = objc_getAssociatedObject(self, &mixedAttrsKey) as? [String : [NSRange : MixedColor]] {
                return dict
            }
            mixedAttrs = [:]

            MixedColorAttributeNames.forEach { (mixed) in
                mixedAttrs[mixed] = [:]
            }

            return mixedAttrs
        }
        set {
            objc_setAssociatedObject(self, &mixedAttrsKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private func shouldUpdateStatus(attrs: [String: AnyObject]) -> Bool {
        return MixedColorAttributeNames.reduce(false) { (shouldUpdate, name) -> Bool in
            return attrs.keys.contains(name) || shouldUpdate
        }
    }

    private func shouldUpdateStatus(attr: String) -> Bool {
        return MixedColorAttributeNames.contains(attr)
    }

    public func setNightAttributes(attrs: [String : AnyObject]?, range: NSRange) {
        if var attrs = attrs {
            if shouldUpdateStatus(attrs) {
                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateCurrentStatus), name: NightNightThemeChangeNotification, object: nil)
            }

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

    public func addNightAttribute(name: String, value: AnyObject, range: NSRange) {
        if shouldUpdateStatus(name),
            let normalName = MixedColorAttributeNamesDictionary[name] {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateCurrentStatus), name: NightNightThemeChangeNotification, object: nil)

            mixedAttrs[name]?[range] = value as? MixedColor
            addAttribute(normalName, value: value, range: range)
        } else {
            addAttribute(name, value: value, range: range)
        }
    }

    public func addNightAttributes(attrs: [String : AnyObject], range: NSRange) {
        if shouldUpdateStatus(attrs) {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updateCurrentStatus), name: NightNightThemeChangeNotification, object: nil)

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

    public func removeNightAttribute(name: String, range: NSRange) {
        if shouldUpdateStatus(name),
            let normalName = MixedColorAttributeNamesDictionary[name] {
            mixedAttrs[name]?.removeValueForKey(range)
            removeNightAttribute(normalName, range: range)
        } else {
            removeNightAttribute(name, range: range)
        }
    }

    override func updateCurrentStatus() {
        super.updateCurrentStatus()

        MixedColorAttributeNamesDictionary.forEach { (mixed, normal) in
            if let foregroundColorDictionary = mixedAttrs[mixed] {
                foregroundColorDictionary.forEach({ (range, mixedColor) in
                    self.addAttribute(normal, value: mixedColor.unfold(), range: range)
                })
            }

        }
    }

}
