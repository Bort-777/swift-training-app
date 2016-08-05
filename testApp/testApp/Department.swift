//
//  Department.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Department)
class Department: NSManagedObject {
    
    // Attributes
    @NSManaged var name: String
    
    func initData(json: JSON) {
        name = json["name"].stringValue
        print(json)
    }
}
