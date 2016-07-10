//
//  NSRange+Hashable.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

extension NSRange: Hashable {
    public var hashValue: Int {
        return self.location ^ self.length
    }
}

public func ==(lhs: NSRange, rhs: NSRange) -> Bool {
    return lhs.location == rhs.location && lhs.length == rhs.length
}
