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
    @NSManaged var taxes: Set<Taxe>
    
    // Init
    func initData(json: JSON) {
        name = json["name"].stringValue
        for taxe in json["taxes"].arrayValue {
            let tempTaxe = Taxe.MR_createEntity()! as Taxe
            tempTaxe.initData(taxe)
            taxes.insert(tempTaxe)
        }
        NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        print(json)
    }
}
