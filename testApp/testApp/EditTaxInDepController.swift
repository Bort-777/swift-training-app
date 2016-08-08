//
//  EditTaxInDepController.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/8/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

import UIKit

class EditTaxInDepController: BaseController {
    let heightRow = CGFloat(56)
    
    var data: [Taxe]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EditTaxInDepController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightRow
    }
}

extension EditTaxInDepController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(EditTaxInDepCell.cellIdentifier, forIndexPath: indexPath) as! EditTaxInDepCell
        cell.data = data![indexPath.row]
        cell.cellPosition = tableView.tableCellPosition(at: indexPath)
        
        return cell
    }
}