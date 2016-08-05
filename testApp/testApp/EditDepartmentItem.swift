//
//  EditDepartmentItem.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation

enum EditDepartmentCellType {
    case arrowType
    case switchType
}

enum EditDepartment : Int {
     case name, active, icon, itemEBT, taxes, items
    
    static let count: Int = {
        var max: Int = 0
        while let _ = EditDepartment(rawValue: max) { max += 1 }
        return max
    }()
}

class EditDepartmentItem {
    
    var item: EditDepartment
    var department: Department
    var type: EditDepartmentCellType
    var title: String?
    var subtitle: String = ""
    var menuSegue: String?
    
    init(index: Int, department: Department) {
        
        self.department = department
        item = EditDepartment(rawValue: index)!
        switch item {
        case .name:
            title = "Name"
            subtitle = department.name
            type = .arrowType
        case .active:
            title = "Active"
            type = .switchType
        case .icon:
            title = "Icon"
            type = .arrowType
        case .itemEBT:
            title = "Items are EBT"
            type = .switchType
        case .taxes:
            title = "Applied Taxes"
//            for taxe in department.taxes {
//                print(subtitle)
//                subtitle = subtitle + taxe.name + " "
//            }
            type = .arrowType
        case .items:
            title = "Applied Item"
            type = .arrowType
        }
    }}