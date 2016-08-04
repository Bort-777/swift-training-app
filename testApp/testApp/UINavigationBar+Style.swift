//
//  eUINavigationBar.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

extension UINavigationBar {
    static func applyDefaultStyles() {
        appearance().clipsToBounds = true
        appearance().setBackgroundImage(UIImage(named: "bottomBar"), forBarPosition: .Any, barMetrics: .Default)
        appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        appearance().tintColor = UIColor.whiteColor()
    }
}
