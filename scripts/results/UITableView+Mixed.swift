//
//  UITableView+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UITableView {
    
    public var mixedSeparatorColor: MixedColor? {
        get { return getMixedColor(&Keys.separatorColor) }
        set {
            separatorColor= newValue?.unfold()
            setMixedColor(&Keys.separatorColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedSeparatorColor = mixedSeparatorColor {
            separatorColor = mixedSeparatorColor.unfold()
        }
        
    }
}
