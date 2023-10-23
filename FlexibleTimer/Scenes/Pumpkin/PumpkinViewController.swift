//
//  PumpkinViewController.swift
//  FlexibleTimer
//
//  Created by Ilya on 21.10.2023.
//

import UIKit
import Lottie

class PumpkinViewController: UIViewController, TimerToFrontProtocol {

    private var animationView: LottieAnimationView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFullScreenAnimation(with: LottieAnimationName.pumpkin, animationView: &animationView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bringTimerToTop()
    }
}
