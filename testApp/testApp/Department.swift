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
    var title: String
    
    init(json: JSON) {
        title = json["id"].stringValue
    }
}
