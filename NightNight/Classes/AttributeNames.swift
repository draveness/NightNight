//
//  AttributeNames.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

public let NNForegroundColorAttributeName = "NNForegroundColorAttributeName"
public let NNBackgroundColorAttributeName = "NNBackgroundColorAttributeName"
public let NNUnderlineColorAttributeName = "NNUnderlineColorAttributeName"

let MixedColorAttributeNamesDictionary =
    [NNForegroundColorAttributeName: NSAttributedStringKey.foregroundColor,
     NNBackgroundColorAttributeName: NSAttributedStringKey.backgroundColor,
     NNUnderlineColorAttributeName: NSAttributedStringKey.underlineColor]
let MixedColorAttributeNames = MixedColorAttributeNamesDictionary.keys

func containsAttributeName(_ attrs: [String: AnyObject]) -> Bool {
    return MixedColorAttributeNames.reduce(false) { (shouldUpdate, name) -> Bool in
        return attrs.keys.contains(name) || shouldUpdate
    }
}

func containsAttributeName(_ attr: String) -> Bool {
    return MixedColorAttributeNames.contains(attr)
}
