//
//  ViewController.swift
//  Egg-Timer
//
//  Created by Julia Pabst on 28.12.23.
//

import UIKit
import Foundation
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
   
    let eggTimes: [String: Float] = ["Soft": 200, "Medium": 420, "Hard": 720]
    
    @IBOutlet var topLabel: UILabel!
    var timer: Timer?

    @IBOutlet var progressBar: UIProgressView!
    
    override func viewDidLoad() {
       super.viewDidLoad()
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        
        if(sender.tag == 0){
            stopTimer()
            startTimer(totalTime: eggTimes["Soft"]!)
            topLabel.text = "You chose: Soft"
            print(eggTimes["Soft"]!)
        } else if(sender.tag == 1){
            stopTimer()
            startTimer(totalTime: eggTimes["Medium"]!)
            topLabel.text = "You chose: Medium"
            print(eggTimes["Medium"]!)
        } else {
            stopTimer()
            startTimer(totalTime: eggTimes["Hard"]!)
            topLabel.text = "You chose: Hard"
            print(eggTimes["Hard"]!)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    func startTimer(totalTime: Float) {
        var secondsRemaining: Float = 0
       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
           guard let self = self else { return }
           if secondsRemaining < totalTime {
               secondsRemaining += 1
               print("\(secondsRemaining) seconds remaining")
               progressBar.progress = secondsRemaining / totalTime
           } else {
               self.timer?.invalidate()
               print("Timer completed")
               topLabel.text = "Done!"
               playSound(soundName: "alarm_sound")
               stopTimer()
           }
           }
       }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

