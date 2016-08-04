//
//  ViewController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/4/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

enum CellPosition: Int {
    case top = 0, center, bottom, single
}

extension UITableView {
    
    func tableCellPosition(at indexPath: NSIndexPath) -> CellPosition {
        let rows = self.numberOfRowsInSection(indexPath.section)
        
        if rows == 1 {
            return .single
        }
        if indexPath.row == 0 {
            return .top
        } else if indexPath.row == rows - 1 {
            return .bottom
        }
        return .center
    }
}