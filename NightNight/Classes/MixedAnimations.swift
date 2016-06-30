//
//  MixedAnimations.swift
//  Pods
//
//  Created by Draveness on 6/30/16.
//
//

import Foundation

func MixedAnimations(animation: () -> ()) -> () {
    UIView.beginAnimations(nil, context: nil)

    animation()

    UIView.commitAnimations()
}
