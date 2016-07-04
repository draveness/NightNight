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

public class NightNight {
    private static var currentTheme = Theme.NORMAL

    public enum Theme {
        case NORMAL
        case NIGHT
    }

    public static var theme: Theme {
        get { return currentTheme }
        set {
            currentTheme = newValue
            NSNotificationCenter.defaultCenter().postNotificationName(NightNightThemeChangeNotification, object: nil)
        }
    }
}
