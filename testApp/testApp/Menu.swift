//
//  Menu.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation

enum Menu: Int {
    case inventoryList, stockLevels, storeSetup
    
    static let count: Int = {
        var max: Int = 0
        while let _ = Menu(rawValue: max) { max += 1 }
        return max
    }()
    
    static func menuTitle(item item: Menu) -> String {
        // 
        
        
        switch item {
        case .inventoryList:
            return "Inventory List"
        case .stockLevels:
            return "Stock Levels"
        case .storeSetup:
            return "Store Setup"
        }
    }
    
    static func menuImage(item item: Menu) -> String {
        switch item {
        case .inventoryList:
            return "inventoryLogo"
        case .stockLevels:
            return "adjustLogo"
        case .storeSetup:
            return "storeLogo"
        }
    }
    
    static func menuSegue(item item: Menu) -> String? {
        switch item {
        case .storeSetup:
            return Constant.sStoreSetup
        default:
            return nil
        }
    }
}


