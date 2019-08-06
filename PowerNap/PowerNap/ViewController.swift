//
//  ViewController.swift
//  PowerNap
//
//  Created by Blake kvarfordt on 8/5/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    var myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        myTimer.startTimer(time: 20)
        myTimer.delegate = self
    }
  
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("button works")
    }
    
    func updateLabelAndButotn() {
        timerLabel.text = myTimer.timeLeftAsString()
        var title = "Start Nap"
        if myTimer.isOn {
            title = "stop"
        }
        timerButton.setTitle(title, for: .normal)
    }
    
}

extension ViewController: MyTimerDelegate {
    func timerSecondTicked() {
        updateLabelAndButotn()
    }
    
    func timerHasStopped() {
       updateLabelAndButotn()
    }
    
    func timerHasCompleted() {
        updateLabelAndButotn()
    }
    
    
}
