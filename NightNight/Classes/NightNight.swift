//
//  NightNight.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import UIKit
import ObjectiveC

public let NightNightThemeChangeNotification = "NightNightThemeChangeNotification"
private let NightNightThemeKey = "NightNightThemeKey"

open class NightNight {
    fileprivate static var currentTheme = Theme(rawValue: UserDefaults.standard.integer(forKey: NightNightThemeKey)) ?? Theme.normal

    public enum Theme: Int {
        case normal
        case night
    }

    open static var theme: Theme {
        get { return currentTheme }
        set {
            currentTheme = newValue
            UserDefaults.standard.set(currentTheme.rawValue, forKey: NightNightThemeKey)
            NotificationCenter.default.post(name: Notification.Name(rawValue: NightNightThemeChangeNotification), object: nil)
        }
    }
    
    open class func toggleNightTheme() {
        theme = currentTheme == .night ? .normal : .night
    }
}
