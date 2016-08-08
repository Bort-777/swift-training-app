//
//  taxesCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/8/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class TaxesCell: BaseTableCell {

    static let cellIdentifier = String(TaxesCell)
    
    // MARK: - Outlets
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Data
    var item: Taxe? {
        didSet {
            title.text = item!.name
        }
    }
}
