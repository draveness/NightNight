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
    let button = UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.mixedBackgroundColor = MixedColor(normal: 0xfafafa, night: 0x222222)

//        setupLabel()

        button.setTitle("NightNight", for: UIControl.State())
        button.setMixedTitleColor(MixedColor(normal: 0x000000, night: 0xffffff), forState: UIControl.State())
        button.addTarget(self, action: #selector(changeTheme), for: .touchUpInside)
        button.frame = view.frame
        view.addSubview(button)

        navigationItem.title = "NightNight"
        navigationController?.navigationBar.mixedTitleTextAttributes = [NNForegroundColorAttributeName: MixedColor(normal: 0x000000, night: 0xfafafa)]
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Normal",
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(changeToNormal))
        
        let nightModeButtonItem = UIBarButtonItem(image: nil, style: .done, target: self, action: #selector(changeToNight))
        nightModeButtonItem.mixedImage = MixedImage(normal: UIImage(named: "lightModeButton")!, night: UIImage(named: "nightModeButton")!)
        navigationItem.setRightBarButton(nightModeButtonItem, animated: true)
        
        navigationController?.navigationBar.mixedBarTintColor = MixedColor(normal: 0xffffff, night: 0x222222)
        navigationController?.navigationBar.mixedTintColor = MixedColor(normal: 0x0000ff, night: 0xfafafa)

        // Change bar style will change status bar style cuz current view controller is a child of navigation controller, preferredStatusBarStyle will never be called http://stackoverflow.com/questions/19022210/preferredstatusbarstyle-isnt-called .
        navigationController?.navigationBar.mixedBarStyle = MixedBarStyle(normal: .default, night: .black)
    }

    func setupLabel() {
        label.frame = view.frame
//        label.text = "NightNight"

        let attributedString = NSMutableAttributedString(string: "NightNight")
        attributedString.setMixedAttributes(
            [NNForegroundColorAttributeName: MixedColor(normal: 0x000000, night: 0xfafafa)],
            range: NSRange(location: 0, length: 9)
        )
        label.attributedText = attributedString

        label.textAlignment = .center
//        label.mixedTextColor = MixedColor(normal: 0x000000, night: 0xfafafa)
        view.addSubview(label)
    }

    @objc func changeToNormal() {
        NightNight.theme = .normal
    }

    @objc func changeToNight() {
        NightNight.theme = .night
    }

    @objc func changeTheme() {
        if NightNight.theme == .night {
            NightNight.theme = .normal
        } else {
            NightNight.theme = .night
        }
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return MixedStatusBarStyle(normal: .default, night: .lightContent).unfold()
    }

}

