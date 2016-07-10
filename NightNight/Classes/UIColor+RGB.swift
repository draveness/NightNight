//
//  UIColor+RGB.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

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