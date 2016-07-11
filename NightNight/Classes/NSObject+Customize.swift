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

    private var customize: Customize {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociatedKeys.customizeKey) as? Customize {
                return obj
            }

            objc_setAssociatedObject(self, &AssociatedKeys.customizeKey, Customize(obj: self), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            return objc_getAssociatedObject(self, &AssociatedKeys.customizeKey) as! Customize
        }
    }

    private /*public*/ func customize(closure: () -> ()) {
        closure()
        self.customize.closures.append(closure)
    }
}

public class Customize: NSObject {
    private var closures: [() -> ()] = []
    private weak var correspondingObject: NSObject?

    private convenience init(obj: NSObject) {
        self.init()
        self.correspondingObject = obj

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(_callAllExistingClosures), name: NightNightThemeChangeNotification, object: nil)
    }

    func _callAllExistingClosures() {
        closures.forEach {
            $0()
        }
    }
}