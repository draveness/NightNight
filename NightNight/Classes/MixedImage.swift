//
//  MixedImage.swift
//  Pods
//
//  Created by Draveness on 7/8/16.
//
//

import Foundation

public class MixedImage {
    public let normalImage: UIImage
    public let nightImage: UIImage

    init(normal: UIImage, night: UIImage) {
        normalImage = normal
        nightImage = night
    }

    func unfold() -> UIImage {
        switch NightNight.theme {
        case .NORMAL: return normalImage
        case .NIGHT:  return nightImage
        }
    }
}