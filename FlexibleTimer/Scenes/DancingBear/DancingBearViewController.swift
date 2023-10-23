//
//  DancingBearViewController.swift
//  FlexibleTimer
//
//  Created by Ilya on 21.10.2023.
//

import UIKit
import Lottie

class DancingBearViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFullScreenAnimation(with: LottieAnimationName.dancingBear, animationView: &animationView, parentView: animationView)
    }
    
    @IBAction func timerButtonDidTap(_ sender: Any) {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            let topWindow = scene.windows.sorted(by: { $0.windowLevel.rawValue < $1.windowLevel.rawValue }).last
            
            if topWindow?.viewWithTag(1001) == nil {
                let timerView = FlexibleTimer(frame: CGRect(x: 0, y: 0, width: 170, height: 60), minutes: 10)
                timerView.tag = 1001
                timerView.center = topWindow?.center ?? CGPoint.zero
                topWindow?.addSubview(timerView)
                timerView.startTimer()
            }
        }
    }

}
