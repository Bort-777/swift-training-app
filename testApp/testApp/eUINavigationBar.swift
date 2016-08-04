//
//  eUINavigationBar.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func applyDefaultStyles() {
        setBackgroundImage(UIImage(named: "bottomBar"), forBarPosition: .Any, barMetrics: .Default)
        titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        tintColor = UIColor.whiteColor()
    }
}
