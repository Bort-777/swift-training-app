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
    
    var item: StoreSetup? {
        didSet {
            mode = StoreSetup.getItemType(item: item!)
            titleLabel.text = StoreSetup.getItemName(item: item!)
            subtitleLabel.text = StoreSetup.getItemSubtitle(item: item!)
            if let imageName = StoreSetup.getItemImage(item: item!) {
                iconView.image = UIImage(named: imageName)
            }
        }
    }
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowView.hidden = true
        swichView.hidden = true
    }
}