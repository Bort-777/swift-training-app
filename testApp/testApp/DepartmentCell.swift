//
//  TableViewCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class DepartmentCell: BaseTableCell {
    
    static let cellIdentifier = String(DepartmentCell)

    // MARK: - Outlets
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Data
    var item: Department? {
        didSet {
            title.text = item!.name
        }
    }
}
