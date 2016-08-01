//
//  Menu.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation

class Menu {
    private let items = ["Inventory List", "Adjust Stock Levels", "Store Setup"]
    
    var count : Int {
        get {
            return items.count
    
        }
    }
    
    func menuItem(index index: Int) -> String {
        return items[index]
    }
}
