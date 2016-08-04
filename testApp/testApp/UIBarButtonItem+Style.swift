//
//  ViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    static func applyDefaultStyles() {
        appearance().setBackButtonBackgroundImage(UIImage(named: "backButton"), forState: .Normal, barMetrics: .Default)
        appearance().setBackgroundImage(UIImage(named: "rightItem"), forState: .Normal, barMetrics: .Default)
    }
}
