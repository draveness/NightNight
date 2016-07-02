//
//  ViewController.swift
//  NightNight
//
//  Created by Draveness on 06/18/2016.
//  Copyright (c) 2016 Draveness. All rights reserved.
//

import UIKit
import NightNight

class ViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.mixedBackgroundColor = MixedColor(normal: 0xffffff, night: 0x000000)
        print(view.mixedBackgroundColor?.nightColor)

        label.frame = view.frame
        label.text = "NightNight"
        label.mixedTextColor = MixedColor(normal: 0x000000, night: 0xffffff)
        view.addSubview(label)

    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            NightNight.theme = .NIGHT

//            UIView.beginAnimations(nil, context: nil)
//
//            self.view.backgroundColor = UIColor.blackColor()
//            self.label.textColor = UIColor.whiteColor()
//
//            UIView.commitAnimations()

        }
    }

}

