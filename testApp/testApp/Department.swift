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
    @NSManaged var id: Int
    @NSManaged var name: String
    @NSManaged var activ: Bool
    @NSManaged var taxes: Set<Taxe>
}
