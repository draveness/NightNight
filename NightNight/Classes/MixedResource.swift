//
//  MixedResource.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

//import Foundation
import UIKit

public class MixedResource<T> {
    public let normalResource: T
    public let nightResource: T
    public init(normal: T, night: T) {
        normalResource = normal
        nightResource = night
    }

    public func unfold() -> T {
        switch NightNight.theme {
        case .normal: return normalResource
        case .night:  return nightResource
        }
    }
}

public class MixedImage: MixedResource<UIImage> {
    public override init(normal: UIImage, night: UIImage) {
        super.init(normal: normal, night: night)
    }
    public convenience init(normal: String, night: String) {
        self.init(normal: UIImage(named: normal)!, night: UIImage(named: night)!)
    }
}

public class MixedColor: MixedResource<UIColor> {
    public override init(normal: UIColor, night: UIColor) {
        super.init(normal: normal, night: night)
    }
    public init(normal: Int, night: Int) {
        let normalColor = UIColor(rgb: normal)
        let nightColor = UIColor(rgb: night)
        super.init(normal: normalColor, night: nightColor)
    }
}

public class MixedStatusBarStyle: MixedResource<UIStatusBarStyle> {
    public override init(normal: UIStatusBarStyle, night: UIStatusBarStyle) {
        super.init(normal: normal, night: night)
    }
}

public class MixedBarStyle: MixedResource<UIBarStyle> {
    public override init(normal: UIBarStyle, night: UIBarStyle) {
        super.init(normal: normal, night: night)
    }
}

public class MixedKeyboardAppearance: MixedResource<UIKeyboardAppearance> {
    public override init(normal: UIKeyboardAppearance, night: UIKeyboardAppearance) {
        super.init(normal: normal, night: night)
    }
}
