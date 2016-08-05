//
//  Department.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation
import SwiftyJSON

class Department {
    var name: String
    var appliedTaxes: String
    var menuSegue: String?
    
    init(json: JSON) {
        name = json["name"].stringValue
        appliedTaxes = json["taxes"][0]["name"].stringValue
    }
}
