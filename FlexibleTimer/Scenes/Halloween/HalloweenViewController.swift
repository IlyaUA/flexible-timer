//
//  HalloweenViewController.swift
//  FlexibleTimer
//
//  Created by Ilya on 21.10.2023.
//

import UIKit
import Lottie

class HalloweenViewController: UIViewController {

    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFullScreenAnimation(with: LottieAnimationName.halloweenJuice, animationView: &animationView, parentView: animationView)
    }
}
