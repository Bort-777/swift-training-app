//
//  ViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class BaseTableCell: UITableViewCell {

    var cellPosition = CellPosition.single {
        didSet {
            switch cellPosition {
            case .single:
                backgroundView = UIImageView(image: UIImage(named: "cellBottom"))
            case .top:
                backgroundView = UIImageView(image: UIImage(named: "cellTop"))
            case .center:
                backgroundView = UIImageView(image: UIImage(named: "cellCenter"))
            case .bottom:
                backgroundView = UIImageView(image: UIImage(named: "cellBottom"))
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clearColor()
    }
}
