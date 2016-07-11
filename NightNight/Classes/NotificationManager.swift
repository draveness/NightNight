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
            NSNotificationCenter.defaultCenter().removeObserver(observer)
        }
    }

}

private var notificationManagerKey = "notificationManagerKey"

extension NSObject {
    private var notificationManager: NotificationManager {
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

    func addNightObserver(selector: Selector) {
        if let bool = notificationManager.selectorToBoolMap[selector] {
            if bool {
                return
            }
        } else {
            notificationManager.selectorToBoolMap[selector] = true
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: NightNightThemeChangeNotification, object: nil)

    }

}