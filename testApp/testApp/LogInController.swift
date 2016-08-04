//
//  LogInController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/2/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class LogInController: BaseController {

    @IBOutlet weak var loginIdField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var logInButton: UIButton!
    
//    private var keyboardActive = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardOn()
    }
    
    override func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
        let changeInHeight = CGRectGetHeight(keyboardFrame)
        
        UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
            self.bottomConstraint.constant = show ? changeInHeight : 180
        })
    }
    
    @IBAction func touchLogIn() {
        self.performSegueWithIdentifier(Constant.sLogIn, sender: self)
    }
}

extension LogInController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch textField {
        case loginIdField:
            passwordField.becomeFirstResponder()
        case passwordField:
            textField.resignFirstResponder()
            touchLogIn()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
	