//
//  UIButton+Mixed.swift
//  Pods
//
//  Created by Draveness on 7/10/16.
//
//

import Foundation

public extension UIButton {
    public func setMixedTitleColor(_ color: MixedColor, forState state: UIControlState) {
        mixedTitleColorDictionary[NSNumber(controlState: state)] = color
        setTitleColor(color.unfold(), for: state)
    }

//    public func setMixedTitleShadowColor(_ color: MixedColor, forState state: UIControlState) {
//        mixedTitleShadowColorDictionary[NSNumber(controlState: state)] = color
//        setTitleShadowColor(color.unfold(), for: state)
//    }

    public func setMixedImage(_ image: MixedImage, forState state: UIControlState) {
        mixedImageDictionary[NSNumber(controlState: state)] = image
        setImage(image.unfold(), for: state)
    }

//    public func setMixedBackgroundImage(_ backgroundImage: MixedImage, forState state: UIControlState) {
//        mixedBackgroundImageDictionary[NSNumber(controlState: state)] = backgroundImage
//        setBackgroundImage(backgroundImage.unfold(), for: state)
//    }

    public override func _updateCurrentStatus() {
        super._updateCurrentStatus()

        mixedTitleColorDictionary.forEach { (state, mixedColor) in
            setTitleColor(mixedColor.unfold(), for: UIControlState(number: state))
        }

//        mixedTitleShadowColorDictionary.forEach { (state, mixedColor) in
//            setTitleShadowColor(mixedColor.unfold(), for: UIControlState(number: state))
//        }

        mixedImageDictionary.forEach { (state, mixedImage) in
            setImage(mixedImage.unfold(), for: UIControlState(number: state))
        }

//        mixedBackgroundImageDictionary.forEach { (state, mixedImage) in
//            setBackgroundImage(mixedImage.unfold(), for: UIControlState(number: state))
//        }
    }
}

// MARK: - Storage
private extension UIButton {
    struct AssociatedKeys {
        static var mixedTitleColorDictionaryKey = "mixedTitleColorDictionaryKey"
//        static var mixedTitleShadowColorDictionaryKey = "mixedTitleShadowColorDictionaryKey"
        static var mixedImageDictionaryKey = "mixedImageDictionaryKey"
//        static var mixedBackgroundImageDictionaryKey = "mixedBackgroundImageDictionaryKey"
    }
    var mixedTitleColorDictionary: [NSNumber: MixedColor] {
        get {
            if let dict = objc_getAssociatedObject(self, &AssociatedKeys.mixedTitleColorDictionaryKey) as? [NSNumber: MixedColor] {
                return dict
            }

            self.mixedTitleColorDictionary = [:]

            NotificationCenter.default.addObserver(self, selector: #selector(_updateTheme), name: NSNotification.Name(rawValue: NightNightThemeChangeNotification), object: nil)

            return self.mixedTitleColorDictionary
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedTitleColorDictionaryKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

//    var mixedTitleShadowColorDictionary: [NSNumber: MixedColor] {
//        get {
//            if let dict = objc_getAssociatedObject(self, &AssociatedKeys.mixedTitleShadowColorDictionaryKey) as? [NSNumber: MixedColor] {
//                return dict
//            }
//
//            self.mixedTitleShadowColorDictionary = [:]
//
//            NotificationCenter.default.addObserver(self, selector: #selector(_updateTheme), name: NSNotification.Name(rawValue: NightNightThemeChangeNotification), object: nil)
//
//            return self.mixedTitleShadowColorDictionary
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.mixedTitleShadowColorDictionaryKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }

    var mixedImageDictionary: [NSNumber: MixedImage] {
        get {
            if let dict = objc_getAssociatedObject(self, &AssociatedKeys.mixedImageDictionaryKey) as? [NSNumber: MixedImage] {
                return dict
            }

            self.mixedImageDictionary = [:]

            NotificationCenter.default.addObserver(self, selector: #selector(_updateTheme), name: NSNotification.Name(rawValue: NightNightThemeChangeNotification), object: nil)

            return self.mixedImageDictionary
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.mixedImageDictionaryKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

//    var mixedBackgroundImageDictionary: [NSNumber: MixedImage] {
//        get {
//            if let dict = objc_getAssociatedObject(self, &AssociatedKeys.mixedBackgroundImageDictionaryKey) as? [NSNumber: MixedImage] {
//                return dict
//            }
//
//            self.mixedBackgroundImageDictionary = [:]
//
//            NotificationCenter.default.addObserver(self, selector: #selector(_updateTheme), name: NSNotification.Name(rawValue: NightNightThemeChangeNotification), object: nil)
//
//            return self.mixedBackgroundImageDictionary
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.mixedBackgroundImageDictionaryKey, newValue as AnyObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
}

private extension UIControlState {
    init(number: NSNumber) {
        self.init(rawValue: number.uintValue)
    }
}

private extension NSNumber {
    convenience init(controlState: UIControlState) {
        self.init(value: controlState.rawValue as UInt)
    }
}
