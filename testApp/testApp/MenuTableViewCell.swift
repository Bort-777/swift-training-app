//
//  MenuTableViewCell.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/1/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var iconView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func editData(menuItem item: Menu) {
        nameLabel.text = Menu.getMenuTitle(item: item)
        iconView.image = UIImage(named: Menu.getMenuImage(item: item))
    }
    
}