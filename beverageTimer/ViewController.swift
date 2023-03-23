//
//  ViewController.swift
//  beverageTimer
//
//  Created by AM on 3/21/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    let beverageTimes = ["Green Tea": 25, "Milk": 10, "Coffee": 30]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var drinks: String = ""
    var sound: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        do {
            let url = Bundle.main.url(forResource: "chimeSound", withExtension: "mp3")!
            sound = try AVAudioPlayer(contentsOf: url)
            sound?.prepareToPlay()
        } catch {
            print("Error loading sound file: \(error)")
        }
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func beverageSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let drinks = sender.currentTitle!
        totalTime = beverageTimes[drinks]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "Preparing your \(drinks).."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            let remainingTime = totalTime - secondsPassed
            titleLabel.text = "\(remainingTime) seconds left, please wait."
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLabel.text = "Here's your Drink!"
            sound?.play()
        }
    }
    
}
