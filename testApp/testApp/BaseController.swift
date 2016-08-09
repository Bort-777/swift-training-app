//
//  TemplateController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/3/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationBackground()
    }
    
    // MARK: - Default Actions
    private func configurationBackground() {
        let backgroundView = UIImageView(frame: self.view.frame)
        backgroundView.contentMode = .ScaleAspectFill
        backgroundView.image = UIImage(named: "viewBgr")
        self.view.insertSubview(backgroundView, atIndex: 0)
    }
    
    // MARK: - Keyboard Actions
    func keyboardOn() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification:NSNotification) {
        adjustingFrameHeight(true, notification: notification)
    }
    
    func keyboardWillHide(notification:NSNotification) {
        adjustingFrameHeight(false, notification: notification)
    }
    
    func adjustingFrameHeight(show:Bool, notification:NSNotification) {
        assert(false, "need Override func to implement keyboardOn")
    }
}
