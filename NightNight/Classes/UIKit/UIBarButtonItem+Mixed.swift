//
//  UIBarButtonItem+Mixed.swift
//  Pods
//
//  Created by Frédéric Dinand on 05/06/2017.
//
//

import Foundation


public extension UIBarButtonItem {
    fileprivate struct AssociatedKeys {
        static var mixedImageKey = "mixedImage"
    }
    
    public var mixedImage: MixedImage? {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.mixedImageKey) as? MixedImage }
        set {
            image = newValue?.unfold()
            objc_setAssociatedObject(self, &AssociatedKeys.mixedImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            addNightObserver(#selector(_updateTheme))
        }
    }
    
    override func _updateCurrentStatus() {
        super._updateCurrentStatus()
        
        if let mixedImage = mixedImage {
            image = mixedImage.unfold()
        }
        
    }
}
