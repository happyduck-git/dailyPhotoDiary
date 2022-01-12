//
//  AddViewController.swift
//  photoDiary
//
//  Created by HappyDuck on 2022/01/12.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var testLabel2: UILabel!
    let imagePickerController = UIImagePickerController()
    var mainVC = MainViewController()
    var hourAndMinute = "시간을 선택해주세요."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        captionTextView.delegate = self
        imagePickerController.delegate = self

        textViewDidBeginEditing(captionTextView)
        textViewDidEndEditing(captionTextView)
        hideKeyboardWhenTappedAround()
        
        //testLabel2에 현재 시간 자동으로 표시하기
        testLabel2.text = "\(datePicker.date.getHourMinute().hour): \(datePicker.date.getHourMinute().minute)"
    }
    

    @IBAction func addPictureBtnPressed(_ sender: UIButton) {

        let actionSheet = UIAlertController(title: "사진선택", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePickerController.sourceType = .camera
                self.present(self.imagePickerController, animated: true, completion: nil)
            }else{
                print("Camera not available")
            }

        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }

    //MARK: - DatePiackerValueChanged
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        testLabel2.text = "\(sender.date.getHourMinute().hour): \(sender.date.getHourMinute().minute)"
        hourAndMinute = "\(sender.date.getHourMinute().hour): \(sender.date.getHourMinute().minute)"
        print(hourAndMinute)
    }
    
    @IBAction func uploadBtnPressed(_ sender: UIBarButtonItem) {
        mainVC.testLabel?.text = hourAndMinute //고치기(mainVC testLabel에 값 안나옴.)
    }
    
    @IBOutlet var captionTextView: UITextView!

}
//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
//MARK: - UITextViewDelegate

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
//MARK: - HideKeyboardWhenTappedAround
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


