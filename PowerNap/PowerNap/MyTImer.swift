//
//  MyTImer.swift
//  PowerNap
//
//  Created by Blake kvarfordt on 8/5/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func timerSecondTicked()
    func timerHasStopped()
    func timerHasCompleted()
}

class MyTimer {
    private var timer: Timer?
    
    weak var delegate: MyTimerDelegate?
    
    var timeLeft: TimeInterval?
    var isOn: Bool {
        if timeLeft == nil {
            return false
        } else {
            return true
        }
    }
    
    func startTimer(time: TimeInterval) {
        if isOn {
            print("mistake was made. timer should not be restarted")
        } else {
            timeLeft = time
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    func stopTimer() {
        self.timeLeft = nil
        timer?.invalidate()
        print("stop timer")
        delegate?.timerHasStopped()
    }
    
    func timeLeftAsString() -> String {
        let timeRemaining = Int(self.timeLeft ?? 20 * 60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft * 60)
        return String(format: "%02d : %02d", [minutesLeft, secondsLeft])
    }
    
    private func secondTicked() {
        guard let timeLeft = timeLeft else {
            print("time left is not set up")
            return
        }
        
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(self.timeLeftAsString())
            delegate?.timerSecondTicked()
        } else {
            self.timeLeft = nil
            timer?.invalidate()
            print("stop timer")
            delegate?.timerHasCompleted()
        }
    }
    
}
