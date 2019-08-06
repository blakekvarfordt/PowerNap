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
    
        myTimer.startTimer(time: 100)
    }

    
    
    
  
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("button works")
    }
    
}

