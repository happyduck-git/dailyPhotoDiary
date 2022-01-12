//
//  ViewController.swift
//  photoDiary
//
//  Created by HappyDuck on 2022/01/12.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "오늘의 단상"
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.27*charIndex, repeats: false) { (Timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {

    }
    
   
}
