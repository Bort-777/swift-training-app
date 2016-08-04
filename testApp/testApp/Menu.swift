//
//  Menu.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation

enum Menu: Int {
    case inventoryList
    case stockLevels
    case storeSetup
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Menu(rawValue: max) { max += 1 }
        return max
    }()
    
//    static func menuSegue(item item: Menu) -> String? {
//        switch item {
//        case .storeSetup:
//            return Constant.sStoreSetup
//        default:
//            return nil
//        }
//    }
   }

class MenuItem {
    
    var item: Menu
    var menuTitle: String
    var menuImage: String
    var menuSegue: String?
    
    init(index: Int) {
        item = Menu(rawValue: index)!
        switch item {
        case .inventoryList:
            menuTitle = "Inventory List"
            menuImage = "inventoryLogo"
        case .stockLevels:
            menuTitle = "Stock Levels"
            menuImage = "adjustLogo"
        case .storeSetup:
            menuTitle = "Store Setup"
            menuImage = "storeLogo"
            menuSegue = Constant.sStoreSetup
        }
    }
}


