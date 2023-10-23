//
//  UIViewController+Lottie.swift
//  FlexibleTimer
//
//  Created by Ilya on 21.10.2023.
//

import UIKit
import Lottie

extension UIViewController {
    func setupFullScreenAnimation(with animationName: String, animationView: inout LottieAnimationView?, parentView: UIView? = nil) {
        animationView = .init(name: animationName)
        guard (animationView != nil) else { return }
        if parentView != nil {
            animationView!.frame = parentView!.frame
        } else {
            animationView!.frame = view.bounds
        }
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
    }
}

