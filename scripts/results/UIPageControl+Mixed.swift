//
//  UIPageControl+Mixed.swift
//  Pods
//
//  Created by Draveness.
//
//

import Foundation

public extension UIPageControl {
    
    public var mixedPageIndicatorTintColor: MixedColor? {
        get { return getMixedColor(&Keys.pageIndicatorTintColor) }
        set {
            pageIndicatorTintColor= newValue?.unfold()
            setMixedColor(&Keys.pageIndicatorTintColor, value: newValue)
        }
    }
    
    public var mixedCurrentPageIndicatorTintColor: MixedColor? {
        get { return getMixedColor(&Keys.currentPageIndicatorTintColor) }
        set {
            currentPageIndicatorTintColor= newValue?.unfold()
            setMixedColor(&Keys.currentPageIndicatorTintColor, value: newValue)
        }
    }
    

    override func updateCurrentColor() {
        super.updateCurrentColor()

        
        if let mixedPageIndicatorTintColor = mixedPageIndicatorTintColor {
            pageIndicatorTintColor = mixedPageIndicatorTintColor.unfold()
        }
        
        if let mixedCurrentPageIndicatorTintColor = mixedCurrentPageIndicatorTintColor {
            currentPageIndicatorTintColor = mixedCurrentPageIndicatorTintColor.unfold()
        }
        
    }
}
