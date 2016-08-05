//
//  Taxes.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation
import CoreData
import SwiftyJSON

@objc(Taxe)
class Taxe: NSManagedObject {
    
    // Attributes
    @NSManaged var name: String
    @NSManaged var department: Department

    // Init
    func initData(json: JSON) {
        name = json["name"].stringValue
    }
}
