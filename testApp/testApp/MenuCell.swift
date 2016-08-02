//
//  MenuTableViewCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    static let cellIdentifier = String(MenuCell)
    
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clearColor()
    }

    var item: MenuItem? {
        didSet {
            nameLabel.text = item!.menuTitle
            iconView.image = UIImage(named: item!.menuImage)
        }
    }
}