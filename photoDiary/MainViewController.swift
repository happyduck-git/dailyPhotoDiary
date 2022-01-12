//
//  MainViewController.swift
//  photoDiary
//
//  Created by HappyDuck on 2022/01/12.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
