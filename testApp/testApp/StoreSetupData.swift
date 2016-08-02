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

enum StoreSetup : Int{
    case vendors
    case department
    case taxes
    case costTracking
    case lookDescriptions
    case clearInventory
    case restore
    
    static let count: Int = {
        var max: Int = 0
        while let _ = StoreSetup(rawValue: max) { max += 1 }
        return max
    }()
}

class StoreSetupItem {
    var item: StoreSetup
    
    init(index: Int) {
        item = StoreSetup(rawValue: index)!
    }
    
    var getItemType: SetupCellType {
        switch item {
        case .vendors, .department, .taxes:
            return .arrowType
        case .costTracking, .lookDescriptions:
            return .switchType
        case .clearInventory, .restore:
            return .defaultType
        }
    }
    
    var getItemName: String {
        switch item {
        case .vendors:
            return "Vendors"
        case .department:
            return "Department"
        case  .taxes:
            return "Taxes"
        case  .costTracking:
            return "Cost Tracking"
        case  .lookDescriptions:
            return "Look Descriptions"
        case  .clearInventory:
            return "Clear Inventory"
        case .restore:
            return "Restore"
        }
    }
    
    var getItemSubtitle: String? {
        switch item {
        case .vendors:
            return "Vendors"
        case .department:
            return "Department"
        case  .taxes:
            return "Taxes"
        case  .clearInventory:
            return "Clear Inventory"
        default:
            return nil
        }
    }
    
    var getItemImage: String? {
        switch item {
        case .department:
            return "dept"
        case .vendors:
            return "vendors"
        case .taxes:
            return "taxes"
        case .costTracking:
            return "cost"
        case .lookDescriptions:
            return "lookup"
        default:
            return nil
        }
    }
}