//
//  TimerToFrontProtocol.swift
//  FlexibleTimer
//
//  Created by Ilya on 24.10.2023.
//

import UIKit

protocol TimerToFrontProtocol: AnyObject {
    func bringTimerToTop()
}

extension TimerToFrontProtocol {
    func bringTimerToTop() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            if let topWindow = scene.windows.sorted(by: { $0.windowLevel.rawValue < $1.windowLevel.rawValue }).last {
                if let timerView = topWindow.viewWithTag(1001) {
                    topWindow.bringSubviewToFront(timerView)
                }
            }
        }
    }
}
