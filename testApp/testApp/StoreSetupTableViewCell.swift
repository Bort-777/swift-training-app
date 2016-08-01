//
//  StoreSetupTableViewCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var swichView: UISwitch!
    @IBOutlet private weak var arrowView: UIImageView!
    
    var mode: SetupCellType? {
        didSet {
            switch mode! {
                case .arrowType:
                    arrowView.hidden = false
                case .switchType:
                    swichView.hidden = false
                case .defaultType:
                    break
            }
        }
    }
    
    func setTextData(labelText labelText: String, sublineText: String?, imageName: String?) {
        titleLabel.text = labelText
        subtitleLabel.text = sublineText
        if let name = imageName {
            iconView.image = UIImage(named: name)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}