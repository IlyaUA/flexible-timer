//
//  FlexibleTimer.swift
//  FlexibleTimer
//
//  Created by Ilya on 21.10.2023.
//

import UIKit

class FlexibleTimer: UIView {

    @IBOutlet weak var timeLabel: UILabel!
    private var timer: Timer?
    private var seconds: Int
    
    init(frame: CGRect, minutes: Int) {
        self.seconds = minutes * 60
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func closeButtonDidTap(_ sender: Any) {
        timerFinished()
    }
}

private extension FlexibleTimer {
    
    func setupUI() {
        let nib = UINib(nibName: "FlexibleTimer", bundle: nil)
        let contentView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(contentView)
        contentView.frame = self.bounds
        
        self.backgroundColor = .black
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        self.addGestureRecognizer(panGesture)
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func timerFinished() {
        stopTimer()
        removeFromSuperview()
    }

    @objc func updateTime() {
        seconds -= 1
        let minutes = seconds / 60
        let sec = seconds % 60
        timeLabel.text = String(format: "%02d:%02d", minutes, sec)
        
        if seconds <= 0 {
            timerFinished()
        }
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.superview)
        self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: self.superview)
    }
}
