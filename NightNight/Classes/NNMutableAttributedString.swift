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

extension NSRange: Hashable {
    public var hashValue: Int {
        return self.location ^ self.length
    }
}

public func ==(lhs: NSRange, rhs: NSRange) -> Bool {
    return lhs.location == rhs.location && lhs.length == rhs.length
}

var mixedAttrsKey = "mixedAttrs"

let MixedColorAttributeNamesDictionary =
    [NNForegroundColorAttributeName: NSForegroundColorAttributeName,
     NNBackgroundColorAttributeName: NSBackgroundColorAttributeName]

public extension NSMutableAttributedString {


    private var mixedAttrs: [String: [NSRange: MixedColor]] {
        get {
            if let dict = objc_getAssociatedObject(self, &mixedAttrsKey) as? [String : [NSRange : MixedColor]] {
                return dict
            }
            mixedAttrs = [:]
            mixedAttrs[NNForegroundColorAttributeName] = [:]
            mixedAttrs[NNBackgroundColorAttributeName] = [:]
            return mixedAttrs
        }
        set {
            objc_setAssociatedObject(self, &mixedAttrsKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private func shouldUpdateStatus(attrs: [String: AnyObject]) -> Bool {
        return attrs.keys.contains(NNForegroundColorAttributeName) ||
            attrs.keys.contains(NNBackgroundColorAttributeName)
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
