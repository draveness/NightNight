//
//  MixedResource.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

public class MixedResource<T> {
    public let normalResource: T
    public let nightResource: T
    public init(normal: T, night: T) {
        normalResource = normal
        nightResource = night
    }

    func unfold() -> T {
        switch NightNight.theme {
        case .NORMAL: return normalResource
        case .NIGHT:  return nightResource
        }
    }
}

public class MixedImage: MixedResource<UIImage> {}
public class MixedColor: MixedResource<UIColor> {
    public init(normal: Int, night: Int) {
        let normalColor = UIColor(rgb: normal)
        let nightColor = UIColor(rgb: night)
        super.init(normal: normalColor, night: nightColor)
    }
}

