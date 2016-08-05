//
//  EditDepartmentCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class EditDepartmentCell: BaseTableCell {
    static let cellIdentifier = String(EditDepartmentCell)

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var swichView: UISwitch!
    @IBOutlet private weak var arrowView: UIImageView!
    

    var item: EditDepartmentItem? {
        didSet {
            mode = item!.type
            titleLabel.text = item!.title
            subtitleLabel.text = item!.subtitle
        }
    }
    
    var mode: EditDepartmentCellType? {
        didSet {
            switch mode! {
            case .arrowType:
                swichView.hidden = true
                arrowView.hidden = false
            case .switchType:
                swichView.hidden = false
                arrowView.hidden = true
            }
        }
    }

}
