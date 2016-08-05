//
//  Taxes.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import Foundation
import SwiftyJSON

class Taxes {
    var name: String

    init(json: JSON) {
        name = json["name"].stringValue
    }
}
