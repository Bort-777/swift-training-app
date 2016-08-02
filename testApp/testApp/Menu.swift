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
    
    static func getMenuTitle(item item: Menu) -> String {
        switch item {
        case .inventoryList:
            return "Inventory List"
        case .stockLevels:
            return "Stock Levels"
        case .storeSetup:
            return "Store Setup"
        }
    }
    
    static func getMenuImage(item item: Menu) -> String {
        switch item {
        case .inventoryList:
            return "Inventory List"
        case .stockLevels:
            return "Adjust Stock Levels"
        case .storeSetup:
            return "Store Setup"
        }
    }
}


