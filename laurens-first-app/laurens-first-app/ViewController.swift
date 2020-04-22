//
//  ViewController.swift
//  laurens-first-app
//
//  Created by Lauren Moor on 20/04/2020.
//  Copyright © 2020 Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countdown: UILabel!
    var timer = Timer()
    var seconds = 3
    var segues = ["goToBigHero", "goToToyStory", "goToTangled", "goToRatatouille"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countdown.text = "Ready..."
        
    }

    @IBAction func whichMovie(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
    
    @objc func timerCount() {
        if (seconds > 0) {
            countdown.text = String(seconds)
            seconds -= 1
        } else {
            timer.invalidate()
            countdown.text = "Ready..."
            seconds = 3
            let randomNumber = Int.random(in: 0...3)
            self.performSegue(withIdentifier: segues[randomNumber], sender: self)
        }
    }
    
}

