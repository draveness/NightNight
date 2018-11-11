//
//  Dictionary+AttributedStringKeys.swift
//  NightNight
//
//  Created by Weiran Zhang on 08/10/2017.
//

import Foundation

extension Dictionary where Key == String, Value == AnyObject {
    public func withAttributedStringKeys() -> [NSAttributedString.Key: AnyObject] {
        var mappedDictionary = [NSAttributedString.Key: AnyObject]()
        self.forEach { mappedDictionary[MixedColorAttributeNamesDictionary[$0.0]!] = $0.1 }
        return mappedDictionary
    }
}

