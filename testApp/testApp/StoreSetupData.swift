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
    var type: SetupCellType
    var title: String
    var subtitle: String?
    var imageName: String?
    var menuSegue: String?
    
    init(index: Int) {
        item = StoreSetup(rawValue: index)!
        switch item {
        case .vendors:
            title = "Vendors"
            subtitle = "Vendors"
            type = .arrowType
            imageName = "dept"
            
        case .department:
            title = "Department"
            subtitle = "12 items"
            type = .arrowType
            imageName = "vendors"
            menuSegue = Constant.sDepartment
            
        case .taxes:
            title = "Taxes"
            subtitle = "Vendors"
            type = .arrowType
            imageName = "taxes"
            
        case .costTracking:
            title = "Cost Tracking"
            type = .switchType
            imageName = "cost"
            
        case .lookDescriptions:
            title = "Look Descriptions"
            type = .switchType
            imageName = "lookup"
            
        case .clearInventory:
            title = "Clear Inventory"
            subtitle = "Vendors"
            type = .defaultType

        case .restore:
            title = "Restore"
            type = .defaultType
        }
    }
}