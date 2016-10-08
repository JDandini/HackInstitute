//
//  TextViewVC.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/8/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class TextViewVC: UIViewController {

    @IBOutlet weak var tfTitle:UITextField!
    @IBOutlet weak var tvBody:UITextView!
    @IBOutlet weak var vwContainerTV:UIView!
    @IBOutlet weak var svForm:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: .UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: .UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.svForm.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    //MARK: Notification Handler
    func keyboardDidShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            self.svForm.contentInset = contentInsets
            self.svForm.scrollIndicatorInsets = contentInsets
            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.size.height
            let vw = tfTitle.isFirstResponder ? tfTitle : vwContainerTV
            if !aRect.contains((vw?.frame.origin)!){
                self.svForm.scrollRectToVisible((vw?.frame)!, animated: true)
            }
        }
    }
    func keyboardWillBeHidden(notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        self.svForm.contentInset = contentInsets
        self.svForm.scrollIndicatorInsets = contentInsets
    }

}

// MARK: - UITextFieldDelegate
extension TextViewVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tvBody.becomeFirstResponder()
        return true
    }
}


// MARK: - UITextViewDelegate
extension TextViewVC:UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Escribe algo" {
            textView.text = ""
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if  textView.text == "" {
            textView.text = "Escribe algo"
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"{
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}
