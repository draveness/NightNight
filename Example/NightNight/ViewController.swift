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
    let button = UIButton(type: .Custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)

        button.setTitle("NightNight", forState: .Normal)
        button.setMixedTitleColor(MixedColor(normal: 0x000000, night: 0xffffff), forState: .Normal)
        button.addTarget(self, action: #selector(changeTheme), forControlEvents: .TouchUpInside)
        button.frame = view.frame
        view.addSubview(button)

        navigationItem.title = "NightNight"
        navigationController?.navigationBar.mixedTitleTextAttributes = [NNForegroundColorAttributeName: MixedColor(normal: 0x000000, night: 0xfafafa)]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Normal",
                                                           style: .Done,
                                                           target: self,
                                                           action: #selector(changeToNormal))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Night",
                                                            style: .Done,
                                                            target: self,
                                                            action: #selector(changeToNight))
        navigationController?.navigationBar.mixedBarTintColor = MixedColor(normal: 0xffffff, night: 0x222222)
        navigationController?.navigationBar.mixedTintColor = MixedColor(normal: 0x0000ff, night: 0xfafafa)

        // Change bar style will change status bar style cuz current view controller is a child of navigation controller, preferredStatusBarStyle will never be called http://stackoverflow.com/questions/19022210/preferredstatusbarstyle-isnt-called .
        navigationController?.navigationBar.mixedBarStyle = MixedBarStyle(normal: .Default, night: .Black)
    }

    func setupLabel() {
        label.frame = view.frame
        label.text = "NightNight"

//        let attributedString = NSMutableAttributedString(string: "NightNight")
//        attributedString.setMixedAttributes(
//            [NNForegroundColorAttributeName: MixedColor(normal: 0x000000, night: 0xfafafa)],
//            range: NSRange(location: 0, length: 9)
//        )
//        label.attributedText = attributedString

        label.textAlignment = .Center
        label.mixedTextColor = MixedColor(normal: 0x000000, night: 0xfafafa)
        view.addSubview(label)
    }

    func changeToNormal() {
        NightNight.theme = .NORMAL
    }

    func changeToNight() {
        NightNight.theme = .NIGHT
    }

    func changeTheme() {
        if NightNight.theme == .NIGHT {
            NightNight.theme = .NORMAL
        } else {
            NightNight.theme = .NIGHT
        }
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        print("preferredStatusBarStyle called.")
        return MixedStatusBarStyle(normal: .Default, night: .LightContent).unfold()
    }

}

