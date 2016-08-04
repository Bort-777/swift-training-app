//
//  TemplateController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/3/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        configurationBackground()
    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    private func configurationBackground() {
        let backgroundView = UIImageView(frame: self.view.frame)
        backgroundView.contentMode = .ScaleAspectFill
        backgroundView.image = UIImage(named: "viewBgr")
        self.view.insertSubview(backgroundView, atIndex: 0)
    }
    
//    func configurationNavigationBar() {
    

        
//        configurationStatusBar()
//    }
    
//    private func configurationStatusBar() {
//        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0))
//        view.backgroundColor = UIColor.blackColor()
//        self.view.addSubview(view)
//    }
    
    func keyboardOn() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingHeight(false, notification: notification)
    }
    
    func adjustingHeight(show:Bool, notification:NSNotification) {
        assert(false, "need Override func to implement keyboardOn")
    }
}
