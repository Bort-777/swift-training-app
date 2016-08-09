//
//  StoreSetupTableViewCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class StoreSetupCell: BaseTableCell {
    
    static let cellIdentifier = String(StoreSetupCell)
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var swichView: UISwitch!
    @IBOutlet private weak var arrowView: UIImageView!
    
    @IBOutlet weak var topTitleConstraint: NSLayoutConstraint!
    @IBOutlet weak var subtiteCostraint: NSLayoutConstraint!
    @IBOutlet weak var titleConstraint: NSLayoutConstraint!
    
    // MARK: - Data
    var item: StoreSetupItem? {
        didSet {
            mode = item!.type
            titleLabel.text = item!.title
            if let subtitle = item!.subtitle {
                subtitleLabel.text = subtitle
                topTitleConstraint.active = true
            }
            else {
                subtitleLabel.text = nil
                topTitleConstraint.active = false
            }
            if let imageName = item!.imageName {
                iconView.image = UIImage(named: imageName)
                titleConstraint.active = true
            }
            else {
                iconView.image = nil
                titleConstraint.active = false
            }
        }
    }
    
    var mode: SetupCellType? {
        didSet {
            switch mode! {
                case .arrowType:
                    swichView.hidden = true
                    arrowView.hidden = false
                case .switchType:
                    swichView.hidden = false
                    arrowView.hidden = true
                case .defaultType:
                    swichView.hidden = true
                    arrowView.hidden = true
            }
        }
    }
}