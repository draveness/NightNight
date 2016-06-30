//
//  NightNight.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

public let NightNightThemeChangeNotification = "NightNightThemeChangeNotification"

func MixedAnimations(animation: () -> ()) -> () {
    UIView.beginAnimations(nil, context: nil)

    animation()

    UIView.commitAnimations()
}