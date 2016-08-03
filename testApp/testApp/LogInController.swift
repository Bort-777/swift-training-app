//
//  LogInController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/2/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class LogInController: TemplateController {

    @IBOutlet weak var loginIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    private var keyboardActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LogInController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LogInController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification) {
        if !keyboardActive {
            keyboardActive = !keyboardActive
            adjustingHeight(keyboardActive, notification: notification)
        }
    }
    
    func keyboardWillHide(notification:NSNotification) {
        keyboardActive = !keyboardActive
        adjustingHeight(keyboardActive, notification: notification)
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        let changeInHeight = (CGRectGetHeight(keyboardFrame)) * (show ? 1 : -1)
        
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant += changeInHeight
        })
    }
}

extension LogInController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
	