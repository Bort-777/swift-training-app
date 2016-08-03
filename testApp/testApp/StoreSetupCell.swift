//
//  StoreSetupTableViewCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupCell: UITableViewCell {
    
    static let cellIdentifier = String(StoreSetupCell)
    
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var swichView: UISwitch!
    @IBOutlet private weak var arrowView: UIImageView!
    
    var item: StoreSetupItem? {
        didSet {
            mode = item!.getItemType
            titleLabel.text = item!.getItemName
            subtitleLabel.text = item!.getItemSubtitle
            if let imageName = item!.getItemImage {
                iconView.image = UIImage(named: imageName)
            }
            else {
                
            }
        }
    }
    
    var mode: SetupCellType? {
        didSet {
            switch mode! {
                case .arrowType:
                    swichView.hidden = true
                case .switchType:
                    arrowView.hidden = true
                case .defaultType:
                    swichView.hidden = true
                    arrowView.hidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clearColor()
    }
}