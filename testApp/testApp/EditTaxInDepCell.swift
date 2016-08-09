//
//  EditTaxInDepCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/8/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class EditTaxInDepCell: BaseTableCell {

    static let cellIdentifier = String(EditTaxInDepCell)
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Data
    var data: Taxe? {
        didSet {
            titleLabel.text = data?.name
            selected = true
        }
    }

}
