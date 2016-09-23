//
//  NotificationManager.swift
//  Pods
//
//  Created by Draveness on 7/11/16.
//
//

import Foundation


private class NotificationManager {
    var selectorToBoolMap: [Selector: Bool] = [:]
    weak var observer: NSObject?

    init(observer: NSObject) {
        self.observer = observer
    }

    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }

}

private var notificationManagerKey = "notificationManagerKey"

extension NSObject {
    fileprivate var notificationManager: NotificationManager {
        get {
            if let manager = objc_getAssociatedObject(self, &notificationManagerKey) as? NotificationManager {
                return manager
            }
            self.notificationManager = NotificationManager(observer: self)
            return self.notificationManager
        }
        set {
            objc_setAssociatedObject(self, &notificationManagerKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func addNightObserver(_ selector: Selector) {
        if let bool = notificationManager.selectorToBoolMap[selector] {
            if bool {
                return
            }
        } else {
            notificationManager.selectorToBoolMap[selector] = true
        }
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name(rawValue: NightNightThemeChangeNotification), object: nil)

    }

}
