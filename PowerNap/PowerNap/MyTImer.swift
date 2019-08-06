//
//  MyTImer.swift
//  PowerNap
//
//  Created by Blake kvarfordt on 8/5/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation


class MyTimer {
    var timer: Timer?
    
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
    
    func secondTicked() {
        
    }
    
}
