//
//  MainViewController.swift
//  photoDiary
//
//  Created by HappyDuck on 2022/01/12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    @IBOutlet var initialImage: UIImageView!
    @IBOutlet var initialLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(refreshLbl),
                                                   name: NSNotification.Name(rawValue: "refresh"),
                                                   object: nil)
        
    }
    
    @objc func refreshLbl() {
        print("Received Notification")
        if initialLabel.isHidden == false && initialImage.isHidden == false{
            initialLabel.isHidden = true
            initialImage.isHidden = true
        }
    }
    


}
