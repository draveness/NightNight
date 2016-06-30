//
//  MixedColor.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import UIKit

public struct MixedColor {
    let normalColor: UIColor
    let nightColor: UIColor

    init(normal: UIColor, _ night: UIColor) {
        normalColor = normal
        nightColor = night;
    }
}
