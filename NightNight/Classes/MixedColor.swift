//
//  MixedColor.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import UIKit

public class MixedColor {
    public let normalColor: UIColor
    public let nightColor: UIColor

    public init(normal: UIColor, night: UIColor) {
        normalColor = normal
        nightColor = night;
    }

    public init(normal: Int, night: Int) {
        normalColor = UIColor(rgb: normal)
        nightColor = UIColor(rgb: night);
    }

    func unfold() -> UIColor? {
        switch NightNight.theme {
        case .NORMAL: return normalColor
        case .NIGHT:  return nightColor
        default:      return normalColor
        }
    }
}

extension UIColor {
    convenience init(rgb: Int) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb: Int, alpha: CGFloat) {
        let red = CGFloat(rgb >> 16) / 255.0
        let green = CGFloat(rgb >> 8 & 0xff) / 255.0
        let blue = CGFloat(rgb >> 0 & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}