//
//  ViewController.swift
//  beverageTimer
//
//  Created by AM on 3/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    let beverageTimes = ["GreenTea": 120, "Milk": 180, "Coffee": 420]
    
    var secondsRemaining = 60
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func beverageSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let drinks = sender.currentTitle!
        
        secondsRemaining = beverageTimes[drinks]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining)seconds until done")
            secondsRemaining -= 1
        }
    }
    
}
