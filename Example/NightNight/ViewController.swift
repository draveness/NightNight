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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.mixedBackgroundColor = MixedColor(normal: 0xffffff, night: 0xff0000)
        print(self.view.mixedBackgroundColor?.nightColor)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

