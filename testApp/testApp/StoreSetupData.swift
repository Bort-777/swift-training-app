//
//  StoreSetupData.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation

enum SetupCellType {
    case arrowType
    case switchType
    case defaultType
}

class StoreSetupData {
    private let items = ["Vendors",
                         "Departments",
                         "Taxes",
                         "Cost Tracking",
                         "Look up item descriptions",
                         "Clear Inventory",
                         "Restore from backup"]
    
    private let type = ["Departments" : SetupCellType.arrowType,
                         "Vendors": SetupCellType.arrowType,
                         "Taxes": SetupCellType.arrowType,
                         "Cost Tracking": SetupCellType.switchType,
                         "Look up item descriptions": SetupCellType.switchType,
                         "Clear Inventory": SetupCellType.defaultType,
                         "Restore from backup": SetupCellType.defaultType]
    
    private let subtitle = ["Departments" : "21 configured",
                            "Vendors" : "0 configured",
                            "Taxes" : "15 configured",
                            "Clear Inventory" : "18 configured"]
    
    private let imageNames = ["Departments" : "dept"]
    
    
    var count: Int {
        get {
            return items.count
        }
    }
    
    func getItemName(index: Int) -> String {
        return items[index]
    }
    
    func getItemImage(title key: String) -> String? {
        return imageNames[key]
    }
    
    func getItemSubtitle(title key: String) -> String? {
        return subtitle[key]
    }
    
    func getItemType(title key: String) -> SetupCellType {
        return type[key]!
    }
    
}