//
//  ViewController.swift
//  Egg-Timer
//
//  Created by Julia Pabst on 28.12.23.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
   
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    
    @IBOutlet var topLabel: UILabel!
    var timer: Timer?

    override func viewDidLoad() {
       super.viewDidLoad()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func startTimer(time: Int) {
        var secondsRemaining = time
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
           guard let self = self else { return }
           if secondsRemaining > 0 {
               print("\(secondsRemaining) seconds remaining")
               secondsRemaining -= 1
           } else {
               self.timer?.invalidate()
               print("Timer completed")
               topLabel.text = "Done!"
               stopTimer()
           }
           }
       }

      

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        if(sender.tag == 0){
            stopTimer()
            startTimer(time: eggTimes["Soft"]!)
            print(eggTimes["Soft"]!)
        } else if(sender.tag == 1){
            stopTimer()
            startTimer(time: eggTimes["Medium"]!)
            print(eggTimes["Medium"]!)
        } else {
            stopTimer()
            startTimer(time: eggTimes["Hard"]!)
            print(eggTimes["Hard"]!)
        }
        
        
      
    }
    
}

