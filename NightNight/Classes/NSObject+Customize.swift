//
//  NSObject+Customize.swift
//  Pods
//
//  Created by Draveness on 7/11/16.
//
//

import Foundation

extension NSObject {
    private struct AssociatedKeys {
        static var customizeKey = "customizeKey"
    }

    public var customize: Customize {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociatedKeys.customizeKey) as? Customize {
                return obj
            }

            objc_setAssociatedObject(self, &AssociatedKeys.customizeKey, Customize(), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            return objc_getAssociatedObject(self, &AssociatedKeys.customizeKey) as! Customize
        }
    }
}

public class Customize: NSObject {
    private var closures: [Void -> Void] = []

    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(_updateTheme), name: NightNightThemeChangeNotification, object: nil)
    }
}