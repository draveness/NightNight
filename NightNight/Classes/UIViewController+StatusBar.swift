////
////  UIViewController+StatusBar.swift
////  Pods
////
////  Created by Draveness on 7/11/16.
////
////
//
//import Foundation
//
//protocol MixedStatusBarStyleProtocol {
//    func preferredMixedStatusBarStyle() -> MixedStatusBarStyle
//}
//
//public extension UIViewController {
//    private struct AssociatedKeys {
//        static var mixedPreferredStatusBarStyleKey = "mixedPreferredStatusBarStyleKey"
//    }
//
//    var mixedPreferredStatusBarStyle: MixedStatusBarStyle {
//        get {
//            if let style = objc_getAssociatedObject(self, &AssociatedKeys.mixedPreferredStatusBarStyleKey) as? MixedStatusBarStyle {
//                return style
//            }
//
//            let defaultStyle = MixedStatusBarStyle(normal: .Default, night: .Default)
//            self.mixedPreferredStatusBarStyle = defaultStyle
//
//            return self.mixedPreferredStatusBarStyle
//        }
//        set {
//            objc_setAssociatedObject(self, &AssociatedKeys.mixedPreferredStatusBarStyleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//
////            NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(updatePreferredStatusBarStyle), name: NightNightThemeChangeNotification, object: nil)
//        }
//    }
//
//    func updatePreferredStatusBarStyle() {
//        self.setNeedsStatusBarAppearanceUpdate()
//    }
//}
