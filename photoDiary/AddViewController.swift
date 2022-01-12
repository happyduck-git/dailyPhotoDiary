//
//  AddViewController.swift
//  photoDiary
//
//  Created by HappyDuck on 2022/01/12.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet var datePicker: UIDatePicker!
    var dateF = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        captionTextView.delegate = self
//        captionTextView.text = "떠오르는 생각을 적어보세요"
//        captionTextView.textColor = UIColor.lightGray
        textViewDidBeginEditing(captionTextView)
        textViewDidEndEditing(captionTextView)
        hideKeyboardWhenTappedAround()
        
       
    }
    
    
    

    @IBOutlet var captionTextView: UITextView!

}

extension AddViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray{
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.text = "떠오르는 생각을 적어보세요"
            textView.textColor = UIColor.lightGray
        }
    }

}

extension AddViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


