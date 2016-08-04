//
//  ViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

extension UITableView {
    func applyCustomBackgroundView(index: Int) -> UIImageView {
        switch index {
        case 0:
            if StoreSetup.count == 1 {
                return UIImageView(image: UIImage(named: "cellBottom"))
            }
            else {
                return UIImageView(image: UIImage(named: "cellTop"))
            }
        case StoreSetup.count - 1:
            return UIImageView(image: UIImage(named: "cellBottom"))
        default:
            return UIImageView(image: UIImage(named: "cellMiddleBottom"))
        }
    }
}