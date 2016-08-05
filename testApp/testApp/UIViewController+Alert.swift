//
//  UIViewController+Alert.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorAlertController(error: ErrorType) {
        var title: String = ""
        switch error {
        case .badResponse:
            title = "Try again"
        case .badReques:
            title = "Server is not available"
        case .badData:
            title = "Server is not available"
        }
        
        let alertController = UIAlertController(title: "Error", message:
            title, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
