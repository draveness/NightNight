//
//  AssociationKeys.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

func mixed(key: String) -> String {
    return "mixed\(key.capitalizedString)"
}

struct Keys {
    static var backgroundColor      = "backgroundColor"
    static var tintColor            = "tintColor"
    static var shadowColor          = "shadowColor"
    static var textColor            = "textColor"
    static var highlightedTextColor = "highlightedTextColor"
    static var barTintColor         = "barTintColor"
    static var separatorColor       = "separatorColor"
}