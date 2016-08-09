//
//  EditDepartmentCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/5/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit
import MagicalRecord


class EditDepartmentCell: BaseTableCell {
    
    static let cellIdentifier = String(EditDepartmentCell)
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var editView: UITextField!
    @IBOutlet private weak var swichView: UISwitch!
    @IBOutlet private weak var arrowView: UIImageView!
    
    // MARK: - @IBAction
    @IBAction func didChangeTextField() {
        delegate?.didChangeTextField(self, textData: editView.text!)
    }
    
    @IBAction func didChangeSwitchState() {
        delegate?.didChangeSwitchState(self, isOn: swichView.on)
    }
    
    // MARK: - Delegate
    weak var delegate: EditDepartmentCellDelegate?
    
    // MARK: - Data
    var item: EditDepartmentItem? {
        didSet {
            mode = item!.type
            titleLabel.text = item!.title
            subtitleLabel.text = item!.subtitle
            editView.text = item!.subtitle
            swichView.on = item!.switchState
        }
    }
    
    var mode: EditDepartmentCellType? {
        didSet {
            swichView.hidden = true
            arrowView.hidden = true
            editView.hidden = true
            
            switch mode! {
            case .arrowType:
                arrowView.hidden = false
            case .switchType:
                swichView.hidden = false
            case .editType:
                editView.hidden = false
                subtitleLabel.hidden = true
            }
        }
    }
}

