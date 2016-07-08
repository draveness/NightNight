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

public class NightNight {
    private static var currentTheme = Theme(rawValue: NSUserDefaults.standardUserDefaults().integerForKey(NightNightThemeKey)) ?? Theme.NORMAL

    public enum Theme: Int {
        case NORMAL
        case NIGHT
    }

    public static var theme: Theme {
        get { return currentTheme }
        set {
            currentTheme = newValue
            NSUserDefaults.standardUserDefaults().setInteger(currentTheme.rawValue, forKey: NightNightThemeKey)
            NSNotificationCenter.defaultCenter().postNotificationName(NightNightThemeChangeNotification, object: nil)
        }
    }
}
